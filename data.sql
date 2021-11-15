INSERT INTO animals
	(id,name,date_of_birth,escape_attempts,neutered,weight_kg)
	VALUES (1, 'Agumon', '2020-02-03', 0, TRUE, 10.23);
INSERT INTO animals
	(id,name,date_of_birth,escape_attempts,neutered,weight_kg)
	VALUES (2, 'Gabumon', '2018-11-15', 2, TRUE, 8.0);
INSERT INTO animals
	(id,name,date_of_birth,escape_attempts,neutered,weight_kg)
	VALUES (3, 'Pikachu', '2021-01-07', 1, FALSE, 15.04);
INSERT INTO animals
	(id,name,date_of_birth,escape_attempts,neutered,weight_kg)
	VALUES (4, 'Devimon', '2017-05-12', 5, TRUE, 11.0);
INSERT INTO animals
	(id,name,date_of_birth,escape_attempts,neutered,weight_kg)
	VALUES (5, 'Charmander', '2020-02-08', 0, FALSE, -11.0);
INSERT INTO animals
	(id,name,date_of_birth,escape_attempts,neutered,weight_kg)
	VALUES (6, 'Plantmon', '2022-11-15', 2, TRUE, -5.7);
INSERT INTO animals
	(id,name,date_of_birth,escape_attempts,neutered,weight_kg)
	VALUES (7, 'Squirtle', '1993-04-02', 3, FALSE, -12.13);
INSERT INTO animals
	(id,name,date_of_birth,escape_attempts,neutered,weight_kg)
	VALUES (8, ' Angemon', '2005-06-12', 1, TRUE, -45);
INSERT INTO animals
	(id,name,date_of_birth,escape_attempts,neutered,weight_kg)
	VALUES (9, ' Boarmon', '2005-06-07', 7, TRUE, 20.4);
INSERT INTO animals
	(id,name,date_of_birth,escape_attempts,neutered,weight_kg)
	VALUES (10, ' Blossom', '1998-10-13', 3, TRUE, 17);
INSERT INTO owners (full_name, age)
	VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age)
	VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age)
	VALUES ('Bob', 45);
INSERT INTO owners (full_name, age)
	VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age)
	VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age)
	VALUES ('Jodie Whittaker', 38);

INSERT INTO species (name)
	VALUES ('Pokemon');
INSERT INTO species (name)
	VALUES ('Digimon');
SELECT * FROM animals;
BEGIN;
UPDATE animals SET species_id = 1
	WHERE name LIKE '%mon';
UPDATE animals SET species_id = 2
	WHERE species_id IS NULL;
COMMIT;

BEGIN;
	UPDATE animals SET owners_id = 1
		WHERE name LIKE 'Agumon';
	UPDATE animals SET owners_id = 2
		WHERE id IN (2, 3);
	UPDATE animals SET owners_id = 3
		WHERE id IN (4, 11);
	UPDATE animals SET owners_id = 4
		WHERE id IN (5, 7, 10);
	UPDATE animals SET owners_id = 5
		WHERE id IN (8, 9);
COMMIT;

BEGIN;
    INSERT INTO vets
        (name, age, date_of_graduation)
        VALUES ('William Tatcher', 45, '2000-04-23');
    INSERT INTO vets
        (name, age, date_of_graduation)
        VALUES ('Maisy Smith', 26, '2019-01-17');
    INSERT INTO vets
        (name, age, date_of_graduation)
        VALUES ('Stephanie Mendez', 64, '1981-05-04');
    INSERT INTO vets
        (name, age, date_of_graduation)
        VALUES ('Jack Harkness', 38, '2008-06-08');
COMMIT;

BEGIN;
    INSERT INTO specializations
        (species_id, vets_id)
        VALUES (1, 2);
    INSERT INTO specializations
        (species_id, vets_id)
        VALUES (1, 4);
    INSERT INTO specializations
        (species_id, vets_id)
        VALUES (2, 5);
COMMIT;

BEGIN;
    INSERT INTO visits
        (animals_id, vets_id, date_of_visit)
        VALUES (1, 2, '2020-05-24');
    INSERT INTO visits
        (animals_id, vets_id, date_of_visit)
        VALUES (1, 4, '2020-07-22');
    INSERT INTO visits
        (animals_id, vets_id, date_of_visit)
        VALUES (2, 5, '2021-02-02');
    INSERT INTO visits
        (animals_id, vets_id, date_of_visit)
        VALUES (3, 3, '2020-01-05');
    INSERT INTO visits
        (animals_id, vets_id, date_of_visit)
        VALUES (3, 3, '2020-03-08');
    INSERT INTO visits
        (animals_id, vets_id, date_of_visit)
        VALUES (3, 3, '2020-05-14');
    INSERT INTO visits
        (animals_id, vets_id, date_of_visit)
        VALUES (4, 4, '2021-05-04');
    INSERT INTO visits
        (animals_id, vets_id, date_of_visit)
        VALUES (5, 5, '2021-02-24');
    INSERT INTO visits
        (animals_id, vets_id, date_of_visit)
        VALUES (11, 3, '2019-12-21');
    INSERT INTO visits
        (animals_id, vets_id, date_of_visit)
        VALUES (11, 2, '2020-08-10');
    INSERT INTO visits
        (animals_id, vets_id, date_of_visit)
        VALUES (11, 3, '2021-04-07');
    INSERT INTO visits
        (animals_id, vets_id, date_of_visit)
        VALUES (7, 4, '2019-09-29');
    INSERT INTO visits
        (animals_id, vets_id, date_of_visit)
        VALUES (8, 5, '2020-10-03');
    INSERT INTO visits
        (animals_id, vets_id, date_of_visit)
        VALUES (8, 5, '2020-11-04');
    INSERT INTO visits
        (animals_id, vets_id, date_of_visit)
        VALUES (9, 3, '2019-01-24');
    INSERT INTO visits
        (animals_id, vets_id, date_of_visit)
        VALUES (9, 3, '2019-05-15');
    INSERT INTO visits
        (animals_id, vets_id, date_of_visit)
        VALUES (9, 3, '2020-02-27');
    INSERT INTO visits
        (animals_id, vets_id, date_of_visit)
        VALUES (9, 3, '2020-08-03');
    INSERT INTO visits
        (animals_id, vets_id, date_of_visit)
        VALUES (10, 4, '2020-05-24');
    INSERT INTO visits
        (animals_id, vets_id, date_of_visit)
        VALUES (10, 2, '2021-01-11');
COMMIT;

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits 
    (animals_id, vets_id, date_of_visit)
    SELECT * FROM (SELECT id FROM animals) animal_ids,
    (SELECT id FROM vets) vets_ids,
    generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
INSERT INTO owners
    (full_name, email)
    select 'Owner ' || generate_series(1,2500000),
    'owner_' || generate_series(1,2500000) || '@mail.com';
