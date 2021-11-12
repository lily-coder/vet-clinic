/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;

CREATE TABLE animals (
    id INT,
    name TEXT,
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL,
    PRIMARY KEY(id)
);

ALTER TABLE animals 
    ADD species VARCHAR;

CREATE TABLE owners(
	id SERIAL PRIMARY KEY,                    
	full_name VARCHAR,   
	age INT
);

CREATE TABLE species(
	id SERIAL PRIMARY KEY,
	name VARCHAR
);

ALTER TABLE animals DROP species;
ALTER TABLE animals
	ADD COLUMN species_id INT,
	ADD CONSTRAINT fk_species
	FOREIGN KEY (species_id) 
	REFERENCES species(id)
;

ALTER TABLE animals 
	ADD COLUMN owners_id INT,
	ADD CONSTRAINT fk_owners
	FOREIGN KEY (owners_id)
	REFERENCES owners(id)
; 
SELECT * FROM animals;