const express = require('express');
const swaggerUi = require('swagger-ui-express');
const swaggerJsdoc = require('swagger-jsdoc');
const apiRoutes = require('./routes/api');
const path = require('path');

const app = express();

// Swagger configuration
const swaggerOptions = {
    definition: {
        openapi: '3.0.0',
        info: {
            title: 'Simple Express App with Swagger',
            version: '1.0.0',
            description: 'A simple Express API with Swagger documentation',
        },
    },
    apis: ['./routes/*.js'], // Path to API documentation in route files
};

const swaggerSpecs = swaggerJsdoc(swaggerOptions);

// Middleware to serve Swagger UI
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerSpecs));

app.use('/api', apiRoutes);
// Routes
app.get('/', (req, res) => {
    res.status(200).sendFile(path.join(__dirname, './public/index.html'));
});
// Start the server
const PORT = 80;
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
    console.log(`Swagger docs available at http://localhost:${PORT}/api-docs`);
});
