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


//GET request: returns article
app.get('/article/:article_id', function (req, res) {
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
        section["sequence"] = results[i]["section_title"];
        section["section_title"] = results[i]["sequence"];
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


app.listen(3000, function() {
  console.log('listening');
});

