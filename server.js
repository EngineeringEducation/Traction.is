var path = require('path');
var express = require('express');
var bodyParser = require('body-parser');
var pg = require('pg');
var app = express();
var exphbs  = require('express-handlebars');

var staticPath = path.join(__dirname, 'static');
app.use(express.static(staticPath));

// allows us to parse the incoming request body
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.engine('handlebars', exphbs({defaultLayout: 'main'}));
app.set('view engine', 'handlebars');

// Connects to postgres once, on server start
var conString = process.env['DATABASE_URL'];
var db;

pg.connect(conString, function(err, client) {
  if (err) {
    console.log(err);
  } else {
    console.log("Connected to database");
    db = client;
  }
});

//---------- GET REQUESTS/ENDPOINTS -----------

//GET /collections, returns all collections
app.get("/collections", function(req, res) {
  
  //checks if client is asking server for endpoint
  if (req.header('Content-Type') != "application/json"){
    //renders collections.html
    res.sendFile(__dirname + "/views/collections.html");
    return;
  }

  db.query("SELECT title, collection_id FROM collections", function (err, results) {
    if (err){
      //TODO: error handling % and special characters
      res.status(500);
      console.log(err);

    } else if (results.rows.length == 0) {
      console.log('empty rows')
      res.status(404).send('Collection Not Found');
    } else {
      // res.send(results.rows);
      console.log(results)
      res.send(results.rows);

    };
  });
});

//GET /collections/:collection_id
//returns all articles within a collection, given the collection_id
app.get("/collections/:collection_id", function(req, res) {
  console.log(req.params.collection_id);
  
  var collection_id = req.params.collection_id; 
  //check to see who's calling the server (client or server?)
  if (req.header('Content-Type') != "application/json"){

    console.log('before set');
    console.log(res.getHeader('Cache-Control'));

    res.setHeader('Cache-Control', 'no-cache');
    console.log('after set');
    console.log(res.getHeader('Cache-Control'));
    
    res.sendFile(__dirname + "/views/collection.html");
    return;
  }

  db.query("SELECT title, subject, user_name FROM collectionsView WHERE collection_id = $1;", [req.params.collection_id], function (err, results) {
    if (err) {
      //TODO: error handling % and special characters
      res.status(500);
      console.log(err);

    } else if (results.rows.length == 0) {
      console.log('empty rows')
      res.status(404).send('Collection Not Found');
    } else {
      // res.send(results.rows);
      console.log(results);
      console.log('before set');
      console.log(res.getHeader('Cache-Control'));
      res.setHeader('Cache-Control', 'no-cache');
      console.log('after set');
      console.log(res.getHeader('Cache-Control'));

      res.send(results.rows);

    };
  });
});


