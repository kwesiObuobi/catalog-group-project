CREATE DATABASE catalog_of_my_things;

CREATE TABLE Book (
  id INT GENERATED ALWAYS AS IDENTITY,
  genre_id INT,
  author_id INT,
  source_id INT,
  label_id INT,
  publish_date DATE,
  archived BOOLEAN,
  publisher VARCHAR(50),
  cover_state VARCHAR(50),
  PRIMARY KEY(id),
  FOREIGN KEY (genre_id) REFERENCES genre(id),
  FOREIGN KEY (author_id) REFERENCES author(id),
  FOREIGN KEY (label_id) REFERENCES label(id)
);
