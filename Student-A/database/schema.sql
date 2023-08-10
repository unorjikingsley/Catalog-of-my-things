-- Create the database
CREATE DATABASE catalog_of_my_things;

-- Create the items table
CREATE TABLE items (
  id SERIAL PRIMARY KEY,
  genre_id integer,
  author_id integer,
  source_id integer,
  label_id integer,
  publish_date date,
  archived boolean
);

-- Create the books table
CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  publisher varchar,
  cover_state varchar,
  label_id integer,
  item_id integer
);

-- Create the labels table
CREATE TABLE labels (
  id SERIAL PRIMARY KEY,
  title varchar,
  color varchar,
  book_id integer
);

