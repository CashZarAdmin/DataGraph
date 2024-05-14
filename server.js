const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const Groq = require('groq-sdk');


const app = express();
app.use(bodyParser.json());
app.use(cors());

const groq = new Groq({
    apiKey: process.env.GROQ_API_KEY
});
// const openai = new OpenAI();

app.post('/ask', async (req, res) => {
    const { userInput, graph } = req.body;
    console.error("graph**********", graph)
    try {

        const completion = await groq.chat.completions.create({
            messages: [{ role: 'user', content: `Given a graph ${graph}, suggest the connecting nodes based on input: ${userInput}. Return a json to construct the relationship between entities. so find the uuid of source node (from_uuid), and find the uuid of destination (to_uuid), and give a meaningful name relationship_name. return result in this format:[{"from_uuid":"","to_uuid":"","relationship_name":"","description":""}]` }],
            response_format: {
                type: "json_object"
            },
            model: "llama3-70b-8192",
        });

        // const completion = await openai.chat.completions.create({
        //     messages: [{ role: "user", content: `Given a graph "${graph}", suggest how to connect nodes based on userinput: "${userInput}". lets go step by step, suggest the relationship and then find the uuid of source node (from_uuid), and find the uuid of destination (to_uuid), and give a meaningful name relationship_name and response in this format(from_uuid, to_uuid, relationship_name)` }],
        //     model: "gpt-4",
        // });
        console.error(completion.choices[0].message.content)

        // const suggestion = completion.choices[0];
        const connections = parseGPTResponse(completion.choices[0].message.content);
        res.json({ connections });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Error processing your request.' });
    }
});

function parseGPTResponse(responseText) {
    console.error(responseText);
    return JSON.parse(responseText); // This is very simplistic and likely needs to be more robust.
}

const port = 3000;
app.listen(port, () => {
    console.log(`Server running on port ${port}`);
});


// account executive by region by sku1 by invoice