\c traction


--inserting users
INSERT INTO users (name, user_name, email) VALUES ('troy','troy', 'troy@tradecrafted.com');
INSERT INTO users (name, user_name, email) VALUES ('michael','michael', 'mowens@tradecrafted.com');
INSERT INTO users (name, user_name, email) VALUES ('wen','wen', 'wen@tradecrafted.com');


--inserting permissions

--inserting collections
INSERT INTO collections (title, user_id) VALUES ('Observations', 1);
INSERT INTO collections (title, user_id) VALUES ('OOP', 2);
INSERT INTO collections (title, user_id) VALUES ('Test Collection', 3);


--inserting subjects/versions
INSERT INTO subjects (subject_id, sequence, body) VALUES (1,1, 'This is subjects body');
INSERT INTO subject_versions (subject_id, user_id, approved, body) VALUES (1, 1, false, 'This is body text of subjects_vesions 1');
INSERT INTO subjects (subject_id, sequence, body) VALUES (2,2, 'This is subjects body 2');
INSERT INTO subject_versions (subject_id, user_id, approved, body) VALUES (2,2,false, 'This is body text of subject_versions 2');
INSERT INTO subjects (subject_id, sequence, body) VALUES (3,3, 'This is subjects body 3');
INSERT INTO subject_versions (subject_id, user_id, approved, body) VALUES (3,3,false, 'This is body text of subject_versions 3');


--inserting articles/versions
INSERT INTO articles (article_id, subject_id) VALUES (1,1);
INSERT INTO article_versions(article_version_id, article_id, user_id, auditor_id) VALUES (1, 1, 1, 1);
INSERT INTO articles (article_id, subject_id) VALUES (2,2);
INSERT INTO article_versions(article_version_id, article_id, user_id, auditor_id) VALUES (2, 2, 2, 2);
INSERT INTO articles (article_id, subject_id) VALUES (3,3);


--inserting articles/collections
INSERT INTO articles_collections (article_id, collection_id) VALUES (1,1);
INSERT INTO articles_collections (article_id, collection_id) VALUES (2,2);


--inserting categories
INSERT INTO categories (category_id, article_id, sequence, title) VALUES (1, 1, 1, 'OOP');


--inserting sections
INSERT INTO sections (section_id, article_id, title, body, sequence) VALUES (1,1,'Observations', 'This is the body. See how long it is?', 1);


--inserting section/versions
INSERT INTO section_versions (section_id, user_id, body, auditor_id, approved) VALUES (1, 1, 'So much body. Body changes maybe auditor_id will be included and approved', 1, true);


--inserting resources
INSERT INTO resources (resource_id, section_id, title, user_id, body) VALUES (1, 1, 'OOP', 1, 'This body...this body..is in the resource table!!');