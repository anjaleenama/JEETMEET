const asyncHandler = require('express-async-handler');
const mongoose = require('mongoose');
const MenuItem = require('../model/menuModel').MenuItem;

const menuController = {
    getMenu: asyncHandler(async (req, res) => {
        const menuItems = await MenuItem.find().populate({
            path: 'subMenu',
            populate: { path: 'subMenu' }
        });
        res.status(200).json(menuItems);
    }),

    createMenuItem: asyncHandler(async (req, res) => {
        const { name, route, icon, subMenu } = req.body;
        const menuItem = await MenuItem.create({ 
            name, 
            route, 
            icon, 
            subMenu 
        });
        if (!menuItem) {
            return res.status(400).json({ message: 'Failed to create menu item' });
        }
        res.status(201).json(menuItem);
    }),

    createSubMenuItem: asyncHandler(async (req, res) => {
        const { parentId, name, route, icon } = req.body;
        const parentMenu = await MenuItem.findById(parentId);
        if (!parentMenu) {
            return res.status(404).json({ message: 'Parent menu not found' });
        }
        const subMenuItem = await MenuItem.create({ name, route, icon });
        parentMenu.subMenu.push(subMenuItem._id);
        await parentMenu.save();
        res.status(201).json(subMenuItem);
    }),

    updateMenuItem: asyncHandler(async (req, res) => {
        const { id } = req.params;
        const menuItem = await MenuItem.findById(id);
        if (!menuItem) {
            return res.status(404).json({ message: 'Menu item not found' });
        }
        const updatedMenuItem = await MenuItem.findByIdAndUpdate(id, req.body, { new: true });
        res.status(200).json(updatedMenuItem);
    }),

    deleteMenuItem: asyncHandler(async (req, res) => {
        const { id } = req.params;
        const menuItem = await MenuItem.findById(id);
        if (!menuItem) {
            return res.status(404).json({ message: 'Menu item not found' });
        }
        await MenuItem.deleteMany({ _id: { $in: menuItem.subMenu } });
        await menuItem.deleteOne();
        res.status(200).json({ message: 'Menu item and its submenus deleted successfully' });
    })
};

module.exports = menuController;