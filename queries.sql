/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';
SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name from animals WHERE neutered = 't' AND escape_attempts < 3;
SELECT date_of_birth from animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered = 't';
SELECT * from animals WHERE name <> 'Gabumon';
SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animals
SET species = 'unspecified';
SELECT * from animals;
ROLLBACK;
SELECT * from animals;

/* OUTPUT */
/*
vet_clinic=# BEGIN;
BEGIN
vet_clinic=*# UPDATE animals
vet_clinic-*# SET species = 'unspecified';
UPDATE 11
vet_clinic=*# SELECT * from animals;
 id |    name    | date_of_birth | escape_attempts | neutered | weight_kg |   species
----+------------+---------------+-----------------+----------+-----------+-------------
  1 | Agumon     | 2020-02-03    |               0 | t        |     10.23 | unspecified
  2 | Gabumon    | 2018-11-15    |               2 | t        |         8 | unspecified
  3 | Pikachu    | 2021-01-07    |               1 | f        |     15.04 | unspecified
  4 | Devimon    | 2017-05-12    |               5 | t        |        11 | unspecified
  5 | Charmander | 2020-02-08    |               0 | t        |        11 | unspecified
  6 | Plantmon   | 2021-11-15    |               2 | t        |       5.7 | unspecified
  7 | Squirtle   | 1993-04-02    |               3 | t        |     12.13 | unspecified
  8 | Angemon    | 2005-06-12    |               1 | f        |        45 | unspecified
  9 | Boarmon    | 2005-06-07    |               7 | t        |      20.4 | unspecified
 10 | Blossom    | 1998-10-13    |               3 | t        |        17 | unspecified
 11 | Ditto      | 2022-05-14    |               4 | t        |        22 | unspecified
(11 rows)

vet_clinic=*# ROLLBACK;
ROLLBACK
vet_clinic=# SELECT * from animals;
 id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species
----+------------+---------------+-----------------+----------+-----------+---------
  1 | Agumon     | 2020-02-03    |               0 | t        |     10.23 |
  2 | Gabumon    | 2018-11-15    |               2 | t        |         8 |
  3 | Pikachu    | 2021-01-07    |               1 | f        |     15.04 |
  4 | Devimon    | 2017-05-12    |               5 | t        |        11 |
  5 | Charmander | 2020-02-08    |               0 | t        |        11 |
  6 | Plantmon   | 2021-11-15    |               2 | t        |       5.7 |
  7 | Squirtle   | 1993-04-02    |               3 | t        |     12.13 |
  8 | Angemon    | 2005-06-12    |               1 | f        |        45 |
  9 | Boarmon    | 2005-06-07    |               7 | t        |      20.4 |
 10 | Blossom    | 1998-10-13    |               3 | t        |        17 |
 11 | Ditto      | 2022-05-14    |               4 | t        |        22 |
(11 rows)

vet_clinic=# BEGIN;
BEGIN
vet_clinic=*# UPDATE animals SET species = 'digimon'
vet_clinic-*# WHERE name like '%mon';
UPDATE 6
vet_clinic=*# UPDATE animals SET species = 'pokemon'
vet_clinic-*# WHERE species IS NULL;
UPDATE 5
vet_clinic=*# COMMIT;
COMMIT
vet_clinic=# SELECT * from animals;
 id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species
----+------------+---------------+-----------------+----------+-----------+---------
  1 | Agumon     | 2020-02-03    |               0 | t        |     10.23 | digimon
  2 | Gabumon    | 2018-11-15    |               2 | t        |         8 | digimon
  4 | Devimon    | 2017-05-12    |               5 | t        |        11 | digimon
  6 | Plantmon   | 2021-11-15    |               2 | t        |       5.7 | digimon
  8 | Angemon    | 2005-06-12    |               1 | f        |        45 | digimon
  9 | Boarmon    | 2005-06-07    |               7 | t        |      20.4 | digimon
  3 | Pikachu    | 2021-01-07    |               1 | f        |     15.04 | pokemon
  5 | Charmander | 2020-02-08    |               0 | t        |        11 | pokemon
  7 | Squirtle   | 1993-04-02    |               3 | t        |     12.13 | pokemon
 10 | Blossom    | 1998-10-13    |               3 | t        |        17 | pokemon
 11 | Ditto      | 2022-05-14    |               4 | t        |        22 | pokemon
(11 rows)
*/

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * from animals;

