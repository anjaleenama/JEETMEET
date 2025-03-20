const mongoose = require('mongoose');

const MenuItemSchema = new mongoose.Schema({

    name: { 
        type: String, 
        required: true 
    },
    route: { 
        type: String, 
        required: true 
    },
    icon: { 
        type: String 
    },
    subMenu: [{ 
        type: mongoose.Schema.Types.ObjectId, 
        ref: 'MenuItem' }]
},{timestamps: true});

const MenuItem = mongoose.model('MenuItem', MenuItemSchema);

module.exports = { MenuItem };
