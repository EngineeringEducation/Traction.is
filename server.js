var path = require('path');
var express = require('express');
var bodyParser = require('body-parser');
var pg = require('pg');
var app = express();

var staticPath = path.resolve(__dirname, '/views');
app.use(express.static(staticPath));

// allows us to parse the incoming request body
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

// Connects to postgres once, on server start
var conString = process.env['DATABASE_URL'];
var db;

pg.connect(conString, function(err, client) {
  if (err) {
    console.log(err);
  } else {
    db = client;
  }
});

//---------- GET REQUESTS/ENDPOINTS -----------


app.get("/collections/:collection_id", function(request, response) {
  var users; 

  db.query("SELECT * FROM collections where collection_id = $1", [request.params.collection_id], function (err, results) {
    if (err){
      response.status(500).send(err);
    } else {
      response.send(results.rows);
    };
  });
});

//GET request: returns subject
app.get('/subject/:subjectID', function (req, res) {
  db.query("SELECT * FROM users", function(err, result) {
    if (err) {
      res.status(500).send(err);
    } else {
    		res.send(result.rows)
    }
  });
});

//GET request: returns article
app.get('/track/subject/article/articleID', function (req, res) {
  db.query("SELECT * FROM users", function(err, result) {
    if (err) {
      res.status(500).send(err);
    } else {
    		res.send(result.rows)
    }
  });
});

//GET request: returns user's profile
app.get('/user/:user_name', function (req, res) {
  db.query("SELECT * FROM users WHERE user_name=($1)", [req.params.user_name], function(err, result) {
    if (err) {
      res.status(500).send(err);
    } else {
    		res.send(result.rows)
    }
  });
});


app.listen(3000, function() {
  console.log('listening');
});

