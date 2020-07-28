from module import *
import numpy as np

# First try: generate and plot an ER graph
have_a_try = False
if have_a_try:
  G = er_graph(20, 0.2)
  nx.draw(G, with_labels=True, node_size=40,
      node_color='lightblue', edge_color='gray')
  plt.savefig('fig/er_graph_0-2_visual.pdf')
  plt.close()

  G1 = er_graph(500, 0.08)
  plot_degree_distribution(G1)
  G2 = er_graph(500, 0.08)
  plot_degree_distribution(G2)
  G3 = er_graph(500, 0.08)
  plot_degree_distribution(G3)
  plt.savefig('fig/er_graph_0-08_hist.pdf')
  plt.close()

# Case of social network
## load and visualize the social network data
A1 = np.loadtxt('data/adj_allVillageRelationships_vilno_1.csv', delimiter=',')
A2 = np.loadtxt('data/adj_allVillageRelationships_vilno_2.csv', delimiter=',')
G1 = nx.to_networkx_graph(A1)
G2 = nx.to_networkx_graph(A2)
print('')
print('For G1,')
print_basic_net_stats(G1)
print('')
print('For G2,')
print_basic_net_stats(G2)
print('')
plot_degree_distribution(G1)
plot_degree_distribution(G2)
plt.savefig('fig/village_hist.pdf')
plt.close()

## find and plot the largest connected component
G1_LCC = max(nx.connected_component_subgraphs(G1), key=len)
G2_LCC = max(nx.connected_component_subgraphs(G2), key=len)
print('')
print('For G1_LCC,')
print_basic_net_stats(G1_LCC)
print('')
print('For G2_LCC,')
print_basic_net_stats(G2_LCC)
print('')
nx.draw(G1_LCC, node_colors='red', edge_color='gray', node_size=20)
plt.savefig('fig/village1_LCC.pdf')
plt.close()
nx.draw(G1_LCC, node_colors='green', edge_color='gray', node_size=20)
plt.savefig('fig/village2_LCC.pdf')
plt.close()
