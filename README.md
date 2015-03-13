# Traction.is

##DB

- [ ] **Write create_table statements for database**  
- Create this as an SQL script called Schema. You should be able to run it directly from psql, so include a CREATE DATABASE traction IF NOT EXISTS statement, and a \c traction statement. Make sure that you use IF NOT EXISTS for the create table statements as well.   

- [ ] **Populate database with example content**  
- Write this as an SQL script, so it can be re-run if we need to drop the database. Call it seed.sql
Create stored procedures to display common things (like a page, or all of a user's contributions)  

## Endpoints
Create endpoints:

- [ ] **/:track**  
	A JSON object that represents everything needed to render a track
	Should include:
		Track title, color scheme
		Subject listing
		Recent changes (accepted changes, proposals)

- [ ] **/:track/:subject**  
	A JSON object that represents everything needed to display a particular subject
	Should include:
		Subject title
		Article listing
		Main article title (article with sequence 0?)
		Sections, as an object attached to main article
		Resources, as an object attached to sections

- [ ] **/:track/:subject/:article**  
	A JSON object that represents everything needed to display an article, from an article identifier passed in through the URL.
	Should include:
		Article title
		Article navigation (sections and anchors)
		Sections, ordered by sequence, with titles
		Resources, as an object attached to sections, with titles and body

- [ ] **/:user**  
	A JSON object that represents everything needed to display a user's profile
	Should include:
		User data, such as name, username, avatars, etc
		Recent contributions (and a generated link to those contributions based on the url schema above) ordered by "Accepted" and "Proposed", grouped by Subject
		IF the user is a mod, an additional list of proposed changes to the subjects or tracks they have purview over




