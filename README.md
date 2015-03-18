# Traction.is

##DB

- [ ] **Write create_table statements for database**  
- Create this as an SQL script called Schema. You should be able to run it directly from psql, so include a CREATE DATABASE traction IF NOT EXISTS statement, and a \c traction statement. Make sure that you use IF NOT EXISTS for the create table statements as well.   

- [ ] **Populate database with example content**  
- Write this as an SQL script, so it can be re-run if we need to drop the database. Call it seed.sql
Create stored procedures to display common things (like a page, or all of a user's contributions)  

## Endpoints
Create endpoints:

- [ ] **/:collections**  
	A JSON object that represents everything needed to render a collection
	
```json
// Collections
{
	"collection_title" : "",
	"collection_owner" : "",
	"articles" : [article, article, article]
}
```

```json
// Collections Recent changes (returns if user is logged in)
{
	"collection_title" : "",
	"collection_owner" : "",
	"articles" : [article, article, article],
	"recent_changes": [article_version, article_version]
}
```

Recent changes should be article_versions whose article is part of the collection, and that have approved = False and auditor_id = NULL, limit 10, order by timestamp (newest first)

- [ ] **/article/:articleid**  
	A JSON object that represents everything needed to display an article, from an article identifier passed in through the URL.
	Should include:
		Article title
		Article navigation (sections and anchors)
		Sections, ordered by sequence, with titles
		Resources, as an object attached to sections, with titles and body

- [ ] **/user/:handle**  
	A JSON object that represents everything needed to display a user's profile
	Should include:
		User data, such as name, username, avatars, etc
		Recent contributions (and a generated link to those contributions based on the url schema above) ordered by "Accepted" and "Proposed"
		IF the user is a mod, an additional list of proposed changes to the articles they have purview over




