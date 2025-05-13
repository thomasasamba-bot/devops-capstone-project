const express = require('express');
const app = express();
const port = process.env.PORT || 3000;
const routes = require('./api/routes');

require('dotenv').config();

app.use(express.json());
app.use('/api', routes);

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
