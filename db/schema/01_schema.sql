-- Table Schema for MapWiki App

DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS maps CASCADE;
DROP TABLE IF EXISTS pins CASCADE;
DROP TABLE IF EXISTS favmaps_users CASCADE;

CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,

  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL
);


CREATE TABLE maps (
  id SERIAL PRIMARY KEY NOT NULL,
  creator_id INTEGER REFERENCES users(id) ON DELETE CASCADE,

  title VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  city VARCHAR(255) NOT NULL,
  province VARCHAR(255) NOT NULL,
  country VARCHAR(255) NOT NULL,
  date_created DATE NOT NULL
);

CREATE TABLE pins (
  id SERIAL PRIMARY KEY NOT NULL,
  creator_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  map_id INTEGER REFERENCES maps(id) ON DELETE CASCADE,

  title VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  img_url VARCHAR(255) NOT NULL,
  lat DECIMAL NOT NULL,
  lng DECIMAL NOT NULL,
  date_created DATE NOT NULL
);

CREATE TABLE favmaps_users (
  id SERIAL PRIMARY KEY NOT NULL,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  map_id INTEGER REFERENCES maps(id) ON DELETE CASCADE
);
