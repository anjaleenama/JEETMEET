const { default: mongoose } = require("mongoose");

const LeaveSchema = new mongoose.Schema({


  _id: {
        type: mongoose.Schema.Types.ObjectId,
        default: () => new mongoose.Types.ObjectId(), 
        },
  name:{
  type:String,
  },

  category:{
  type:String,
  required: true,
  },

  startDate:{
    type:Date,
    required: true,
  },
  
  endDate:{
    type:Date,
    required: true,
   },
   
  days:{
    type:Number,
    required: true,
  }, 

  reason:{
    type:String,
    required: true,
   },

  attachment:{
    type: String,
},
});

const Leave = mongoose.model("Leave",LeaveSchema)

module.exports = Leave
