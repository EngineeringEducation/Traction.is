\c traction


--inserting users
INSERT INTO users (name, user_name, email) VALUES ('troy','troy', 'troy@tradecrafted.com');
INSERT INTO users (name, user_name, email) VALUES ('michael','michael', 'mowens@tradecrafted.com');
INSERT INTO users (name, user_name, email) VALUES ('wen','wen', 'wen@tradecrafted.com');


--inserting collections
INSERT INTO collections (title, owner_id) VALUES ('Observations', 1);
INSERT INTO collections (title, owner_id) VALUES ('OOP', 1);
INSERT INTO collections (title, owner_id) VALUES ('Test Collection', 1);



--inserting articles/versions
INSERT INTO articles (owner_id, subject) VALUES (1, '1This is dummy subject');
INSERT INTO articles (owner_id, subject) VALUES (2, '2This is dummy subject');
INSERT INTO articles (owner_id, subject) VALUES (3, '3This is dummy subject');


--inserting articles/collections
INSERT INTO articles_collections (article_id, collection_id) VALUES (1,1);
INSERT INTO articles_collections (article_id, collection_id) VALUES (2,2);


--inserting categories
INSERT INTO categories (article_id, sequence, title) VALUES (1, 1, 'OOP');
insert into categories (article_id , sequence, title) VALUES (1, 1, 'Basics');
insert into categories (article_id, sequence, title) VALUES (2, 1, 'Intro');
insert into categories (article_id, sequence, title) VALUES (3, 1, 'What is it?');

--inserting sections
INSERT INTO sections (category_id, article_id, title, body, sequence) VALUES (1,'Observations', 'This is the body. See how long it is?', 1);

insert into sections (article_id, title, body, category_id, sequence) VALUES 
    (1, 'There are 10 kinds of people in the world', 'Ones who know binary and ones who do not', 1, 1);
insert into sections (article_id, title, body, category_id, sequence) VALUES 
    (2, 'Basics', 'Some basics about the importance of inheritance and stuff', 2, 1);
insert into sections (article_id, title, body, category_id, sequence) VALUES 
    (2, 'Examples', 'Some examples about squares being rectangles or something like that',2, 2);

insert into sections (article_id, title, body, category_id, sequence) VALUES 
    (2, 'More examples', 'Some more examples about fruits and vegetables',2, 3);
insert into sections (article_id, title, body, category_id, sequence) VALUES 
    (3, 'Intro to polymorph', 'Things can often times be more than one thing.',3, 1);


--inserting section/versions
INSERT INTO section_versions (section_id, owner_id, body, auditor_id, approved) VALUES (1, 1, 'So much body. Body changes maybe auditor_id will be included and approved', 1, true);


--inserting resources
INSERT INTO resources (section_id, title, owner_id, body) VALUES (1, 'OOP', 1, 'This body...this body..is in the resource table!!');

--inserting collections
insert into collections (title, owner_id) VALUES ('Why Wen is so awesome', 3);
insert into collections(title, owner_id) values ('OOP', 2);

--inserting articles_collections
insert into articles_collections (article_id, collection_id) values (1, 1);
insert into articles_collections (article_id, collection_id) values (2, 2);



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
