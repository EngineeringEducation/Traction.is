\c traction

INSERT INTO users (name, user_name, email) VALUES ('troy','troy', 'troy@tradecrafted.com');
INSERT INTO users (name, user_name, email) VALUES ('michael','michael', 'mowens@tradecrafted.com');
INSERT INTO users (name, user_name, email) VALUES ('wen','wen', 'wen@tradecrafted.com');

insert into collections (title, user_id) VALUES ('Why Wen is so awesome', 3);
insert into collections(title, user_id) values ('OOP', 2);

insert into subjects(sequence, body) VALUES (1, 'Great Jokes');
insert into subjects(sequence, body) VALUES (2, 'Inheritance');
insert into subjects(sequence, body) VALUES (3, 'Polymorphism');

insert into subject_versions (subject_id, body, user_id, approved) VALUES (1, 'Great Jokes', 3, true);
insert into subject_versions (subject_id, body, user_id, approved) VALUES (1, 'Funny Jokes', 3, false);
insert into subject_versions (subject_id, body, user_id, approved) values (2, 'Inheritance', 1, true);
insert into subject_versions (subject_id, body, user_id, approved) values (3, 'Polymorphism', 2, true);

insert into articles(subject_id) values (1);
insert into articles(subject_id) values (2);
insert into articles(subject_id) values (3);


insert into article_versions (article_id, user_id, approved) VALUES 
	(1, 1, true);
insert into article_versions (article_id, user_id, approved) VALUES (1, 1, false);

insert into article_versions(article_id, user_id, approved) values (2, 2, true);

insert into articles_collections (article_id, collection_id) values (1, 1);
insert into articles_collections (article_id, collection_id) values (2, 2);

insert into sections (article_id, title, body, sequence) values 
	(1, 'There are 10 kinds of people in the world', 'Ones who know binary and ones who do not', 1);
insert into sections (article_id, title, body, sequence) values 
	(2, 'Basics', 'Some basics about the importance of inheritance and stuff', 1);
insert into sections (article_id, title, body, sequence) values 
	(2, 'Examples', 'Some examples about squares being rectangles or something like that', 2);

insert into sections (article_id, title, body, sequence) values 
	(2, 'More examples', 'Some more examples about fruits and vegetables', 3);

insert into section_versions (section_id, user_id, body, approved) 
	values (1, 3, 'Ones who know binnary and ones who do not', true);
insert into section_versions (section_id, user_id, body, approved) 
	values (2, 2, 'Some basics about the importance of inheritance and stuff', true);
insert into section_versions (section_id, user_id, body, approved) 
	values (3, 2, 'Some examples about squares being rectangles or something like that', true);
insert into section_versions (section_id, user_id, body, approved) 
	values (4, 2, 'Some examples about squares about fruits and vegetables', true);

insert into resources(section_id, title, user_id, body) 
	values (1, 'Who originally said this?', 2, 'Check this blog post about this silly joke.');


