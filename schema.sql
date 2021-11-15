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

CREATE TABLE vets(
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    age INT,
    date_of_graduation DATE
);

CREATE TABLE specializations(
	species_id INT,
	vets_id INT,
    FOREIGN KEY (species_id)
        REFERENCES species(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
	FOREIGN KEY (vets_id)
        REFERENCES vets(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
	PRIMARY KEY (species_id, vets_id)
);

CREATE TABLE visits(
	animals_id INT,
	vets_id INT,
    date_of_visit DATE,
    id INT GENERATED ALWAYS AS IDENTITY,
	FOREIGN KEY (animals_id)
        REFERENCES animals (id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
	FOREIGN KEY (vets_id)
        REFERENCES vets (id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    PRIMARY KEY(id)
);

CREATE INDEX animals_id_index ON visits (animals_id);
CREATE INDEX vets_id_index ON visits (vets_id);
CREATE INDEX owners_email_index ON owners (email);
