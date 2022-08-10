/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
id SERIAL PRIMARY KEY,
name text NOT NULL,
date_of_birth date NOT NULL,
escape_attempts integer,
neutered boolean,
weight_kg decimal NOT NULL
);

ALTER TABLE animals 
ADD species text;