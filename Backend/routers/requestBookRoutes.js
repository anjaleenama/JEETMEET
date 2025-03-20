const express = require('express');
const requestBookController = require('../controllers/requestBookController');

const requestBookRoutes = express.Router();

requestBookRoutes.post('/', requestBookController.create);
requestBookRoutes.get('/', requestBookController.getAll);
requestBookRoutes.get('/:id', requestBookController.getById);
requestBookRoutes.put('/:id', requestBookController.update);
requestBookRoutes.delete('/:id', requestBookController.delete);

module.exports = requestBookRoutes;
