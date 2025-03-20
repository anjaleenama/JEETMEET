const {default : mongoose} = require('mongoose');

const eventSchema = new mongoose.Schema({

    eventTitle: {
        type: String,
        required: true
    },
    Type: {
        type: String,
        required: true
    },
    Date: {
        type: Date,
        required: true
    },
    exDate: {
        type: Date,
        required: true
    },
    classDivision: {
        type: String,
        required: true
    },
    Time: {
        type: String,
        required: true
    }
}, { timestamps: true});

const Events = mongoose.model('Events',eventSchema);

module.exports = Events;