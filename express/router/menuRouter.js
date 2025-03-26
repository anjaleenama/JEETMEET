const express = require('express');
const menuController = require('../controllers/menuController');

const menuRouter = express.Router();

menuRouter.get('/', menuController.getMenu);
menuRouter.post('/', menuController.createMenuItem);
menuRouter.post('/submenu', menuController.createSubMenuItem);
menuRouter.put('/:id', menuController.updateMenuItem);
menuRouter.delete('/:id', menuController.deleteMenuItem);

module.exports = menuRouter;
