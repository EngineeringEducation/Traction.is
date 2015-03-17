
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
    user_id int references users(user_id) NOT NULL
);


CREATE TABLE subjects (
    subject_id serial NOT NULL PRIMARY KEY,
    sequence int, 
    body text NOT NULL
);

CREATE TABLE subject_versions (
    subject_id int references subjects(subject_id) NOT NULL,
    user_id int references users(user_id) NOT NULL, 
    created timestamp DEFAULT localtimestamp NOT NULL,
    auditor_id int references users(user_id),  
    approved boolean DEFAULT false NOT NULL,
    body text NOT NULL
); 

CREATE TABLE articles (
    article_id serial NOT NULL PRIMARY KEY,
    subject_id int references subjects(subject_id) NOT NULL
);

CREATE TABLE article_versions (
    article_version_id serial NOT NULL PRIMARY KEY, 
    article_id int references articles(article_id) NOT NULL,
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
    created timestamp DEFAULT localtimestamp NOT NULL,
    auditor_id int references users(user_id),
    approved boolean default false NOT NULL 
);


CREATE TABLE resources (
    resource_id serial NOT NULL PRIMARY KEY,
    section_id int references sections(section_id) NOT NULL,
    title varchar(255) NOT NULL,
    user_id int references users(user_id) NOT NULL,
    body text
);
