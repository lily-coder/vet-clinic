CREATE TABLE patients (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  date_of_birth date
)

CREATE TABLE treatments (
  id SERIAL PRIMARY KEY,
  type VARCHAR(255),
  name VARCHAR(255),
)

CREATE TABLE medical_histories (
  id SERIAL PRIMARY KEY,
  admitted_at TIMESTAMP,
  patient_id INT,
  status VARCHAR(255),
  CONSTRAINT FK_patient
  FOREIGN KEY(patient_id)
  REFERENCES patients(id)
)

CREATE INDEX patient_id_index ON medical_histories(patient_id);

CREATE TABLE invoices (
  id SERIAL PRIMARY KEY,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT,
  CONSTRAINT FK_medical_history
  FOREIGN KEY (medical_history_id) 
  REFERENCES medical_histories(id)
)

CREATE INDEX medical_id_index ON invoices(medical_history_id);
