from sknetwork.clustering import Louvain, Leiden, KCenters
from sknetwork.data.parse import from_edge_list

from graph import Graph
from typing import Callable

def louvain(modularity="dugue")-> Callable[[Graph], list[int]]:
  def clustering_function(graph: Graph) -> list[int]:
    louvain = Louvain(modularity=modularity)
    adjacency = from_edge_list(graph.edge_list, weighted=True)
    return louvain.fit_predict(adjacency) # type: ignore
  return clustering_function

def leiden(modularity="dugue") -> Callable[[Graph], list[int]]:
  def clustering_function(graph: Graph) -> list[int]:
    leiden = Leiden(modularity=modularity)
    adjacency = from_edge_list(graph.edge_list, weighted=True)
    return leiden.fit_predict(adjacency) # type: ignore
  return clustering_function

def kcenters(mean_cluster_size: int) -> Callable[[Graph], list[int]]:
  def clustering_function(graph: Graph) -> list[int]:
    kcenters = KCenters(n_clusters = len(graph.node_weights) // mean_cluster_size)
    adjacency = from_edge_list(graph.edge_list, weighted=True)
    return kcenters.fit_predict(adjacency) # type: ignore
  return clustering_function