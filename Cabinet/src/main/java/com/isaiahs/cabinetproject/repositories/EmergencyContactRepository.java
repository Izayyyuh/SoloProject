package com.isaiahs.cabinetproject.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.isaiahs.cabinetproject.models.EmergencyContact;

public interface EmergencyContactRepository extends CrudRepository<EmergencyContact, Long> {
	List<EmergencyContact> findAll();
}
