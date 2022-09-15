/* CREATE THE DATABASE */

CREATE DATABASE music WITH TEMPLATE = template0 ENCODING = 'UTF8';

/* After this I close the Terminal, open it again and log in the database */


/* CREATE TABLES */

/* Table for artists */

CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  nickname VARCHAR NOT NULL,
  UNIQUE (nickname)
  );
  
/* Table for albums */

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  title VARCHAR NOT NULL,
  release_date DATE,
  label VARCHAR
  );
  
/* Table for songs */

CREATE TABLE songs (
  id SERIAL PRIMARY KEY,
  title VARCHAR NOT NULL,
  album_id INT,
  length INT,
  CONSTRAINT fk_album FOREIGN KEY (album_id) REFERENCES albums(id)
  );
  
/* Bridge table for artists and albums - Each artist may have more than one album */

CREATE TABLE artist_album (
  album_id INT,
  artist_id INT,
  role VARCHAR,
  CONSTRAINT fk_album FOREIGN KEY (album_id) REFERENCES albums(id),
  CONSTRAINT fk_artist FOREIGN KEY (artist_id) REFERENCES artists(id)
  );
