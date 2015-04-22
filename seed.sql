\c traction


--inserting users
INSERT INTO users (name, user_name, email) VALUES ('Troy Sultan','destroysultan', 'troy@tradecrafted.com');
INSERT INTO users (name, user_name, email) VALUES ('Michael Owens','mikeymike', 'mowens@tradecrafted.com');
INSERT INTO users (name, user_name, email) VALUES ('Wen Li','wenever', 'wen@tradecrafted.com');


--inserting collections
INSERT INTO collections (title, owner_id) VALUES ('Engineering', 1);
INSERT INTO collections (title, owner_id) VALUES ('Growth', 2);
INSERT INTO collections (title, owner_id) VALUES ('Product Design', 3);
INSERT INTO collections (title, owner_id) VALUES ('Sales & Business Development', 1);

--inserting permissions
INSERT INTO permissions (role, user_id) VALUES ('Mod', 1);
INSERT INTO permissions (role, user_id) VALUES ('User', 2);
INSERT INTO permissions (role, user_id) VALUES ('User', 3);

--inserting articles
INSERT INTO articles (owner_id, subject) VALUES (1, 'Engineering subjects for days');
INSERT INTO articles (owner_id, subject) VALUES (2, 'and days. and days.');
INSERT INTO articles (owner_id, subject) VALUES (2, 'this is Growth subject');
INSERT INTO articles (owner_id, subject) VALUES (1, 'Ugh. A Sales subject.');
INSERT INTO articles (owner_id, subject) VALUES (2, 'and another subject.');

--inserting articles/collections
INSERT INTO articles_collections (article_id, collection_id) VALUES (1,1);
INSERT INTO articles_collections (article_id, collection_id) VALUES (2,1);
INSERT INTO articles_collections (article_id, collection_id) VALUES (3,2);
INSERT INTO articles_collections (article_id, collection_id) VALUES (4,3);
INSERT INTO articles_collections (article_id, collection_id) VALUES (5,4);

--inserting categories
INSERT INTO categories (article_id, sequence, title) VALUES (1, 1, 'Basics');
INSERT INTO categories (article_id, sequence, title) VALUES (2, 2, 'Intro');
INSERT INTO categories (article_id, sequence, title) VALUES (3, 3, 'What is it?');

--inserting sections
INSERT INTO sections (article_id, title, body, category_id, sequence) VALUES (1, 'There are 10 kinds of people in the world', 'Ones who know binary and ones who do not', 1, 1);
INSERT INTO sections (article_id, title, body, category_id, sequence) VALUES (2, 'Basics', 'Some basics about the importance of inheritance and stuff', 2, 1);
INSERT INTO sections (article_id, title, body, category_id, sequence) VALUES (2, 'Examples', 'Some examples about squares being rectangles or something like that',2, 2);
INSERT INTO sections (article_id, title, body, category_id, sequence) VALUES (2, 'More examples', 'Some more examples about fruits and vegetables',2, 3);
INSERT INTO sections (article_id, title, body, category_id, sequence) VALUES (3, 'Intro to polymorph', 'Things can often times be more than one thing.', 3, 1);

--inserting section/versions
INSERT INTO section_versions (section_id, owner_id, body, auditor_id, status) VALUES (1, 1, 'Ones who know binnary and ones who do not', 3, 'Accepted');
INSERT INTO section_versions (section_id, owner_id, body, auditor_id, status) VALUES (2, 2, 'Some basics about the importance of inheritance and stuff', 1, 'Rejected');
INSERT INTO section_versions (section_id, owner_id, body, auditor_id, status) VALUES (3, 3, 'Some examples about squares being rectangles or something like that', 1, 'Accepted');
INSERT INTO section_versions (section_id, owner_id, body, auditor_id, status) VALUES (4, 3, 'Some examples about squares about fruits and vegetables', 1, 'Rejected');
INSERT INTO section_versions (section_id, owner_id, body, auditor_id, status) VALUES (5, 2, 'Things can often times be more than one thing.', 2, 'Accepted');
INSERT INTO section_versions (section_id, owner_id, body, status) VALUES (4, 3, 'Some examples about squares about fruits and vegetables', 'Pending');
INSERT INTO section_versions (section_id, owner_id, body, status) VALUES (5, 2, 'Things can often times be more than one thing.', 'Pending');

--inserting resources
INSERT INTO resources(section_id, title, owner_id, body) VALUES (1, 'Who originally said this?', 3, 'Check this blog post about this silly joke.');
INSERT INTO resources(section_id, title, owner_id, body) VALUES (2, 'What is this', 2, 'who knows');
INSERT INTO resources (section_id, title, owner_id, body) VALUES (3, 'second resource for this', 1, 'Hope this works!');
