const express = require ('express')
const bookController = require('../controllers/bookController')




const bookRouter = express.Router()

bookRouter.get("/showbooks",bookController.getBooks)
bookRouter.get("/check1/:id",bookController.getBookById)
bookRouter.post("/check2",bookController.addBook)
bookRouter.delete("/check3/:id",bookController.deleteBook)


module.exports = bookRouter