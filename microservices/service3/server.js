const express = require('express');
const app = express();

app.get('/message', (req, res) => {
  res.json({ message: 'Hello from Service 3!' });
});

app.listen(5003, () => console.log('Service 3 running on port 5003'));
