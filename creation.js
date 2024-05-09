function processFile(graphData) {
    const graph = graphData.graph;
    for (const [key, entries] of Object.entries(graph)) {
        addNodeIfNotExist(key);
        entries.forEach(entry => {
            Object.entries(entry).forEach(([edgeType, items]) => {
                items.forEach(item => {
                    addNodeIfNotExist(item);
                    addEdge(key, item, edgeType);
                });
            });
        });
    }
}

function addNodeIfNotExist(nodeId, isNew = false) {
    if (!nodes.get(nodeId)) {
        nodes.add({
            id: nodeId,
            label: nodeId,
            color: isNew ? newNodeStyle.color : defaultNodeStyle.color
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

// Function to backup the graph data and convert it to JSON
function exportGraphData(network) {
    var nodesArray = network.body.data.nodes.get();
    var edgesArray = network.body.data.edges.get();

    var structuredGraph = nodesArray.reduce((acc, node) => {
        acc[node.id] = [];
        return acc;
    }, {});

    // Process each edge to populate the connection structure
    edgesArray.forEach(edge => {
        let sourceId = edge.from;
        let targetId = edge.to;
        let label = edge.label;

        if (!structuredGraph[sourceId]) {
            structuredGraph[sourceId] = [];
        }

        // Find or create the type array for this edge type
        let connection = structuredGraph[sourceId].find(c => c.hasOwnProperty(label));
        if (!connection) {
            connection = { [label]: [] };
            structuredGraph[sourceId].push(connection);
        }

        // Add the target node to the connection type array if it's not already included
        if (!connection[label].includes(targetId)) {
            connection[label].push(targetId);
        }
    });

    // Return the structured graph as a stringified JSON
    return JSON.stringify({ "graph": structuredGraph }, null, 4);  // Pretty print JSON
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
