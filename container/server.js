const express = require('express');
const fs = require('fs');
const path = require('path');
const axios = require('axios');
const app = express();

app.get('/', async (req, res) => {
  const endpoints = [
    { url: 'http://localhost:3001/', name: 'Microfrontend 1' },
    { url: 'http://localhost:3002/', name: 'Microfrontend 2' },
    { url: 'http://localhost:3003/', name: 'Microfrontend 3' },
  ];

  // Fetch data with error handling
  const results = await Promise.all(
    endpoints.map(async (endpoint) => {
      try {
        await axios.get(endpoint.url);
        return `<iframe src="${endpoint.url}" style="width:100%; height:200px;"></iframe>`;
      } catch (error) {
        console.error(`Error loading ${endpoint.name}:`, error.message);
        return `<div style="width:100%; height:200px; border:1px solid red; display:flex; align-items:center; justify-content:center; color:red;">
                  Failed to load ${endpoint.name}
                </div>`;
      }
    })
  );

  // Load HTML template
  const indexPath = path.join(__dirname, 'views', 'index.html');
  let html = fs.readFileSync(indexPath, 'utf8');

  // Replace placeholder with dynamic content
  html = html.replace(
    '<div id="microfrontends"></div>',
    `<div id="microfrontends">${results.join('')}</div>`
  );

  res.send(html);
});

app.listen(8080, () => console.log('Container running on port 8080'));
