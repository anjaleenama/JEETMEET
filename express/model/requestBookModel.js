const mongoose = require('mongoose');

const requestBookSchema = new mongoose.Schema({
    name: { 
        type: String, 
        required: true 
    },
    category: { 
        type: String, 
        required: true 
    },
    author: { 
        type: String, 
        required: true 
    },
    price: { 
        type: Number, 
        required: true 
    },
    status: { 
        type: String, 
        enum: ["Available", "Requested"],
        default: "Available" 
        },
    rackNo: { 
        type: String, 
        required: false 
    },
    subject: { 
        type: String, 
        required: false 
    }
}, { timestamps: true });

const RequestBook = mongoose.model('RequestBook', requestBookSchema);
module.exports = RequestBook;
