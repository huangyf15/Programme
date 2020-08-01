import networkx as nx
from scipy.stats import bernoulli
import matplotlib.pyplot as plt
import numpy as np

def er_graph(N, p):
  '''
  Generate an ER graph.
  '''
  G = nx.Graph()
  G.add_nodes_from(range(N))
  for node1 in G.nodes():
    for node2 in G.nodes():
      if node1 < node2 and bernoulli.rvs(p=p):
        G.add_edge(node1, node2)
  return G


def plot_degree_distribution(G):
  '''
  Plot the degree distribution of the graph G.
  '''
  plt.hist(list(G.degree().values()), histtype='step')
  plt.xlabel('Degree $k$')
  plt.ylabel('$P(k)$')
  plt.title('Degree distribution')


def print_basic_net_stats(G):
  '''
  Print the basic net stats of the graph G.
  '''
  print('Number of nodes: %d' % G.number_of_nodes())
  print('Number of edges: %d' % G.number_of_edges())
  print('Average degree: %.2f' % np.mean(
      list(G.degree().values())))

