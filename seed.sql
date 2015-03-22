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


--inserting articles
INSERT INTO articles (owner_id, subject) VALUES (1, 'this is a subject');
INSERT INTO articles (owner_id, subject) VALUES (2, 'this is another subject');
INSERT INTO articles (owner_id, subject) VALUES (3, 'and this is also a subject. wudduya know.');

--inserting articles/collections
INSERT INTO articles_collections (article_id, collection_id) VALUES (1,1);
INSERT INTO articles_collections (article_id, collection_id) VALUES (2,2);


--inserting categories
INSERT INTO categories (article_id, sequence, title) VALUES (1, 1, 'Basics');
INSERT INTO categories (article_id, sequence, title) VALUES (2, 2, 'Intro');
INSERT INTO categories (article_id, sequence, title) VALUES (3, 3, 'What is it?');

--inserting sections
INSERT INTO sections (article_id, title, body, category_id, sequence) values (1, 'There are 10 kinds of people in the world', 'Ones who know binary and ones who do not', 1, 1);
INSERT INTO sections (article_id, title, body, category_id, sequence) values (2, 'Basics', 'Some basics about the importance of inheritance and stuff', 2, 1);
INSERT INTO sections (article_id, title, body, category_id, sequence) values (2, 'Examples', 'Some examples about squares being rectangles or something like that',2, 2);
INSERT INTO sections (article_id, title, body, category_id, sequence) values (2, 'More examples', 'Some more examples about fruits and vegetables',2, 3);
INSERT INTO sections (article_id, title, body, category_id, sequence) VALUES (3, 'Intro to polymorph', 'Things can often times be more than one thing.', 3, 1);

--inserting section/versions
INSERT INTO section_versions (section_id, owner_id, body, auditor_id, status) values (1, 1, 'Ones who know binnary and ones who do not', 3, 'Accepted');
INSERT INTO section_versions (section_id, owner_id, body, auditor_id, status) values (2, 2, 'Some basics about the importance of inheritance and stuff', 2, 'Rejected');
INSERT INTO section_versions (section_id, owner_id, body, auditor_id, status) values (3, 3, 'Some examples about squares being rectangles or something like that', 1, 'Accepted');
INSERT INTO section_versions (section_id, owner_id, body, auditor_id, status) values (4, 1, 'Some examples about squares about fruits and vegetables', 2, 'Rejected');
INSERT INTO section_versions (section_id, owner_id, body, auditor_id, status) VALUES (5, 2, 'Things can often times be more than one thing.', 1, 'Accepted');

--inserting resources
INSERT INTO resources(section_id, title, owner_id, body) values (1, 'Who originally said this?', 3, 'Check this blog post about this silly joke.');
INSERT INTO resources(section_id, title, owner_id, body) values (2, 'What is this', 2, 'who knows');
INSERT INTO resources (section_id, title, owner_id, body) VALUES (3, 'second resource for this', 1, 'Hope this works!');
