-- Create the database
CREATE DATABASE catalog_of_my_things;

-- Create the items table
CREATE TABLE item (
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

-- Add foreign key relationships using ALTER TABLE
ALTER TABLE item ADD FOREIGN KEY (genre_id) REFERENCES genres(id) ON DELETE CASCADE;
ALTER TABLE item ADD FOREIGN KEY (author_id) REFERENCES authors(id) ON DELETE CASCADE;
ALTER TABLE item ADD FOREIGN KEY (source_id) REFERENCES sources(id) ON DELETE CASCADE;
ALTER TABLE item ADD FOREIGN KEY (label_id) REFERENCES labels(id) ON DELETE CASCADE;

ALTER TABLE books ADD FOREIGN KEY (label_id) REFERENCES labels(id) ON DELETE CASCADE;
ALTER TABLE books ADD FOREIGN KEY (item_id) REFERENCES item(id) ON DELETE CASCADE;

ALTER TABLE labels ADD FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE;