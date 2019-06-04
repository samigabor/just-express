const express = require('express');
const session = require('express-session');
const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const GitHubStrategy = require('passport-github').Strategy;
const passportConfig = require('./config');
// config.js
// module.exports = {
//     clientID: 'eaa5...',
//     clientSecret: '30dc...',
//     callbackURL: "http://localhost:3000/auth"
// }
const app = express();
app.use(express.json());
app.use(express.urlencoded());

app.use(session({
    secret: 'keyboard cat',
    resave: false,
    saveUninitialized: true
}))
app.use(passport.initialize());
app.use(passport.session());

passport.use(new GitHubStrategy(passportConfig ,
    function(accessToken, refreshToken, profile, cb) {
        // console.log(profile);
        return cb(null, profile);
    }
));

passport.use(new LocalStrategy((username, password, done) => {
    console.log('LocalStrategy!!!: ', username, password, done);
    return done(null, username);
  }
));

passport.serializeUser((user, cb) => {
    cb(null, user);
})

passport.deserializeUser((user, cb) => {
    cb(null, user);
})

app.get('/', (req, res) => {
    console.log('User data (Please!!!):');
    console.log(req.body); // this data gets saved when loging in and stays there during the session(when the server restarts the session is gone)
    res.send('works!!');
})

app.get('/login', passport.authenticate('github'));

app.get('/auth', passport.authenticate('github', {
    successRedirect: '/',
    failureRedirect: '/loginFailed'
}));

app.get('/session', (req, res) => {
    res.send(`My username from the session is: ${req.user.username}`);
})


app.post('/login', passport.authenticate('local', {
    successRedirect: '/',
    failureRedirect: '/login'})
);


app.listen(3000);

