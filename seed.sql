\c traction


--inserting users
INSERT INTO users (name, user_name, email) VALUES ('troy','troy', 'troy@tradecrafted.com');
INSERT INTO users (name, user_name, email) VALUES ('michael','michael', 'mowens@tradecrafted.com');
INSERT INTO users (name, user_name, email) VALUES ('wen','wen', 'wen@tradecrafted.com');


--inserting collections
INSERT INTO collections (title, owner_id) VALUES ('Engineering', 1);
INSERT INTO collections (title, owner_id) VALUES ('Growth', 1);
INSERT INTO collections (title, owner_id) VALUES ('Product Design', 1);
INSERT INTO collections (title, owner_id) VALUES ('Sales & Business Development', 1);

--inserting permissions
INSERT INTO permissions (role, user_id) VALUES ('Mod', 1);
INSERT INTO permissions (role, user_id) VALUES ('User', 2);
INSERT INTO permissions (role, user_id) VALUES ('User', 3);

--inserting articles
INSERT INTO articles (owner_id, subject) VALUES (1, 'This is a subject');
INSERT INTO articles (owner_id, subject) VALUES (2, 'This is another subject');
INSERT INTO articles (owner_id, subject) VALUES (3, 'And this is also a subject. wudduya know.');
INSERT INTO articles (owner_id, subject) VALUES (2, 'And this is also a subject for the fourth time.');

--inserting articles/collections
INSERT INTO articles_collections (article_id, collection_id) VALUES (1,1);
INSERT INTO articles_collections (article_id, collection_id) VALUES (2,2);
INSERT INTO articles_collections (article_id, collection_id) VALUES (3,3);
INSERT INTO articles_collections (article_id, collection_id) VALUES (4,4);

--inserting categories (currently not being used fully, see commented out code)
INSERT INTO categories (article_id, sequence, title) VALUES (1, 1, 'Basics');
INSERT INTO categories (article_id, sequence, title) VALUES (2, 2, 'Intro');
INSERT INTO categories (article_id, sequence, title) VALUES (3, 3, 'What is it?');
INSERT INTO categories (article_id, sequence, title) VALUES (1, 2, 'Advanced');

--inserting sections
INSERT INTO sections (article_id, title, body, category_id, sequence) VALUES (1, 'What is UX', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis justo augue, facilisis eget vulputate facilisis, sagittis et dui. Ut nibh turpis, hendrerit ac enim sit amet, tincidunt interdum libero. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In vel porttitor nibh. Suspendisse maximus, neque nec efficitur bibendum, lorem ante imperdiet nisi, nec vehicula sem erat nec orci. Ut et nisl eu nunc dapibus tempor. Ut pulvinar condimentum orci, in accumsan lorem. Proin finibus ipsum iaculis orci fringilla, vel viverra mi lacinia. Aenean nulla sapien, commodo dapibus erat ut, varius accumsan elit. Duis quis metus pulvinar, tincidunt tellus et, ultrices magna. Vivamus et neque ut est suscipit varius nec et tortor. Proin vel massa laoreet, eleifend orci a, finibus mi. Suspendisse quis eleifend orci.', 1, 1);
INSERT INTO sections (article_id, title, body, category_id, sequence) VALUES (2, 'Basics', 'Some basics about the importance of inheritance and stuff', 2, 1);
INSERT INTO sections (article_id, title, body, category_id, sequence) VALUES (2, 'Examples', 'Some examples about squares being rectangles or something like that',2, 2);
INSERT INTO sections (article_id, title, body, category_id, sequence) VALUES (2, 'More examples', 'Some more examples about fruits and vegetables',2, 3);
INSERT INTO sections (article_id, title, body, category_id, sequence) VALUES (3, 'Intro to polymorph', 'Things can often times be more than one thing.', 3, 1);
INSERT INTO sections (article_id, title, body, category_id, sequence) VALUES (1, 'Sketching', 'Doodle doodle doodle', 4, 1);

--inserting section/versions
INSERT INTO section_versions (section_id, owner_id, body, auditor_id, status) VALUES (1, 1, 'Lorem ipsum dolor sit amet, ', 3, 'Accepted');
INSERT INTO section_versions (section_id, owner_id, body, auditor_id, status) VALUES (2, 2, 'Some basics about the importance of inheritance and stuff', 2, 'Rejected');
INSERT INTO section_versions (section_id, owner_id, body, auditor_id, status) VALUES (3, 3, 'Some examples about squares being rectangles or something like that', 1, 'Accepted');
INSERT INTO section_versions (section_id, owner_id, body, auditor_id, status) VALUES (4, 1, 'Some examples about squares about fruits and vegetables', 2, 'Rejected');
INSERT INTO section_versions (section_id, owner_id, body, auditor_id, status) VALUES (5, 2, 'Things can often times be more than one thing.', 1, 'Accepted');
INSERT INTO section_versions (section_id, owner_id, body, auditor_id, status) VALUES (6, 2, 'Doodle doodle doodle', 1, 'Accepted');


--inserting resources
INSERT INTO resources(section_id, title, owner_id, body) VALUES (1, 'Who originally said this?', 3, 'Check this blog post about this silly joke.');
INSERT INTO resources(section_id, title, owner_id, body) VALUES (2, 'What is this', 2, 'who knows');
INSERT INTO resources (section_id, title, owner_id, body) VALUES (3, 'second resource for this', 1, 'Hope this works!');
