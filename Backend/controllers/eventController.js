const asyncHandler = require('express-async-handler');
const Events = require('../model/eventModel');
const mongoose = require('mongoose');




const eventController = {

    create: asyncHandler(async (req, res) => {
        const { eventTitle, Type, Date, exDate, classDivision, Time} = req.body;

        const event = await Events.create({
            eventTitle,
            Type,
            Date,
            exDate,
            classDivision,
            Time
        });

        if (!event){
            return res.status(404).json({ message: 'Failed to create event' });

        }

        res.status(201).json({ _id: event._id, ...event._doc});


    }),

    getAll: asyncHandler(async (req, res) => {
        const event = await Events.find();
        res.status(200).json(event);
    }),

    getById: asyncHandler(async (req, res) => {
        if (!mongoose.Types.ObjectId.isValid(req.params.id)){
            res.status(400);
            throw new Error('Invalid object id')
        }

        const event = await Events.findById(req.params.id);

        if (!event) {
            res.status(404);
            throw new Error('event not found')
            
        }
        res.status(200).json(event);
    }),

    update: asyncHandler(async (req,res) => {
        if(!mongoose.Types.ObjectId.isValid(req.params.id)) {
            res.status(400);
            throw new Error("Invalid objectId format");
        }

        const event = await Events.findById(req.params.id);

        if(!event){
            res.status(404);
            throw new Error('Event not found');
        }

        const updatedEvent = await Events.findByIdAndUpdate(
            req.params.id, 
            req.body, 
            { new: true}
        );
        res.status(200).json(updatedEvent);
        
    }),

    delete: asyncHandler(async (req, res) =>{
        if(!mongoose.Types.ObjectId.isValid(req.params.id)) {
            res.status(400);
            throw new Error("Invalid objectId format");

        }

        const event = await Events.findById(req.params.id);

        if(!event){
            res.status(404);
            throw new Error('Event not found');
        }

        await event.deleteOne();
          

        res.status(200).json({ message:"Event deleted successfully !"});
    })

};

module.exports = eventController;