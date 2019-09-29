var express = require('express');
var router = express.Router();

// hello, /howareyou/:who
router.get('/hello', sayHello);
router.get('/howareyou/:who', sayhowareyou);

function sayHello(req,res){
    res.send('HELLO');
}

function sayhowareyou(req,res){
    var who = req.params.who;
    res.send('FINE THANKS ' + who);
}

module.exports = router;