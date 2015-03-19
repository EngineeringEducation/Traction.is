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


// app.get("/collections/:collection_id", function(request, response) {
//   var users; 

//   db.query("SELECT * FROM collections where collection_id = $1", [request.params.collection_id], function (err, results) {
//     if (err){
//       response.status(500).send(err);
//     } else {
//       response.send(results.rows);
//     };
//   });
// });


//GET request: returns article
app.get('/article/:article_id', function (req, res) {
  db.query("SELECT * from article_view WHERE article_id = $1", [req.params.article_id], 
    function(err, result){callback('article_view', err, result)});
  db.query("SELECT * from sections_view WHERE article_id = $1", [req.params.article_id], 
    function(err, result){callback('sections_view', err, result)});
  db.query("SELECT * from resources_view WHERE article_id = $1", [req.params.article_id],
    function(err, result){callback('resources_view', err, result)});

  var completion = 0;
  var articleJSON = {};

  var callback = function (querytype, err, result) {
    completion++;

    //test if article_view
    if (querytype == "article_view"){
      console.log("article num " + result.rows.length);
      for (var i = 0; i < result.rows.length; i++){
        articleJSON["article_id"] = result.rows[i]["article_id"];
        articleJSON["created"] = result.rows[i]["created"];
        articleJSON["subject"] = result.rows[i]["subject"];
        articleJSON["owner_id"] = result.rows[i]["owner_id"];
        articleJSON["user_name"] = result.rows[i]["user_name"];
        console.log(articleJSON);
      }
    }

    if (querytype == "sections_view"){
      console.log("sections num " + result.rows.length);
      for (var i = 0; i < result.rows.length; i++){
        articleJSON["article_id"] = result.rows[i]["article_id"];
        articleJSON["created"] = result.rows[i]["created"];
        articleJSON["subject"] = result.rows[i]["subject"];
        articleJSON["owner_id"] = result.rows[i]["owner_id"];
        articleJSON["user_name"] = result.rows[i]["user_name"];
        console.log(articleJSON);
      }

    }

    if (completion == 3){

    }

  }
      // function(err, result) {
    // if (err) {
    //   res.status(500).send(err);
    // } else {
    //   var articleViewArr = result.rows;
    //   //res.send(result.rows);
    //      db.query("SELECT * from sections_view WHERE article_id = $1", [req.params.article_id], function(err, result) {
    //         if (err) {
    //           res.status(500).send(err);
    //         } else {
    //           res.send(result.rows);
    //         }
    //      });
    // }
    //});
});

//GET request: returns user's profile
app.get('/user/:user_name', function (req, res) {
  db.query("SELECT * FROM user_view WHERE user_name = $1", [req.params.user_name], function(err, result) {
    if (err) {
      res.status(500).send(err);
    } else {
      var result1= result.rows;
    }
  });
});

// app.get(/user/:username, function (res, req) {
//     db.query(query, callback)
//     db.query(query, callback)
//     db.query(query, callback)
//     var completion = 0;
//     var callback = function (err, result) {
//         completion++;
//         if completion == 3
//             do stuff
//     }
// })


app.listen(3000, function() {
  console.log('listening');
});

