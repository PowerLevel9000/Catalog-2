-- catalog of my things schema
--genre table ---
CREATE TABLE genre (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

-- source table ---
CREATE TABLE source (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

--- author table ---
CREATE TABLE author (
  id SERIAL PRIMARY KEY,
  fist_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL
);

--- label table ---
CREATE TABLE label (
  id SERIAL PRIMARY KEY,
  title VARCHAR(50) NOT NULL,
  color VARCHAR(50) NOT NULL
);

--- music album table ---
CREATE TABLE music_album (
  id serial primary key,
  on_spotify boolean not null,
  publish_date date not null,
  archived boolean not null,
  author_id int references author(id),
  genre_id int references genre(id),
  source_id int references source(id),
  label_id int references label(id)
);

---  book table ---
CREATE TABLE book(
  id serial primary key,
  publisher varchar(50) not null,
  cover_state varchar(50) not null,
  publish_date date not null,
  archived boolean not null,
  author_id int references author(id),
  genre_id int references genre(id),
  source_id int references source(id),
  label_id int references label(id)
);

--- game table ---
create TABLE game(
  id serial primary key,
  multiplayer boolean not null,
  last_played date not null,
  publish_date date not null,
  archived boolean not null,
  author_id int references author(id),
  genre_id int references genre(id),
  source_id int references source(id),
  label_id int references label(id)
);