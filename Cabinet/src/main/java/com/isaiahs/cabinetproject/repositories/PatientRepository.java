package com.isaiahs.cabinetproject.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.isaiahs.cabinetproject.models.Patient;

public interface PatientRepository extends CrudRepository<Patient, Long> {
	List<Patient> findAll();
}
