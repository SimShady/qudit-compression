import sys
import json

def help():
  print("Usage: python circuitinfo.py path/to/circuit.json")

file = sys.argv[1]

if (len(sys.argv) < 2):
  help()
else:
  filename = sys.argv[1]
  try:
    with open(filename, 'r', encoding='utf-8') as file:
      data = json.load(file)
      qudits = data["qudits"]
      dimensions = [qudit["dimensions"] for qudit in qudits]
      local_gates = 0
      entangling_gates = 0
      for gate in data["gates"]:
        if len(gate["qudits"]) > 1:
          entangling_gates += 1
        else:
          local_gates += 1
      print("Number of qudits:", len(qudits))
      print("Qudit dimensions:", dimensions)
      print("Number of local gates:", local_gates)
      print("Number of entangling gates:", entangling_gates)
  except FileNotFoundError:
    print(f"Error: The file '{filename}' was not found.")