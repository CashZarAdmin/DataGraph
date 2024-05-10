function processFile(graphData) {
    const graph = graphData;
    for (const [key, nodeInfo] of Object.entries(graph)) {
        addNodeIfNotExist(key, nodeInfo.name);

        nodeInfo.relationships.forEach(relationship => {
            Object.entries(relationship).forEach(([type, relatedNodes]) => {
                relatedNodes.forEach(relatedNodeId => {
                    addNodeIfNotExist(relatedNodeId, graph[relatedNodeId]?.name);
                    addEdge(key, relatedNodeId, type);
                });
            });
        });
    }
}

function addNodeIfNotExist(nodeId, label = "", isNew = false) {
    if (!nodes.get(nodeId)) {
        nodes.add({
            id: nodeId,
            label: label,
            color: isNew ? newNodeStyle.color : defaultNodeStyle.color,
        });
    }
}

function addEdge(fromId, toId, type) {
    edges.add({
        from: fromId,
        to: toId,
        label: type,
        color: getColor(type)
    });
}

function getColor(label) {
    let hash = 0;
    for (let i = 0; i < label.length; i++) {
        hash = label.charCodeAt(i) + ((hash << 5) - hash);
    }
    const color = (hash & 0x00FFFFFF).toString(16).toUpperCase();
    return "#" + "00000".substring(0, 6 - color.length) + color;
}

function exportGraphData(network) {
    const nodesArray = network.body.data.nodes.get();
    const edgesArray = network.body.data.edges.get();

    // First, create a map from node IDs to their full data including relationships arrays
    const graph = nodesArray.reduce((acc, node) => {
        acc[node.id] = {
            name: node.label,
            description: node.description || "this is description", // Default description or existing
            relationships: []
        };
        return acc;
    }, {});

    // Process each edge to populate the relationships structure
    edgesArray.forEach(edge => {
        const sourceId = edge.from;
        const targetId = edge.to;
        const type = edge.label;

        // Ensure there is a relationship object for this type
        let relationship = graph[sourceId].relationships.find(r => r[type]);
        if (!relationship) {
            relationship = { [type]: [] };
            graph[sourceId].relationships.push(relationship);
        }

        // Add the target node to the specific relationship type array if it's not already included
        if (!relationship[type].includes(targetId)) {
            relationship[type].push(targetId);
        }
    });

    // Return the structured graph as a stringified JSON
    return JSON.stringify(graph, null, 4);  // Pretty print JSON
}

function downloadGraphData(network) {
    // Assuming exportGraphData is a function that returns your graph data as a JSON string
    var jsonExport = exportGraphData(network);
    var blob = new Blob([jsonExport], { type: 'application/json' });
    var url = URL.createObjectURL(blob);

    var downloadAnchorNode = document.createElement('a');
    downloadAnchorNode.href = url;
    downloadAnchorNode.download = "graph_data.json";
    document.body.appendChild(downloadAnchorNode);
    downloadAnchorNode.click();
    document.body.removeChild(downloadAnchorNode); // Immediately remove the element

    URL.revokeObjectURL(url); // Clean up the URL object
}
