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
    user_id int references users(user_id) NOT NULL
);

-- --#tracks table
-- CREATE TABLE tracks (
--     track_id serial NOT NULL PRIMARY KEY,
--     title varchar(255) NOT NULL,
--     theme_data varchar(255),--what data type to use for images?    theme_data is a formatted string, make it an array
--     time_created timestamp DEFAULT localtimestamp,
--     sequence int
-- );

-- --#subjects tables
-- CREATE TABLE subjects (
--     subject_id serial NOT NULL PRIMARY KEY,
--     track_id int references tracks(track_id), --foreign key
--     sequence int
-- );

-- CREATE TABLE subject_versions (
--     status varchar(255),
--     user_id int references users(user_id) NOT NULL, --foreign key
--     time_last_edited timestamp,
--     auditor_id int --(auditor is just a user?)
-- ) INHERITS (subjects); --inherits all the subjects' columns

-- CREATE TABLE categories (
--     category_id serial NOT NULL PRIMARY KEY,
--     subject_id int references subjects(subject_id) NOT NULL,
--     sequence int,
--     title varchar(255) NOT NULL
-- );

-- CREATE TABLE subjects_nav (
--     subject_nav_id serial NOT NULL PRIMARY KEY,
--     subject_id int references subjects(subject_id) NOT NULL, --foreign key sql
--     title varchar(255) NOT NULL, --can't be null
--     link varchar(255),
--     category_id int references categories(category_id) NOT NULL, --foreign key
--     sequence int
-- );

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
    time_last_edited timestamp,
    auditor_id int --(auditor is just a user?)
) INHERITS (subjects); --inherits all the subjects' columns

CREATE TABLE subjects_nav (
    subject_nav_id serial NOT NULL PRIMARY KEY,
    subject_id int references subjects(subject_id) NOT NULL, --foreign key sql
    title varchar(255) NOT NULL, --can't be null
    link varchar(255),
    --category_id int references categories(category_id) NOT NULL, --foreign key
    sequence int
);


--END OF subjects tables --------------------------------

--#articles tables
CREATE TABLE articles (
    article_id serial NOT NULL PRIMARY KEY,
    subject_id int references subjects(subject_id),
    sequence int
);

CREATE TABLE article_versions (
    article_version_id serial NOT NULL PRIMARY KEY, 
    aritcle_id int references articles(article_id) NOT NULL,
    title varchar(255) NOT NULL,
    user_id int references users(user_id) NOT NULL
);

CREATE TABLE articles_collections (
    article_id int references articles(article_id) NOT NULL,
    collection_id int references collections(collection_id) NOT NULL
);

--END OF articles tables --------------------------------


--#sections tables

CREATE TABLE sections (
    section_id serial NOT NULL PRIMARY KEY,
    article_id int references articles(article_id) NOT NULL,
    title varchar(255) NOT NULL,
    body varchar(255)
);

CREATE TABLE section_versions (
    section_id int references sections(section_id) NOT NULL,
    user_id int references users(user_id) NOT NULL, 
    status varchar(255),
    time_last_edited timestamp,
    auditor_id int --this is a user????
);

--END OF  sections tables ------


CREATE TABLE resources (
    resource_id serial NOT NULL PRIMARY KEY,
    section_id int references sections(section_id) NOT NULL,
    title varchar(255),
    body varchar(255)
);


INSERT INTO users (name, user_name, email) VALUES ('troy','troy', 'troy@tradecrafted.com');
INSERT INTO users (name, user_name, email) VALUES ('michael','michael', 'mowens@tradecrafted.com');
INSERT INTO users (name, user_name, email) VALUES ('wen','wen', 'wen@tradecrafted.com');
/*
INSERT INTO tracks (title, sequence) VALUES ('UX', 1);
INSERT INTO tracks (title, sequence) VALUES ('Growth', 2);
INSERT INTO tracks (title, sequence) VALUES ('Engineering', 3);

insert into subject_versions (track_id, sequence, status, user_id) VALUES (1, 2, 'Proposed', 1);
insert into subject_versions (track_id, sequence, status, user_id) VALUES (1, 1, 'Accepted', 1);



*/

