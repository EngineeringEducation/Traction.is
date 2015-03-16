var express = require('express');
var app = express();
var pg = require("pg");
var port = process.env["PORT"];
var bodyParser = require('body-parser');
var conString = process.env["DATABASE_URL"];
var ejs = require('ejs');

var db;

app.use(express.static(__dirname + '/views'));
app.use(express.static(__dirname + '/static'));
app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

pg.connect(conString, function(err, client) {
	  db = client;
	  if (err) {
	    console.log(err);
	  } else {
	  	console.log("server up!");
	  }
})

//logging middleware
app.use(function(req, res, next){
	console.log("Request at ", req.path);
	next();
})

app.get("/", function (request, response) {
	response.send("TRACTION.IO");
});


app.get("/:user_name", function(request, response) {
	var users; 

	db.query("SELECT * FROM users where user_name = $1", [request.params.user_name], function (err, results) {
		if (err){
			response.status(500).send(err);
		} else {
			response.send(results.rows);
		};
	});
});

//select * from subject_versions where user_id = 1 order by time_last_edited;
//select * from 

//looking at p hunt, /username and they have /about, do they assume that username wont be these things

//collections write a join statement from collections and subjects?

//select * from articles_collections ac, articles a, article_versions av where ac.collection_id = 1 and a.article_id = ac.article_id and a.article_id = av.article_id;

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

app.listen(port);