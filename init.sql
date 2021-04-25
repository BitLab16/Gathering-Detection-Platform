-- Script per inizializzazione db

CREATE TABLE IF NOT EXISTS tracked_point (
    id serial PRIMARY KEY NOT NULL,
    code integer UNIQUE NOT NULL,
    point_name varchar(50) NOT NULL, 
    description text NULL,
    location geometry(Point, 4326) NOT NULL
);

CREATE TABLE IF NOT EXISTS gatherings_detection(
    id serial PRIMARY KEY NOT NULL,
    tracked_point_id INTEGER NOT NULL,
    detection_time TIMESTAMP NOT NULL,
    people_concentration INTEGER NOT NULL,
    weather INTEGER NOT NULL,
    season INTEGER NOT NULL,
    holiday BOOLEAN NOT NULL,
    time_index FLOAT NOT NULL,
    weather_index FLOAT NOT NULL,
    season_index FLOAT NOT NULL,
    attractions_index FLOAT NOT NULL,
    CONSTRAINT fk_entity FOREIGN KEY (tracked_point_id) REFERENCES tracked_point (id) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS gatherings_prediction(
    id serial PRIMARY KEY NOT NULL,
    tracked_point_id serial NOT NULL,
    detection_time TIMESTAMP NOT NULL,
    people_concentration int NOT NULL,
    FOREIGN KEY (tracked_point_id) REFERENCES tracked_point (id) ON DELETE SET NULL ON UPDATE CASCADE
);
