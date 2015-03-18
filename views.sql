\c traction

CREATE VIEW user_view AS
	SELECT users.user_id, users.name, users.user_name, users.email, permissions.role
	FROM users, permissions
	WHERE users.user_id = permissions.user_id AND ;

SELECT sub.body, av.user_id, av.created 
	FROM article_versions av, subjects sub, articles a 
	WHERE sub.subject_id = a.subject_id 
	AND a.article_id = av.article_id;

SELECT sub.body, subv.user_id, subv.created 
	FROM subject_versions sv, subjects sub 
	WHERE sub.subject_id = subv.subject_id 
	ORDER BY subv.created 
	DESC LIMIT 10;

SELECT sec.title, secv.user_id 
	FROM sections sec, section_versions secv 
	WHERE sec.section_id = secv.section_id 
	ORDER BY secv.created 
	DESC LIMIT 10;

Steps: 

1. user_view which grabs: user_id, name, username, role 

2. user_contributions_view which grabs: section_id, resource_id, type(section or resource), 
title (section or resourse title) and timestamp of version section, status (approved/not approved) 

user_id
user_name
name
email

Recent contributions: 

Articles (created from scratch): 

- blah
- blah

Subjects: 

- blah 
- blah

Sections: 

- blah
- blah

How this should look on page: 

- timestamp: authored [Subject body (closest thing to article author)]
- timestamp: edited [Subject body] (would like to show original body and edited body)
- timestamp: edited [Section title]

----

Qs for Liz:

- Why do article versions exist? Isnt an article just made up of the latest versions of a section, subject, categoriy, etc.? 

- Add article name to article table? 

- We shouldnt be using sql views, but rather multiple selects in the GET request (according to janardan)




