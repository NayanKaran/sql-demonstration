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

/*
 Create a table named vets with the following columns:
 id: integer (set it as autoincremented PRIMARY KEY)
 name: string
 age: integer
 date_of_graduation: date
 */
CREATE TABLE vets(
    id SERIAL PRIMARY KEY,
    name text NOT NULL,
    age integer NOT NULL,
    date_of_graduation date NOT NULL
);

/*
 There is a many-to-many relationship between the tables species and vets: a vet can specialize in multiple species, and a species can have multiple vets specialized in it. Create a "join table" called specializations to handle this relationship.
 */
CREATE TABLE specializations(
    species_id integer NOT NULL REFERENCES species,
    vet_id integer NOT NULL REFERENCES vets,
    PRIMARY KEY (species_id, vet_id)
);

/*
 There is a many-to-many relationship between the tables animals and vets: an animal can visit multiple vets and one vet can be visited by multiple animals. Create a "join table" called visits to handle this relationship, it should also keep track of the date of the visit.
 */
CREATE TABLE visits(
    animal_id integer NOT NULL REFERENCES animals,
    vet_id integer NOT NULL REFERENCES vets,
    date_of_visit date NOT NULL,
    PRIMARY KEY (animal_id, vet_id, date_of_visit)
);

-- Schema changes for database performance audit

ALTER TABLE visits
  DROP CONSTRAINT visits_pkey;

ALTER TABLE owners ALTER COLUMN age DROP NOT NULL;

ALTER TABLE
    owners
ADD
    COLUMN email VARCHAR(120);

CREATE INDEX animal_id ON visits (animal_id);

CREATE INDEX vet_id ON visits (vet_id);

CREATE INDEX owner_email ON owners (email);
