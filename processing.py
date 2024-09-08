from os import makedirs
from os.path import join, exists
from typing import Callable
from sknetwork.visualization import visualize_graph
from sknetwork.data.parse import from_edge_list
from circuit import Circuit
from graph import Graph

def process_circuit(circuit_file: str, out_dir: str, clustering_function: Callable[[Graph], list[int]], max_runs=1) -> int:
    circuit = Circuit.from_qasm(circuit_file)
    graph = circuit.generate_weighted_graph()
    graph_history, labels_history = graph.reduce_graph(clustering_function, max_runs=max_runs)

    for evolution in range(len(graph_history)):
        evolution_dirname = "evolution-" + str(evolution)
        visual_dir = join(out_dir, "visuals", evolution_dirname)
        data_dir = join(out_dir, "data", evolution_dirname)
        if not exists(visual_dir):
            makedirs(visual_dir)
        if not exists(data_dir):
            makedirs(data_dir)

        # save data
        with open(join(data_dir, "circuit.json"), "w+") as data_file:
            data_file.write(circuit.toJSON())

        # generate svg
        sknetwork_graph = from_edge_list(graph_history[evolution].edge_list, weighted=True)
        visualize_graph(sknetwork_graph, filename=join(visual_dir, "graph")) # type: ignore
        visualize_graph(sknetwork_graph, filename=join(visual_dir, "graph_w"), display_edge_weight=True) # type: ignore

        if (evolution < len(labels_history)): # Last graph has no labels
            circuit = circuit.get_updated_circuit_by_labels(labels_history[evolution])
            visualize_graph(sknetwork_graph, filename=join(visual_dir, "graph_l"), labels=labels_history[evolution]) # type: ignore
            visualize_graph(sknetwork_graph, filename=join(visual_dir, "graph_wl"), labels=labels_history[evolution], display_edge_weight=True) # type: ignore
    return len(labels_history) # return actual runs