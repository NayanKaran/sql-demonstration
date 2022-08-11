/*Queries that provide answers to the questions from all projects.*/
SELECT
    *
from
    animals
WHERE
    name LIKE '%mon';

SELECT
    name
from
    animals
WHERE
    date_of_birth BETWEEN '2016-01-01'
    AND '2019-12-31';

SELECT
    name
from
    animals
WHERE
    neutered = 't'
    AND escape_attempts < 3;

SELECT
    date_of_birth
from
    animals
WHERE
    name IN ('Agumon', 'Pikachu');

SELECT
    name,
    escape_attempts
from
    animals
WHERE
    weight_kg > 10.5;

SELECT
    *
from
    animals
WHERE
    neutered = 't';

SELECT
    *
from
    animals
WHERE
    name <> 'Gabumon';

SELECT
    *
from
    animals
WHERE
    weight_kg BETWEEN 10.4
    AND 17.3;

BEGIN;

UPDATE
    animals
SET
    species = 'unspecified';

SELECT
    *
from
    animals;

ROLLBACK;

SELECT
    *
from
    animals;

BEGIN;

UPDATE
    animals
SET
    species = 'digimon'
WHERE
    name like '%mon';

UPDATE
    animals
SET
    species = 'pokemon'
WHERE
    species IS NULL;

COMMIT;

BEGIN;

DELETE FROM
    animals;

ROLLBACK;

SELECT
    *
from
    animals;

BEGIN;

DELETE FROM
    animals
WHERE
    date_of_birth > 'January 1, 2022';

SAVEPOINT SP1;

UPDATE
    animals
SET
    weight_kg = (weight_kg * -1);

ROLLBACK TO SP1;

UPDATE
    animals
SET
    weight_kg = (weight_kg * -1)
WHERE
    weight_kg < 0;

COMMIT;

SELECT
    count(*)
FROM
    animals;

SELECT
    count(*)
FROM
    animals
WHERE
    escape_attempts = 0;

SELECT
    AVG(weight_kg)
FROM
    animals;

SELECT
    neutered,
    MAX(escape_attempts)
FROM
    animals
GROUP BY
    neutered;

SELECT
    species,
    MIN(weight_kg),
    MAX(weight_kg)
FROM
    animals
GROUP BY
    species;

SELECT
    species,
    AVG(escape_attempts)
FROM
    animals
WHERE
    date_of_birth BETWEEN '1990-01-01'
    AND '2000-12-31'
GROUP BY
    species;

-- queries (using JOIN)
-- What animals belong to Melody Pond?
SELECT
    name
FROM
    animals
    INNER JOIN owners ON animals.owner_id = owners.id
WHERE
    owners.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT
    animals.name
FROM
    animals
    INNER JOIN species ON animals.species_id = species.id
WHERE
    species.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT
    full_name,
    name
FROM
    owners
    LEFT JOIN animals ON owners.id = animals.owner_id;

-- How many animals are there per species?
SELECT
    species.name as species_name,
    count(*) as number_of_animals
FROM
    animals
    INNER JOIN species ON species.id = animals.species_id
GROUP BY
    species.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT
    owners.full_name as owner_name,
    animals.name as animal_name,
    species.name as species_name
FROM
    animals
    INNER JOIN species ON species.id = animals.species_id
    INNER JOIN owners ON owners.id = animals.owner_id
WHERE
    owners.full_name = 'Jennifer Orwell'
    AND species.name = 'Digimon';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT
    owners.full_name as owner_name,
    animals.name as animal_name,
    animals.escape_attempts
FROM
    animals
    INNER JOIN owners ON owners.id = animals.owner_id
WHERE
    owners.full_name = 'Dean Winchester'
    AND animals.escape_attempts = 0;

-- Who owns the most animals?
SELECT
    MAX(number_of_animals_owned)
FROM
    (
        SELECT
            owners.full_name as owner_name,
            count(*) as number_of_animals_owned
        FROM
            animals
            INNER JOIN owners ON owners.id = animals.owner_id
        GROUP BY
            owners.full_name
    ) AS foo;

SELECT
    owners.full_name as owner_name,
    animals_owned
FROM
    owners
    INNER JOIN (
        SELECT
            count(*) as animals_owned,
            owner_id
        FROM
            animals
        GROUP BY
            animals.owner_id
    ) as foo ON owners.id = foo.owner_id;