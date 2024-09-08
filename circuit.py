import math
import json
from qiskit import QuantumCircuit

from graph import Graph

class Instruction:
    def __init__(self, name: str, qubits: list[int], params: list[float]):
        self.name = name
        self.qubits = qubits.copy()
        self.params = params.copy()

class Qudit:
    def __init__(self, number: int, dimensions: int):
        self.number = number
        self.dimensions = dimensions
    
    def toJSON(self) -> str:
        return json.dumps({
            "number": self.number,
            "dimensions": self.dimensions
        })

    def has_level(self, level: int) -> bool:
        return level >=0 and level < self.dimensions

class QuditGate:
    def __init__(self, name: str, qudits: list[Qudit], levels: list[int], euler_angles: tuple[float, float, float]=(0, 0, 0)):
        self.name = name
        self.qudits = qudits
        self.euler_angles = euler_angles
        for i in range(len(self.qudits)):
            qudit = self.qudits[i]
            level = levels[i]
            if (not qudit.has_level(levels[i])):
                raise ValueError(f"Qudit {qudit.number} has dimension {qudit.dimensions}, it has no level {level}")
        self.levels = levels

    def toJSON(self) -> str:
        return json.dumps({
            "name": self.name,
            "qudits": [qudit.number for qudit in self.qudits],
            "levels": self.levels,
            "euler_angles": self.euler_angles
        })

class Circuit:
    def __init__(self, qudits: list[Qudit], gate_list: list[QuditGate]):
        self.qudits = qudits
        self.gate_list = gate_list

    def toJSON(self) -> str:
        return json.dumps({
            "qudits": [json.loads(qudit.toJSON()) for qudit in self.qudits],
            "gates": [json.loads(gate.toJSON()) for gate in self.gate_list]
        })
    
    @staticmethod
    def from_qasm(file: str) -> "Circuit":
        qc = QuantumCircuit.from_qasm_file(file)
        instructions, num_qubits = Circuit.__collect_instructions(qc)
        qudits: list[Qudit] = [Qudit(i, 1) for i in range(num_qubits*2)]
        gate_list: list[QuditGate] = []
        for instruction in instructions:
            if instruction.name != "measure" and instruction.name != "barrier":
                if instruction.name == "cz":
                    control_qubit = instruction.qubits[0]
                    target_qubit = instruction.qubits[1]
                    control_qudit = qudits[control_qubit*2+1] # qubit level 1
                    target_qudit = qudits[target_qubit*2+1] # qubit level 1
                    gate = QuditGate("cz", [control_qudit, target_qudit], [0, 0])
                    gate_list.append(gate)
                else:
                    qubit = instruction.qubits[0]
                    gate_qudits = [qudits[qubit*2], qudits[qubit*2+1]]
                    euler_angles: tuple[float, float, float] = (0, 0, 0)
                    match instruction.name:
                        case "u1":
                            euler_angles = (0, 0, instruction.params[0])
                        case "u2":
                            euler_angles = (math.pi/2, instruction.params[1], instruction.params[0])
                        case "u3":
                            euler_angles = (instruction.params[2], instruction.params[1], instruction.params[0])
                        case _:
                            raise ValueError("Unsupported gate " + instruction.name)
                    gate = QuditGate("u", gate_qudits, [0, 0], euler_angles)
                    gate_list.append(gate)
        return Circuit(qudits, gate_list)
    
    def generate_weighted_graph(self, local_weight=400, entangling_weight=100) -> Graph:
        edge_list: list[tuple[int, int, int]] = []
        for gate in self.gate_list:
            edge_list.append((gate.qudits[0].number, gate.qudits[1].number, entangling_weight if gate.name == "cz" else local_weight))
        qudit_dimensions = [qudit.dimensions for qudit in self.qudits]
        return Graph(edge_list, node_weights=qudit_dimensions)
    
    def get_updated_circuit_by_labels(self, labels: list[int]) -> "Circuit":
        if (len(labels) != len(self.qudits)):
            raise ValueError("Every qudit needs a label")
        
        qudits = [Qudit(i, 0) for i in range(len(set(labels)))]
        for i, label in enumerate(labels):
            qudits[label].dimensions += self.qudits[i].dimensions
        
        new_gate_list: list[QuditGate] = []

        for gate in self.gate_list:
            gate_qudits: list[Qudit] = []
            gate_qudit_levels: list[int] = []
            first_level = (gate.qudits[0].number, gate.levels[0])
            second_level = (gate.qudits[-1].number, gate.levels[-1])
            first_compressed_level = self.__get_compressed_qudit_level(labels, first_level)
            second_compressed_level = self.__get_compressed_qudit_level(labels, second_level)
            gate_qudits.append(qudits[first_compressed_level[0]])
            if first_compressed_level[0] != second_compressed_level[0]:
                gate_qudits.append(qudits[second_compressed_level[0]])
            gate_qudit_levels.append(first_compressed_level[1])
            gate_qudit_levels.append(second_compressed_level[1])
            new_gate = QuditGate(gate.name, gate_qudits, gate_qudit_levels, gate.euler_angles)
            new_gate_list.append(new_gate)
        return Circuit(qudits, new_gate_list)     

    def __get_compressed_qudit_level(self, labels: list[int], qudit_level: tuple[int, int]) -> tuple[int, int]:
        grouped_labels: list[list[int]] = [[] for i in range(len(set(labels)))]
        for i in range(len(labels)):
            grouped_labels[labels[i]].append(i)
        
        original_qudits = [(qudit.number, qudit.dimensions) for qudit in self.qudits]
        
        original_qudit_idx, level_within_qudit = qudit_level

        for compressed_idx, label in enumerate(grouped_labels):
            if original_qudit_idx in label:
                offset = sum(original_qudits[i][1] for i in label if i < original_qudit_idx)
                new_level_within_compressed = offset + level_within_qudit
                return (compressed_idx, new_level_within_compressed)
        
        raise ValueError("No possible qudit level found")
        
 
    @staticmethod
    def __collect_instructions(qc: QuantumCircuit) -> tuple[list[Instruction], int]:
        num_qubits = len(qc.qubits)
        register_offset_mapper = {}
        last_offset = 0

        for register in qc.qregs:
            register_offset_mapper[register.name] = last_offset
            last_offset = last_offset + register.size

        instructions: list[Instruction] = []
        for _i, gate in enumerate(qc.data):
            name = ""
            qubits: list[int] = []
            params: list[float] = []

            for field in gate:
                if "library" in str(field) or "circuit" in str(field) or "Instruction" in str(field):
                    name = field.name
                    params = field.params

                if "QuantumRegister" in str(field):
                    qubits += [(register_offset_mapper[f._register.name] + f._index) for f in field]

            instructions.append(Instruction(name, qubits, params))

        return instructions, num_qubits