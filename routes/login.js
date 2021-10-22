/*
 * All routes for Users are defined here
 * Since this file is loaded in server.js into api/users,
 *   these routes are mounted onto /users
 * See: https://expressjs.com/en/guide/using-middleware.html#middleware.router
 */

const express = require('express');
const router  = express.Router();

module.exports = (db) => {
  router.get("/", (req, res) => {
    res.render("login");
  });

  router.get("/register", (req, res) => {
    res.render("register");
  });

  router.post("/login", (req, res) => {
    //user authentication
    //set the session cookie

    res.redirect("/maps"); //build routes/maps.js
  });

  router.post("/register", (req, res) => {
    //add new user to database
    //set the session cookie

    res.redirect("/maps"); //build routes/maps.js
  });

  router.post("/logout", (req, res) => {
    req.session = null;
    res.redirect("/");
  });


  return router;
};
