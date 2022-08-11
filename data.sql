/* Populate database with sample data. */
INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    ('Agumon', 'February 3, 2020', 0, TRUE, 10.23),
    ('Gabumon', 'November 15, 2018', 2, TRUE, 8),
    ('Pikachu', 'January 7, 2021', 1, FALSE, 15.04),
    ('Devimon', 'May 12, 2017', 5, TRUE, 11),
    ('Charmander', 'February 8, 2020', 0, TRUE, -11),
    ('Plantmon', 'November 15, 2021', 2, TRUE, -5.7),
    ('Squirtle', 'April 2, 1993', 3, TRUE, -12.13),
    ('Angemon', 'June 12, 2005', 1, FALSE, -45),
    ('Boarmon', 'June 7, 2005', 7, TRUE, 20.4),
    ('Blossom', 'October 13, 1998', 3, TRUE, 17),
    ('Ditto', 'May 14, 2022', 4, TRUE, 22);

INSERT INTO
    owners(full_name, age)
VALUES
    ('Sam Smith', 34),
    ('Jennifer Orwell', 19),
    ('Bob', 45),
    ('Melody Pond', 77),
    ('Dean Winchester', 14),
    ('Jodie Whittaker', 38);

INSERT INTO
    species(name)
VALUES
    ('Pokemon'),
    ('Digimon');

UPDATE
    animals
SET
    species_id = species.id
FROM
    species
WHERE
    animals.name like '%mon'
    AND species.name = 'Digimon';

UPDATE
    animals
SET
    species_id = species.id
FROM
    species
WHERE
    animals.name NOT like '%mon'
    AND species.name = 'Pokemon';

UPDATE
    animals
SET
    owner_id = owners.id
FROM
    owners
WHERE
    animals.name = 'Agumon'
    AND owners.full_name = 'Sam Smith';

UPDATE
    animals
SET
    owner_id = owners.id
FROM
    owners
WHERE
    animals.name IN ('Gabumon', 'Pikachu')
    AND owners.full_name = 'Jennifer Orwell';

UPDATE
    animals
SET
    owner_id = owners.id
FROM
    owners
WHERE
    animals.name IN ('Devimon', 'Plantmon')
    AND owners.full_name = 'Bob';

-- Melody Pond owns Charmander, Squirtle, and Blossom.
UPDATE
    animals
SET
    owner_id = owners.id
FROM
    owners
WHERE
    animals.name IN ('Charmander', 'Squirtle', 'Blossom')
    AND owners.full_name = 'Melody Pond';

-- Dean Winchester owns Angemon and Boarmon.
UPDATE
    animals
SET
    owner_id = owners.id
FROM
    owners
WHERE
    animals.name IN ('Angemon', 'Boarmon')
    AND owners.full_name = 'Dean Winchester';

/*
 Insert the following data for vets:
 Vet William Tatcher is 45 years old and graduated Apr 23rd, 2000.
 Vet Maisy Smith is 26 years old and graduated Jan 17th, 2019.
 Vet Stephanie Mendez is 64 years old and graduated May 4th, 1981.
 Vet Jack Harkness is 38 years old and graduated Jun 8th, 2008.
 */
 
INSERT INTO
    vets (name, age, date_of_graduation)
VALUES
    ('William Tatcher', 45, 'April 23, 2000'),
    ('Maisy Smith', 26, 'January 17, 2019'),
    ('Stephanie Mendez', 64, 'May 4, 1981'),
    ('Jack Harkness', 38, 'June 8, 2008');

-- Insert the following data for specialties:
-- Vet William Tatcher is specialized in Pokemon.
INSERT INTO
    specializations (species_id, vet_id)
SELECT
    species.id,
    vets.id
FROM
    species,
    vets
WHERE
    species.name = 'Pokemon'
    AND vets.name = 'William Tatcher';

-- Vet Stephanie Mendez is specialized in Digimon and Pokemon.
INSERT INTO
    specializations (species_id, vet_id)
SELECT
    species.id,
    vets.id
FROM
    species,
    vets
WHERE
    species.name IN ('Digimon', 'Pokemon')
    AND vets.name = 'Stephanie Mendez';

-- Vet Jack Harkness is specialized in Digimon.
INSERT INTO
    specializations (species_id, vet_id)
SELECT
    species.id,
    vets.id
FROM
    species,
    vets
WHERE
    species.name = 'Digimon'
    AND vets.name = 'Jack Harkness';

/*
Agumon visited William Tatcher on May 24th,
2020.Agumon visited Stephanie Mendez on Jul 22th,
2020.Gabumon visited Jack Harkness on Feb 2nd,
2021.Pikachu visited Maisy Smith on Jan 5th,
2020.Pikachu visited Maisy Smith on Mar 8th,
2020.Pikachu visited Maisy Smith on May 14th,
2020.Devimon visited Stephanie Mendez on May 4th,
2021.Charmander visited Jack Harkness on Feb 24th,
2021.Plantmon visited Maisy Smith on Dec 21st,
2019.Plantmon visited William Tatcher on Aug 10th,
2020.Plantmon visited Maisy Smith on Apr 7th,
2021.Squirtle visited Stephanie Mendez on Sep 29th,
2019.Angemon visited Jack Harkness on Oct 3rd,
2020.Angemon visited Jack Harkness on Nov 4th,
2020.Boarmon visited Maisy Smith on Jan 24th,
2019.Boarmon visited Maisy Smith on May 15th,
2019.Boarmon visited Maisy Smith on Feb 27th,
2020.Boarmon visited Maisy Smith on Aug 3rd,
2020.Blossom visited Stephanie Mendez on May 24th,
2020.Blossom visited William Tatcher on Jan 11th,
2021.
*/


