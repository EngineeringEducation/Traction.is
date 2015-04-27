# Traction.is
So… you’ve decided to join the traction project. What a brave soul! Here’s some important info that will help you get up and running as fast as possible: 

Table of contents: 
- Setting up your local environment
- Speed dating the server

Setting up your local environment (!!):

1. Download postgres and run it. Click the elephant in your menu bar and make sure it’s running on port 5432.
2. Head on over to github and clone the traction master repo onto your machine
3. Open the Traction.is directory in Sublime text and create two new files: .gitignore and .env
4. In your .gitignore file, copy/paste the contents of this doc and save. Do the same with this doc for your .env file. 
5. In your terminal, from a local directory where you’ll be storing the Traction project, run the following command: “npm install”
6. Pat yourself on the back, you’re doing great

Setting up your local database:

7. In a new terminal window, run the following commands in order:
	“psql -f schema.sql”
	“psql -f views.sql”
	“psql -f seed.sql”
	boom
8. Now, in terminal, run “foreman start”. You should see something like this. Moving on..
9. Now that your server is running, open your browser and navigate to any of the following URLs to explore:
	localhost:3000/collections - This is highest page in the hierarchy 
	localhost:3000/collection/1 - This is an example collection (these link to articles)
	localhost:3000/article/1 - here’s an example article. This is the main content view. Left side bar contains anchors to sections within the article, right side bar contains resources associated with each section of the article
	localhost:3000/user/destroysultan: here’s an example user profile - this includes articles the user has authored, edits they’ve made which have been approved, and suggested edits which are waiting for them to approve.

Speed dating the server (understanding our API’s endpoints):

POST endpoints: 

1. GET: Collections/

2. GET: Collections/:collection_id

3. GET: Article/:article_id

4. GET: User/:user_name

## How to call and what to expect from each endpoint:

1. **/:collections**  
	A JSON object that represents everything needed to render a collection

Returns an array of JSON objects containing all existing collections and their associated ID's: 

//JSON
[
  {
    "title": "Engineering",
    "collection_id": 1
  },
  {
    "title": "Growth",
    "collection_id": 2
  },
  {
    "title": "Product Design",
    "collection_id": 3
  },
  {
    "title": "Sales & Business Development",
    "collection_id": 4
  }
]



2. **/collections/:collection_id**

Returns a JSON object that respresents all articles and metadata associcated with a given collection:

//JSON

  {
    "title": "Example title",
    "subject": "Example subject",
    "user_name": "Example username"
  },

// If user is logged in, will also include recent changes:
{
	"collection_title" : "",
	"collection_owner" : "",
	"articles" : [article, article, article],
	"recent_changes": [article_version, article_version]
}

Recent changes should be article_versions whose article is part of the collection, and that have approved = False and auditor_id = NULL, limit 10, order by timestamp (newest first)

3. **/article/:article_id**  

Returns a JSON object that represents everything needed to display an article, from an article identifier passed in through the URL.

//JSON

{
  "article_id": 1,
  "created": "2015-04-22T22:30:10.817Z",
  "subject": "Engineering subjects for days",
  "owner_id": 1,
  "user_name": "destroysultan",
  "sections": [
    {
      "resources": [
        {
          "owner_id": 3,
          "user_name": "wenever",
          "created": "2015-04-22T22:30:10.839Z",
          "resource_title": "Who originally said this?",
          "resource_body": "Check this blog post about this silly joke."
        }
      ],
      "section_id": 1,
      "section_title": "There are 10 kinds of people in the world",
      "section_body": "Ones who know binnary and ones who do not",
      "created": "2015-04-22T22:30:10.834Z",
      "owner_id": 1
    }
  ]
}

4. **/user/:handle**  

Returns a JSON object that represents everything needed to display a user's profile
Includes:
		User data, such as name, username, avatars, etc
		Recent contributions ordered by "Accepted" and "Proposed"
		IF the user is a mod, an additional list of proposed changes to the articles they have purview over

//JSON

{
  "user_id": 1,
  "name": "Troy Sultan",
  "user_name": "destroysultan",
  "email": "troy@tradecrafted.com",
  "role": "Mod",
  "articleInfo": [
    {
      "subject": "Engineering subjects for days",
      "created": "2015-04-22T22:30:10.817Z"
    },
    {
      "subject": "Ugh. A Sales subject.",
      "created": "2015-04-22T22:30:10.820Z"
    }
  ],
  "sectionInfo": [
    {
      "title": "There are 10 kinds of people in the world",
      "created": "2015-04-22T22:30:10.834Z",
      "status": "Accepted"
    }
  ],
  "pendingInfo": [
    {
      "user_name": "wenever",
      "owner_id": 3,
      "status": "Pending",
      "body": "Some examples about squares about fruits and vegetables"
    },
    {
      "user_name": "mikeymike",
      "owner_id": 2,
      "status": "Pending",
      "body": "Things can often times be more than one thing."
    }
  ]
}


