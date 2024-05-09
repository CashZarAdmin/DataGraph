var selectedNode = null;

function setupEventListeners() {

    var options = {
        manipulation: {
            addEdge: function(data, callback) {
                var label = prompt("Enter edge label:", "Type your label here");
                data.label = label ? label : "Default Label";
                callback(data);
            },
            editEdge: {
                editWithoutDrag: function(data, callback) {
                    var label = prompt("Edit edge label:", data.label);
                    if (label !== null) {
                        data.label = label;
                    }
                    callback(data);
                }
            },
            addNode: function(data, callback) {
                var label = prompt("Enter node label:", "New Node");
                data.label = label ? label : "Node";
                callback(data);
            },
            deleteNode: function(data, callback) {
                if (confirm("Are you sure you want to delete this node?")) {
                    callback(data);
                }
            },
            deleteEdge: function(data, callback) {
                if (confirm("Are you sure you want to delete this edge?")) {
                    callback(data);
                }
            }
        }
    };
    network.setOptions(options);

    // // Deleting a node
    // network.on("doubleClick", function (params) {
    //     if (params.nodes.length > 0) {
    //         var nodeId = params.nodes[0];
    //         network.body.data.nodes.remove(nodeId);
    //     }
    // });

    var inputElement = document.getElementById('nodeLabelInput');
    network.on("click", function (params) {
        if (params.nodes.length > 0) {
            var nodeId = params.nodes[0];
            var nodeData = nodes.get(nodeId);  // Retrieve the current node data
            var nodePosition = this.getPositions(nodeId);
            var nodeCoords = this.canvasToDOM({ x: nodePosition[nodeId].x, y: nodePosition[nodeId].y });

            // Position the input element over the node
            inputElement.style.left = nodeCoords.x + 'px';
            inputElement.style.top = nodeCoords.y + 'px';
            inputElement.style.display = 'block';

            // Set input value to the current label of the node
            inputElement.value = nodeData.label;  // Use current label, not the ID
            inputElement.focus();  // Focus the input element to start editing immediately

            // Event handler for when the input loses focus or the user presses enter
            inputElement.onblur = inputElement.onkeypress = function (e) {
                // Check for blur event or 'Enter' key press
                if (e.type !== 'keypress' || e.key === 'Enter') {
                    // Update the node's label in the network dataset with the new value from the input
                    nodes.update({ id: nodeId, label: inputElement.value });
                    inputElement.style.display = 'none';  // Hide the input element after updating
                    inputElement.onblur = inputElement.onkeypress = null;  // Clean up event listeners to prevent memory leaks
                }
            };
        }
    });


    // var nodeIdCounter = 0; // Helper counter to assign unique IDs to new nodes
    // network.on("doubleClick", function (params) {
    //     if (params.nodes.length === 0) {  // Check if no nodes were clicked
    //         var canvasPosition = params.pointer.canvas; // Get the position of the click on the canvas

    //         // Convert canvas position to network (DOM) position
    //         var domPosition = network.canvasToDOM({ x: canvasPosition.x, y: canvasPosition.y });

    //         // Add new node at the clicked position
    //         network.body.data.nodes.add({
    //             id: 'newNode' + nodeIdCounter++,  // Assign a unique ID to the new node
    //             label: 'New Node ' + nodeIdCounter,
    //             x: domPosition.x,
    //             y: domPosition.y,
    //             color: '#FF5733',  // Optional: specify the color of the node
    //             shape: 'circle'  // Optional: specify the shape of the node
    //         });
    //     }
    // });
}