-- Agumon visited William Tatcher on May 24th, 2020.

INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
SELECT
    animals.id,
    vets.id,
    'May 24, 2020'
FROM
    animals,
    vets
WHERE
    animals.name = 'Agumon'
    AND vets.name = 'William Tatcher';

-- Agumon visited Stephanie Mendez on Jul 22th, 2020

INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
SELECT
    animals.id,
    vets.id,
    'July 22, 2020'
FROM
    animals,
    vets
WHERE
    animals.name = 'Agumon'
    AND vets.name = 'Stephanie Mendez';

-- Gabumon visited Jack Harkness on Feb 2nd, 2021.

INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
SELECT
    animals.id,
    vets.id,
    'February 2, 2021'
FROM
    animals,
    vets
WHERE
    animals.name = 'Gabumon'
    AND vets.name = 'Jack Harkness';
    
-- Pikachu visited Maisy Smith on Jan 5th, 2020.

INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
SELECT
    animals.id,
    vets.id,
    'January 5, 2020'
FROM
    animals,
    vets
WHERE
    animals.name = 'Pikachu'
    AND vets.name = 'Maisy Smith';

-- Pikachu visited Maisy Smith on Mar 8th, 2020.

INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
SELECT
    animals.id,
    vets.id,
    'March 8, 2020'
FROM
    animals,
    vets
WHERE
    animals.name = 'Pikachu'
    AND vets.name = 'Maisy Smith';

-- Pikachu visited Maisy Smith on May 14th, 2020.

INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
SELECT
    animals.id,
    vets.id,
    'May 14, 2020'
FROM
    animals,
    vets
WHERE
    animals.name = 'Pikachu'
    AND vets.name = 'Maisy Smith';

-- Devimon visited Stephanie Mendez on May 4th, 2021.

INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
SELECT
    animals.id,
    vets.id,
    'May 4, 2021'
FROM
    animals,
    vets
WHERE
    animals.name = 'Devimon'
    AND vets.name = 'Stephanie Mendez';

-- Charmander visited Jack Harkness on Feb 24th, 2021.

INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
SELECT
    animals.id,
    vets.id,
    'February 24, 2021'
FROM
    animals,
    vets
WHERE
    animals.name = 'Charmander'
    AND vets.name = 'Jack Harkness';

-- Plantmon visited Maisy Smith on Dec 21st, 2019.

INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
SELECT
    animals.id,
    vets.id,
    'December 21, 2019'
FROM
    animals,
    vets
WHERE
    animals.name = 'Plantmon'
    AND vets.name = 'Maisy Smith';

-- Plantmon visited William Tatcher on Aug 10th, 2020.

INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
SELECT
    animals.id,
    vets.id,
    'August 10, 2020'
FROM
    animals,
    vets
WHERE
    animals.name = 'Plantmon'
    AND vets.name = 'William Tatcher';

INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
SELECT
    animals.id,
    vets.id,
    'April 7, 2021'
FROM
    animals,
    vets
WHERE
    animals.name = 'Plantmon'
    AND vets.name = 'Maisy Smith';


INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
SELECT
    animals.id,
    vets.id,
    'September 29, 2019'
FROM
    animals,
    vets
WHERE
    animals.name = 'Squirtle'
    AND vets.name = 'Stephanie Mendez';


INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
SELECT
    animals.id,
    vets.id,
    'October 3, 2020'
FROM
    animals,
    vets
WHERE
    animals.name = 'Angemon'
    AND vets.name = 'Jack Harkness';


INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
SELECT
    animals.id,
    vets.id,
    'November 4, 2020'
FROM
    animals,
    vets
WHERE
    animals.name = 'Angemon'
    AND vets.name = 'Jack Harkness';


INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
SELECT
    animals.id,
    vets.id,
    'January 24, 2019'
FROM
    animals,
    vets
WHERE
    animals.name = 'Boarmon'
    AND vets.name = 'Maisy Smith';


INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
SELECT
    animals.id,
    vets.id,
    'May 15, 2019'
FROM
    animals,
    vets
WHERE
    animals.name = 'Boarmon'
    AND vets.name = 'Maisy Smith';


INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
SELECT
    animals.id,
    vets.id,
    'February 27, 2020'
FROM
    animals,
    vets
WHERE
    animals.name = 'Boarmon'
    AND vets.name = 'Maisy Smith';


INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
SELECT
    animals.id,
    vets.id,
    'August 3, 2020'
FROM
    animals,
    vets
WHERE
    animals.name = 'Boarmon'
    AND vets.name = 'Maisy Smith';


INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
SELECT
    animals.id,
    vets.id,
    'May 24, 2020'
FROM
    animals,
    vets
WHERE
    animals.name = 'Blossom'
    AND vets.name = 'Stephanie Mendez';


INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
SELECT
    animals.id,
    vets.id,
    'January 11, 2021'
FROM
    animals,
    vets
WHERE
    animals.name = 'Blossom'
    AND vets.name = 'William Tatcher';