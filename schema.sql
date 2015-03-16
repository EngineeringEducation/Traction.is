-- Write create_table statements for database
--Create this as an SQL script called Schema. You should be able to run it directly from psql, so include a CREATE DATABASE traction IF NOT EXISTS statement, and a \c traction statement. Make sure that you use IF NOT EXISTS for the create table statements as well.

--Populate database with example content

--Write this as an SQL script, so it can be re-run if we need to drop the database. Call it seed.sql Create stored procedures to display common things (like a page, or all of a user's contributions)

CREATE DATABASE traction;

\c traction;

CREATE TABLE users (
    user_id serial NOT NULL PRIMARY KEY,
    name varchar(255) NOT NULL,
    user_name varchar(255) UNIQUE,
    email varchar(255) NOT NULL,
    google_token varchar(255) 
);

CREATE TABLE permissions (
    permission_id serial NOT NULL PRIMARY KEY,
    role varchar(255) NOT NULL,
    user_id int references users(user_id) NOT NULL
);

CREATE TABLE collections (
    collection_id serial NOT NULL PRIMARY KEY,
    title varchar(255) NOT NULL,
    user_id int references users(user_id)
);



--#subjects tables
CREATE TABLE subjects (
    subject_id serial NOT NULL PRIMARY KEY,
    -- track_id int references tracks(track_id), --foreign key
    sequence int
);

CREATE TABLE subject_versions (
    status varchar(255),
    user_id int references users(user_id) NOT NULL, --foreign key
    created timestamp DEFAULT localtimestamp NOT NULL,
    auditor_id int references users(user_id),  
    approved boolean default false NOT NULL
) INHERITS (subjects); --inherits all the subjects' columns

--#articles tables
CREATE TABLE articles (
    article_id serial NOT NULL PRIMARY KEY,
    subject_id int references subjects(subject_id)
);

CREATE TABLE article_versions (
    article_version_id serial NOT NULL PRIMARY KEY, 
    article_id int references articles(article_id) NOT NULL,
    title varchar(255) NOT NULL,
    created timestamp DEFAULT localtimestamp NOT NULL,
    user_id int references users(user_id) NOT NULL,
    auditor_id int references users(user_id),
    approved boolean default false NOT NULL
);

CREATE TABLE articles_collections (
    article_id int references articles(article_id) NOT NULL,
    collection_id int references collections(collection_id) NOT NULL
);



CREATE TABLE categories (
    category_id serial NOT NULL PRIMARY KEY,
    article_id int references articles(article_id) NOT NULL,
    sequence int,
    title varchar(255) NOT NULL
);

--END OF subjects tables --------------------------------


--END OF articles tables --------------------------------


--#sections tables

CREATE TABLE sections (
    section_id serial NOT NULL PRIMARY KEY,
    article_id int references articles(article_id) NOT NULL,
    title varchar(255) NOT NULL,
    body text,
    sequence int NOT NULL
);

CREATE TABLE section_versions (
    section_id int references sections(section_id) NOT NULL,
    user_id int references users(user_id) NOT NULL, 
    body text NOT NULL, 
    status varchar(255),
    created timestamp DEFAULT localtimestamp NOT NULL,
    auditor_id int references users(user_id),
    approved boolean default false NOT NULL 
);

--END OF  sections tables --timestamp----


CREATE TABLE resources (
    resource_id serial NOT NULL PRIMARY KEY,
    section_id int references sections(section_id) NOT NULL,
    title varchar(255) NOT NULL,
    user_id int references users(user_id) NOT NULL,
    body text
);


-- INSERT INTO users (name, user_name, email) VALUES ('troy','troy', 'troy@tradecrafted.com');
-- INSERT INTO users (name, user_name, email) VALUES ('michael','michael', 'mowens@tradecrafted.com');
-- INSERT INTO users (name, user_name, email) VALUES ('wen','wen', 'wen@tradecrafted.com');

-- INSERT INTO collections (title, user_id) VALUES ('Observations', 1);
-- INSERT INTO collections (title, user_id) VALUES ('OOP', 2);

-- INSERT INTO subject_versions (status, user_id, sequence, time_last_edited) VALUES ('Approved', 1, 1, now()) ;
-- insert into subjects (sequence) values (2);

-- insert into articles(subject_id, sequence) VALUES (2, 1);
-- insert into articles(subject_id, sequence) VALUES  (2, 2);

-- insert into article_versions (article_id, title, user_id ) VALUES (1, 'Body Language', 1);
-- insert into article_versions (article_id, title, user_id ) VALUES (1, 'Body Languages', 1);
-- insert into article_versions(article_id, title, user_id) VALUES (2, 'Vocal', 3);
-- insert into article_versions(article_id, title, user_id) VALUES (2, 'Pitch', 3);
-- insert into article_versions(article_id, title, user_id) VALUES (2, 'Tone', 3);


-- insert into articles_collections (article_id, collection_id) VALUES (1, 1);

-- insert into sections (article_id, title, body) VALUES (1, 'Feet Positioning', 'Some info about the position of feet');
-- insert into sections (article_id, title, body) VALUES (1, 'Arms', 'Crossed arms means something or another');

-- insert into sections (article_id, title, body) VALUES (2, 'Vocal Stuff', 'Some info about how you can tell something about someone by their voice. Pitch this and tone that');

-- insert into section_versions (section_id, user_id, status, time_last_edited) VALUES (1, 1, 'Approved', now());
-- insert into section_versions (section_id, user_id, status, time_last_edited) VALUES (2, 1, 'Approved', now());
-- insert into section_versions (section_id, user_id, status, time_last_edited) VALUES (3, 1, 'Approved', now());
-- insert into section_versions (section_id, user_id, status, time_last_edited) VALUES (3, 1, 'Proposed', now());


-- insert into resources (section_id, title, body) VALUES (1, 'Foot Positioning Wiki', 'Some tagline about this thing');
-- insert into resources (section_id, title, body) VALUES (1, 'Importance of Something', 'Even more information about this thing');

-- insert into resources (section_id, title, body) VALUES (2, 'Local arms dealer', 'Half price before summer time at your local gym');
-- insert into resources (section_id, title, body) VALUES (3, 'More stuff on vocal', 'Here is an explanation of said stuff');

/*
INSERT INTO tracks (title, sequence) VALUES ('UX', 1);
INSERT INTO tracks (title, sequence) VALUES ('Growth', 2);
INSERT INTO tracks (title, sequence) VALUES ('Engineering', 3);

insert into subject_versions (track_id, sequence, status, user_id) VALUES (1, 2, 'Proposed', 1);
insert into subject_versions (track_id, sequence, status, user_id) VALUES (1, 1, 'Accepted', 1);



*/