//GET request: returns article
app.get('/article/:article_id', function (req, res) {
  var article_id = req.params.article_id; 
  if (req.header('Content-Type') != "application/json"){
    res.sendFile(__dirname + "/views/article.html");
    return;
  }
  console.log("boop");
  db.query("SELECT * from article_view WHERE article_id = $1", [req.params.article_id], 
    function(err, result){callback('article_view', err, result)});
  db.query("SELECT * from resources_view WHERE article_id = $1", [req.params.article_id],
    function(err, result){callback('resources_view', err, result)});
  db.query("SELECT * from sections_view WHERE article_id = $1", [req.params.article_id], 
    function(err, result){callback('sections_view', err, result)});

  var completion = 0;
  var articleJSON = {};
  var sectionWithResourcesArray = [];
  var categoriesArray = [];

  var callback = function (querytype, err, result) {
    completion++;

    if (querytype == "resources_view"){
      var results = result.rows;
      var i = 0;
      var sectionIDIndex = -1;
      var resourceJSON = [];

      //iterate through result set
      while (i < results.length){
        //moving on to  a new section id
        if (sectionIDIndex != results[i]["section_id"]){

          //check if finished with resource json collection
          if (resourceJSON.length > 0){
            //file the jsons away for the section

            var sectionJSON = {"section_id" : sectionIDIndex} ;
            sectionJSON["resources"] = resourceJSON;

            //put all the resource info for the section into the array
            sectionWithResourcesArray.push(sectionJSON);
            resourceJSON = [];
          }

          sectionIDIndex = results[i]["section_id"];

        }

        //create a json for the resource
        var resource = {};
        resource["owner_id"] = results[i]["owner_id"];
        resource["user_name"] = results[i]["user_name"];
        resource["created"] = results[i]["created"];
        resource["resource_title"] = results[i]["resource_title"];
        resource["resource_body"] = results[i]["body"];
        resourceJSON.push(resource);

        i++;
      }

      //account for the last group of resources
      if (resourceJSON.length > 0){
        var sectionJSON = {"section_id" : sectionIDIndex} ;
        sectionJSON["resources"] = resourceJSON;

        //put all the resource info for the section into the array
        sectionWithResourcesArray.push(sectionJSON);
        console.log("//////////////");
      }

    }

    else if (querytype == "sections_view"){
      var results = result.rows;
      var i = 0;
      var categoryIDIndex = -1;
      var sectionJSON = [];

      while (i < results.length){
        //moving on to  a new section id
        if (categoryIDIndex != results[i]["category_id"]){
          //check if finished with section json collection
          if (sectionJSON.length > 0){

            //file the jsons away for the section
            var categoryJSON = {"category_id" : categoryIDIndex};
            categoryJSON["category_title"] = results[i-1]["category_title"];
            categoryJSON["sections"] = sectionJSON;
            console.log(categoryJSON);

            //put all the section info for the category into the array
            categoriesArray.push(categoryJSON);

            console.log("categoryJSON! : ")
            console.log(categoryJSON);
            categoryJSON = [];
            sectionJSON = [];
          }

          categoryIDIndex = results[i]["category_id"];

        }

        var section = {};

        section["section_id"] = results[i]["section_id"];
        section["sequence"] = results[i]["sequence"];
        section["section_title"] = results[i]["section_title"];
        section["section_body"] = results[i]["section_body"];
        section["owner_id"] = results[i]["owner_id"];
        section["created"] = results[i]["created"];
  
        //have to check if there are already a section in the array from 
        //resources being populated
        for (var k = 0; k < sectionWithResourcesArray.length; k++){
           if (sectionWithResourcesArray[k]["section_id"] == results[i]["section_id"]){
             console.log("whoop found a match");
             section["resources"] = sectionWithResourcesArray[k]["resources"];
             break;
           }
         }

        sectionJSON.push(section);

        i++;
      }


      //account for the last group of resources
      if (sectionJSON.length > 0){
        var category= {"category_id" :  categoryIDIndex} ;
        category["category_title"] = results[results.length-1]["category_title"];
        category["sections"] = sectionJSON;

        //put all the resource info for the section into the array
        categoriesArray.push(category);
        console.log("last one");
      }
    }

    else if (querytype == "article_view"){

      //populate article information from article_view
      if (result.rows.length > 0){
        articleJSON["article_id"] = result.rows[0]["article_id"];
        articleJSON["created"] = result.rows[0]["created"];
        articleJSON["subject"] = result.rows[0]["subject"];
        articleJSON["owner_id"] = result.rows[0]["owner_id"];
        articleJSON["user_name"] = result.rows[0]["user_name"];

        articleJSON["categories"] = categoriesArray;
      }
    }

    if (completion == 3){
        res.send(articleJSON);
    }

  }
});

//GET request: returns user's profile
//#TODO : Refactor all these callbacks
app.get('/user/:user_name', function (req, res) {
  var user;
  var userArticles;
  var completion = 0;
  var profileJSON = {};  

  db.query("SELECT * FROM user_view WHERE user_name = $1", [req.params.user_name], function(err, result) {
    if (err) {
      console.log('error');
      res.status(500).send(err);
      console.log(err);
    } else {
      if (result.rows.length > 0) {
        console.log(result.rows);
        user = result.rows[0];
        console.log(user);
        profileJSON['userInfo'] = user;

        db.query("SELECT subject, created FROM articles WHERE owner_id = $1", [user.user_id], function(err, result) {
          if (err) {
            res.status(500).send(err);
            console.log(err);
          } else {
            userArticles = result.rows;
            profileJSON['articleInfo'] = userArticles;

            db.query("SELECT title, created, approved FROM section_view WHERE owner_id = $1", [user.user_id], function(err, result) {
              if (err) {
                res.status(500).send(err);
                console.log(err);
              } else {
                userSections = result.rows;
                profileJSON['sectionInfo'] = userSections;

                db.query("SELECT * FROM proposed_edits WHERE owner_id = $1", [user.user_id], function(err, result) {
                  if (err) {
                    res.status(500).send(err);
                    console.log(err);
                  } else {

                    if (user.role == 'Mod' || user.role == 'Admin') {
                      pendingReviewsForUser = result.rows;
                      profileJSON['pendingInfo'] = pendingReviewsForUser;
                    }  
                    
                    res.send(profileJSON);
                  }                
                });
              }
            });
          }
        });
      } else {
        console.log('user not found' + ' ' + req.params.user_name);
        res.status(404).send('username not found :(');
      }
    } 
  });
});
  
app.listen(3000, function() {
  console.log('listening');
});

