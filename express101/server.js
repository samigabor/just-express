const open = require('open');
const path = require('path');
const express = require('express');
const app = express();


open('http://localhost:3001');


if (process.argv[2]) {
    app.use(express.static(path.join(__dirname, process.argv[2])));
    // app.use(express.static(__dirname + '/' + process.argv[2]));
}

app.use(express.static(__dirname));

app.get('*', (req, res) => {
    res.sendFile(path.join(__dirname, 'not-found.html'));
})


app.listen(3001);
