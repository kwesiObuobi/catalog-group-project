CREATE TABLE albums (
  id INT GENERATED ALWAYS AS IDENTITY,
  genre_id INT,
  author_id INT,
  source_id INT,
  label_id INT,
  published_date DATE,
  archived BOOLEAN,
  on_spotify BOOLEAN,
  PRIMARY KEY(id),
  CONSTRAINT fk_genres FOREIGN KEY(genre_id) REFERENCES genres(id),
  CONSTRAINT fk_authors FOREIGN KEY(author_id) REFERENCES authors(id),
  CONSTRAINT fk_sources FOREIGN KEY(source_id) REFERENCES sources(id),
  CONSTRAINT fk_labels FOREIGN KEY(label_id) REFERENCES labels(id)
);
