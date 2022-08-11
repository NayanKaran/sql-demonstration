/* Database schema to keep the structure of entire database. */
CREATE TABLE animals(
    id SERIAL PRIMARY KEY,
    name text NOT NULL,
    date_of_birth date NOT NULL,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal NOT NULL
);

ALTER TABLE
    animals
ADD
    species text;

CREATE TABLE owners(
    id SERIAL PRIMARY KEY,
    full_name text NOT NULL,
    age integer NOT NULL
);

CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name text NOT NULL
);

ALTER TABLE
    animals DROP COLUMN species;

ALTER TABLE
    animals
ADD
    COLUMN species_id INT REFERENCES species;

ALTER TABLE
    animals
ADD
    COLUMN owner_id INT REFERENCES owners;