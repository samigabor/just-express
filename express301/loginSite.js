const express = require('express');
const helmet = require('helmet');
const path = require('path');
const cookieParser = require('cookie-parser');

const app = express();

app.use(helmet());
app.use(express.static(path.join(__dirname, '/public')));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cookieParser());

app.set('view engine', 'ejs');
app.set('views', './views');


app.get('/', (req, res) => {
  res.send('working... but choose a path please!');
});


app.use((req, res, next) => {
  if (req.query.msg) {
    res.locals.msg = req.query.msg;
  }
  next();
});

app.get('/login', (req, res) => {
  res.render('login');
});

app.get('/welcome', (req, res) => {
  res.render('welcome', { username: req.cookies.username });
});

app.get('/story/:storyId', (req, res) => {
  // res.locals.storyId = req.params.storyId;
  res.send(`<h1>Story ${req.params.storyId}</h1>`);
});

app.get('/fail', (req, res) => {
  // if (req.query.msg) {
  //   res.render('fail', { msg: req.query.msg });
  // }
  res.render('fail');
});

app.post('/proccess_login', (req, res) => {
  const { username, password } = req.body;
  if (password === 'a') {
    res.cookie('username', username);
    res.redirect('welcome');
  } else {
    res.redirect('fail?msg=fail');
  }
});

app.get('/logout', (req, res) => {
  res.clearCookie('username');
  res.redirect('/login');
});

app.listen(3000);
