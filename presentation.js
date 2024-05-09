
const defaultNodeStyle = {
    color: {
        background: 'white',
        border: 'black'
    }
};

const newNodeStyle = {
    color: {
        background: 'lightblue', 
        border: 'blue'
    }
};

const nodeStyles = {
    default: {
        background: '#ccc',
        border: '#999',
        highlight: {
            background: '#eee',
            border: '#666'
        },
        font: {color: 'black'}
    }
};

const edgeStyles = {
    color: 'black',
    font: {color: 'black', size: 14}
};

function initializeGraph() {
    nodes = new vis.DataSet();
    edges = new vis.DataSet();

    var container = document.getElementById('mynetwork');
    var data = { nodes: nodes, edges: edges };
    var options = {
        nodes: nodeStyles.default,
        edges: edgeStyles,
        manipulation: {
            enabled: false
        },
        interaction: {
            hover: true
        }
    };
    network = new vis.Network(container, data, options);
}

