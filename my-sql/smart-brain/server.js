var express = require('express');
var mysql   = require('mysql');
var bodyParser   = require('body-parser');
// var ejs   = require('ejs');


var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'sgabor',
  database : 'smart_brain'
});

var app = express();
app.use(bodyParser.urlencoded({ extended: true }));



// app.get('/', (req, res) => {
// 	res.send(database);
// })


app.get('/', function (req, res) {
    connection.query('SELECT * FROM users', function (error, users, fields) {
        if (error) throw error;
        res.send(users);
        // res.render('home.ejs', {count: users.length});
    });
});


app.post('/register', function (req, res) {
console.log('Received a POST request!!!!');
    const user = { name: req.body.name, email: req.body.email };
    connection.query('INSERT INTO users SET ?', user, function (error, users, fields) {
        if (error) throw error;
        const login = { hash: req.body.password, email: req.body.email };
        connection.query('INSERT INTO logins SET ?', login, function (error, users, fields) {
            if (error) throw error;
            res.redirect('/');
        });
    });
});
 
 
app.listen(8080, () => {
    console.log('Server started on port 8080.');
});