/* 
**OUTPUT**

vet_clinic=# BEGIN;
BEGIN
vet_clinic=*# DELETE FROM animals;
DELETE 11
vet_clinic=*# ROLLBACK;
ROLLBACK
vet_clinic=# SELECT * from animals;
 id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species
----+------------+---------------+-----------------+----------+-----------+---------
  1 | Agumon     | 2020-02-03    |               0 | t        |     10.23 | digimon
  2 | Gabumon    | 2018-11-15    |               2 | t        |         8 | digimon
  4 | Devimon    | 2017-05-12    |               5 | t        |        11 | digimon
  6 | Plantmon   | 2021-11-15    |               2 | t        |       5.7 | digimon
  8 | Angemon    | 2005-06-12    |               1 | f        |        45 | digimon
  9 | Boarmon    | 2005-06-07    |               7 | t        |      20.4 | digimon
  3 | Pikachu    | 2021-01-07    |               1 | f        |     15.04 | pokemon
  5 | Charmander | 2020-02-08    |               0 | t        |        11 | pokemon
  7 | Squirtle   | 1993-04-02    |               3 | t        |     12.13 | pokemon
 10 | Blossom    | 1998-10-13    |               3 | t        |        17 | pokemon
 11 | Ditto      | 2022-05-14    |               4 | t        |        22 | pokemon
(11 rows)
*/

BEGIN;
DELETE FROM animals
WHERE date_of_birth > 'January 1, 2022';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = (weight_kg * -1);
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = (weight_kg * -1) WHERE weight_kg < 0;
COMMIT;

/*OUTPUT

vet_clinic=# BEGIN;
BEGIN
vet_clinic=*# DELETE FROM animals
vet_clinic-*# WHERE date_of_birth > 'January 1, 2022';
DELETE 1
vet_clinic=*# SAVEPOINT SP1;
SAVEPOINT
vet_clinic=*# UPDATE animals SET weight_kg = (weight_kg * -1);
UPDATE 10
vet_clinic=!# ROLLBACK TO SP1;
ROLLBACK
vet_clinic=*# UPDATE animals SET weight_kg = (weight_kg * -1) WHERE weight_kg < 0;
UPDATE 0
vet_clinic=*# COMMIT;
COMMIT
*/

SELECT count(*) FROM animals;
SELECT count(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

SELECT species, AVG(escape_attempts)
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;

/*OUTPUT

vet_clinic=# SELECT count(*) FROM animals;
 count
-------
    10
(1 row)

vet_clinic=# SELECT count(*) FROM animals WHERE escape_attempts = 0;
 count
-------
     2
(1 row)

vet_clinic=# SELECT AVG(weight_kg) FROM animals;
         avg
---------------------
 15.5500000000000000
(1 row)

vet_clinic=# SELECT MAX(escape_attempts) FROM animals GROUP BY neutered;
 max
-----
   1
   7
(2 rows)

vet_clinic=# SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;
 neutered | max
----------+-----
 f        |   1
 t        |   7
(2 rows)

vet_clinic=# SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
 species | min | max
---------+-----+-----
 pokemon |  11 |  17
 digimon | 5.7 |  45
(2 rows)

vet_clinic=# SELECT species, AVG(escape_attempts)
vet_clinic-# FROM animals
vet_clinic-# WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
vet_clinic-# GROUP BY species;
 species |        avg
---------+--------------------
 pokemon | 3.0000000000000000
(1 row)

*/