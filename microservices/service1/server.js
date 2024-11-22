const express = require('express');
const app = express();

app.get('/message', (req, res) => {
  res.json({ message: 'Hello from Service 1!' });
});

app.listen(5001, () => console.log('Service 1 running on port 5001'));
