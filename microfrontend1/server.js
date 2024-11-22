const express = require('express');
const axios = require('axios');
const path = require('path');
const app = express();

app.use(express.static(path.join(__dirname, 'public')));

app.get('/api/message', async (req, res) => {
  try {
    const response = await axios.get('http://localhost:5001/message'); // Microservicio 1
    res.json(response.data);
  } catch (error) {
    res.status(500).send({ message: 'Error fetching message from Service 1.' });
  }
});

app.listen(3001, () => console.log('Microfrontend 1 running on port 3001'));
