const express = require('express');
const axios = require('axios');
const path = require('path');
const app = express();

app.use(express.static(path.join(__dirname, 'public')));

app.get('/api/message', async (req, res) => {
  try {
    const response = await axios.get('http://localhost:5002/message'); // Microservicio 2
    res.json(response.data);
  } catch (error) {
    res.status(500).send({ message: 'Error fetching message from Service 2.' });
  }
});

app.listen(3002, () => console.log('Microfrontend 2 running on port 3002'));
