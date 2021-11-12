/*Queries that provide answers to the questions from all projects.*/

SELECT name from animals WHERE name like '%mon';
SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' and '2019-12-31';
SELECT name from animals WHERE neutered IS TRUE and escape_attempts <3;
SELECT date_of_birth from animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts from animals WHERE weight_kg >10.5;
SELECT name from animals WHERE neutered IS TRUE;
SELECT name from animals WHERE name NOT IN ('Gabumon');
SELECT name from animals WHERE weight_kg BETWEEN 10.4 and 17.3;
BEGIN;
	UPDATE animals SET species='unspecified';
	ROLLBACK;
BEGIN;
	SELECT * FROM animals;
	UPDATE animals SET species='digimon' WHERE name like '%mon';
	UPDATE animals SET species='pokemon' WHERE species IS null;
	SELECT * FROM animals;
	COMMIT;
	SELECT * FROM animals;
BEGIN;
	DELETE FROM animals;
	SELECT * FROM animals;
	ROLLBACK;
	SELECT * FROM animals;
BEGIN;
	DELETE from animals WHERE date_of_birth > '2022-01-01';
	SELECT * FROM animals;
	SAVEPOINT yeartwentytwo;
	SELECT * FROM animals;
	UPDATE animals SET weight_kg = weight_kg * -1;
	SELECT * FROM animals;
	ROLLBACK TO yeartwentytwo;
	SELECT * FROM animals;
	UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg<0;
	SELECT * FROM animals;
	COMMIT;
SELECT neutered, 
	COUNT(neutered) as result FROM animals
	GROUP BY neutered
	ORDER BY result DESC LIMIT 1;
SELECT species,
	MAX(weight_kg) AS max_weight,
	MIN(weight_kg) AS min_weight FROM animals
	GROUP BY species;
SELECT species,
	AVG(escape_attempts) FROM animals
	WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
	GROUP BY species;
SELECT animals.name,
	owners.full_name
	FROM animals
	JOIN owners
	ON animals.owners_id = owners.id
	WHERE full_name = 'MelodyPond';

SELECT animals.name
	AS animal_name,
	species.name
	AS species_type
	FROM animals
	JOIN species
	ON animals.species_id = species.id
	WHERE species.name='Pokemon';

SELECT full_name,
	animals.name 
	FROM owners
	LEFT JOIN animals
	ON animals.owners_id = owners.id;

SELECT count(animals)
	FROM animals
	JOIN species
	ON animals.species_id = species.id;

SELECT animals.name
	FROM animals
	JOIN owners
	ON animals.owners_id = owners.id
	WHERE owners.full_name ='Jennifer Orwell';

SELECT animals.name, 
	animals.escape_attempts
	FROM animals
	INNER JOIN owners
	ON owners.id = animals.owners_id
  	WHERE owners.full_name = 'Dean Winchester'
  	AND animals.escape_attempts = 0;

SELECT owners.full_name, 
	COUNT(animals.name)
	AS total_animals
	FROM owners
	JOIN animals
	ON animals.owners_id = owners.id
	GROUP BY owners.full_name
	ORDER BY total_animals
	DESC LIMIT 1;
SELECT * FROM animals;

SELECT animals.name,
    owners.full_name
    FROM animals
    JOIN owners
    ON animals.owners_id = owners.id
    WHERE full_name = 'MelodyPond';

SELECT animals.name AS animal_name,
    species.name
    AS species_type
    FROM animals
    JOIN species
    ON animals.species_id = species.id
    WHERE species.name='Pokemon';

SELECT full_name,
    animals.name
    FROM owners
    LEFT JOIN animals
    ON animals.owners_id=owners.id;

SELECT count(animals)
    FROM animals
    JOIN species
    ON animals.species_id=species.id;

SELECT animals.name
    FROM animals
    JOIN owners
    ON animals.owners_id=owners.id
    WHERE owners.full_name='Jennifer Orwell';

SELECT animals.name, 
    animals.escape_attempts
    FROM animals
    INNER JOIN owners
    ON owners.id = animals.owners_id
    WHERE owners.full_name = 'Dean Winchester'
    AND animals.escape_attempts = 0;

SELECT owners.full_name, 
    COUNT(animals.name)
    AS total_animals
    FROM owners
    JOIN animals
    ON animals.owners_id=owners.id
    GROUP BY owners.full_name
    ORDER BY total_animals
    DESC LIMIT 1;