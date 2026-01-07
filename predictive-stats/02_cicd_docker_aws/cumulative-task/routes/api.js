const express = require('express');
const router = express.Router();

/**
 * @swagger
 * /api/hello:
 *   get:
 *     summary: Returns a greeting message
 *     responses:
 *       200:
 *         description: A greeting message
 */
router.get('/hello', (req, res) => {
    res.json({ message: 'Hello, world!' });
});

module.exports = router;
