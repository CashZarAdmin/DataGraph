import networkx as nx
import matplotlib.pyplot as plt
import json

# Path to your JSON file
file_path = 'path_to_your_file.json'

# Read the JSON data from file
with open(file_path, 'r') as file:
    data = json.load(file)

# Create the graph
G = nx.DiGraph()  # Directed graph if relationships have direction

# Process the data to add nodes and edges
for key, details in data['graph'].items():
    if 'nodes' in details:
        for node in details['nodes']:
            G.add_node(node)
            G.add_edge(key, node)

# Optional: Add more sophisticated parsing depending on your data structure

# Plotting
pos = nx.spring_layout(G)  # Layout for the nodes
nx.draw(G, pos, with_labels=True, node_color='lightblue', edge_color='k', node_size=2000, font_size=9)
plt.show()
