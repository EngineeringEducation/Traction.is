\c traction

INSERT INTO users (name, user_name, email) VALUES ('troy','troy', 'troy@tradecrafted.com');
INSERT INTO users (name, user_name, email) VALUES ('michael','michael', 'mowens@tradecrafted.com');
INSERT INTO users (name, user_name, email) VALUES ('wen','wen', 'wen@tradecrafted.com');

insert into permissions (role, user_id) VALUES ('Admin', 1);
insert into permissions (role, user_id) VALUES ('Admin', 3);
insert into permissions (role, user_id) VALUES ('Mod', 2);

insert into collections (title, owner_id) VALUES ('Why Wen is so awesome', 3);
insert into collections (title, owner_id) values ('OOP', 2);

insert into subjects(body) VALUES ('Great Jokes');
insert into subjects(body) VALUES ('Inheritance');
insert into subjects(body) VALUES ('Polymorphism');

insert into subject_versions (subject_id, body, owner_id, approved) VALUES (1, 'Great Jokes', 3, true);
insert into subject_versions (subject_id, body, owner_id, approved) VALUES (1, 'Funny Jokes', 3, false);
insert into subject_versions (subject_id, body, owner_id, approved) values (2, 'Inheritance', 1, true);
insert into subject_versions (subject_id, body, owner_id, approved) values (3, 'Polymorphism', 2, true);

insert into articles(subject_id, owner_id) values (1,1);
insert into articles(subject_id, owner_id) values (2,1);
insert into articles(subject_id, owner_id) values (3,2);

insert into articles_collections (article_id, collection_id) values (1, 1);
insert into articles_collections (article_id, collection_id) values (2, 2);

insert into categories (article_id , sequence, title) VALUES (1, 1, 'Basics');
insert into categories (article_id, sequence, title) VALUES (2, 1, 'Intro');
insert into categories (article_id, sequence, title) VALUES (3, 1, 'What is it?');


insert into sections (article_id, title, body, category_id, sequence) values 
	(1, 'There are 10 kinds of people in the world', 'Ones who know binary and ones who do not', 1, 1);
insert into sections (article_id, title, body, category_id, sequence) values 
	(2, 'Basics', 'Some basics about the importance of inheritance and stuff', 2, 1);
insert into sections (article_id, title, body, category_id, sequence) values 
	(2, 'Examples', 'Some examples about squares being rectangles or something like that',2, 2);

insert into sections (article_id, title, body, category_id, sequence) values 
	(2, 'More examples', 'Some more examples about fruits and vegetables',2, 3);
insert into sections (article_id, title, body, category_id, sequence) VALUES 
	(3, 'Intro to polymorph', 'Things can often times be more than one thing.',3, 1);

insert into section_versions (section_id, owner_id, body, approved) 
	values (1, 3, 'Ones who know binnary and ones who do not', true);
insert into section_versions (section_id, owner_id, body, approved) 
	values (2, 2, 'Some basics about the importance of inheritance and stuff', true);
insert into section_versions (section_id, owner_id, body, approved) 
	values (3, 2, 'Some examples about squares being rectangles or something like that', true);
insert into section_versions (section_id, owner_id, body, approved) 
	values (4, 2, 'Some examples about squares about fruits and vegetables', true);
insert into section_versions (section_id, owner_id, body, approved) 
	VALUES (5, 2, 'Things can often times be more than one thing.', true);



insert into resources(section_id, title, owner_id, body) 
	values (1, 'Who originally said this?', 2, 'Check this blog post about this silly joke.');
insert into resources(section_id, title, owner_id, body) 
	values (2, 'What is this', 2, 'who knows');
insert into resources (section_id, title, owner_id, body) VALUES (1, 'second resource for this', 1, 'Hope this works!');



