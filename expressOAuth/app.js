const express = require('express');
const session = require('express-session');
const passport = require('passport');
const GitHubStrategy = require('passport-github').Strategy;
const passportConfig = require('./config');
// config.js
// module.exports = {
//     clientID: 'eaa5...',
//     clientSecret: '30dc...',
//     callbackURL: "http://localhost:3000/auth"
// }
const app = express();

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

passport.serializeUser((user, cb) => {
    cb(null, user);
})

passport.deserializeUser((user, cb) => {
    cb(null, user);
})

app.get('/', (req, res) => {
    // console.log('User data (Please!!!):');
    // console.log(req.user); // this data gets saved when loging in and stays there during the session(when the server restarts the session is gone)
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


app.listen(3000);
