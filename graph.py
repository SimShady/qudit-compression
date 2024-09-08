from typing import Callable

class Graph:
    def __init__(self, edge_list: list[tuple[int, int, int]], node_weights: list[int]):
        self.edge_list = edge_list.copy()
        self.node_weights = node_weights.copy()
    
    def get_reduced_graph_by_label(self, labels: list[int]) -> "Graph":
        new_node_weights = [0]*len(set(labels))
        for i in range(len(labels)):
            label = labels[i]
            new_node_weights[label] += self.node_weights[i]

        new_edge_list = []
        for edge in self.edge_list:
            node1 = edge[0]
            node2 = edge[1]
            weight = edge[2]
            if labels[node1] != labels[node2]:
                new_edge_list.append((labels[node1], labels[node2], weight))
        return Graph(new_edge_list, new_node_weights)
    
    def reduce_graph(self, clustering_function: Callable[["Graph"], list[int]], max_runs=1) -> tuple[list["Graph"], list[list[int]]]:
        graph_history: list["Graph"] = []
        labels_history = []
        graph = self.copy()

        graph_history.append(graph)
        for runs in range(max_runs):
            labels = clustering_function(graph)
            graph = graph.get_reduced_graph_by_label(labels)
            if not graph.edge_list:
                break # stop if reduced graph does not have any edges left
            labels_history.append(labels)
            graph_history.append(graph.copy())
        return graph_history, labels_history
    
    def copy(self) -> "Graph":
        return Graph(self.edge_list.copy(), self.node_weights.copy())