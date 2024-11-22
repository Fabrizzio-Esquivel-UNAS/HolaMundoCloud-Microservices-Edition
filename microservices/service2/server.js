const express = require('express');
const app = express();

app.get('/message', (req, res) => {
  res.json({ message: 'Hello from Service 2!' });
});

app.listen(5002, () => console.log('Service 2 running on port 5002'));
