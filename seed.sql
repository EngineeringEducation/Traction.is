\c traction

INSERT INTO users (name, user_name, email) VALUES ('troy','troy', 'troy@tradecrafted.com');
INSERT INTO users (name, user_name, email) VALUES ('michael','michael', 'mowens@tradecrafted.com');
INSERT INTO users (name, user_name, email) VALUES ('wen','wen', 'wen@tradecrafted.com');

INSERT INTO permissions (role, user_id) VALUES ('Admin', 1);
INSERT INTO permissions (role, user_id) VALUES ('Admin', 2);

INSERT INTO collections (title, user_id) VALUES ('CSS', 1);

INSERT INTO subjects (subject_id, sequence, body) VALUES (1, 1, 'CS Selectors');
INSERT INTO subject_versions (subject_id, user_id, body) VALUES (1, 1, 'CSS Selectors');
INSERT INTO subjects (subject_id, sequence, body) VALUES (2, 2, 'Body Language');
INSERT INTO subject_versions (subject_id, user_id, body) VALUES (2, 2, 'The Right Body Language');

INSERT INTO articles (subject_id) VALUES (1);
INSERT INTO article_versions (article_id, user_id) VALUES (1, 1);
INSERT INTO articles (subject_id) VALUES (2);
INSERT INTO article_versions (article_id, user_id) VALUES (2, 2);

INSERT INTO articles_collections (article_id, collection_id) VALUES (1, 1);

INSERT INTO categories (category_id, article_id, title) VALUES (1, 1, 'Basic');

INSERT INTO sections (article_id, title, body, sequence) VALUES (1, 'Overview', 'Overview blahblahblah I hate CSS', 1);
INSERT INTO sections (article_id, title, body, sequence) VALUES (1, 'Why I hate CSS', 'Becuase of all that its comprised of', 2);

INSERT INTO section_versions (section_id, user_id, body) VALUES (2, 1, 'No but seriously I hate CSS');

INSERT INTO resources (section_id, title, user_id, body) VALUES (1, 'Resources', 1, 'some links');
