package com.isaiahs.cabinetproject.services;

import java.util.List;
import java.util.Optional;
import java.util.Random;

import org.springframework.stereotype.Service;

import com.isaiahs.cabinetproject.models.Patient;
import com.isaiahs.cabinetproject.models.User;
import com.isaiahs.cabinetproject.repositories.PatientRepository;

@Service
public class PatientService {
	
	private final PatientRepository patientRepository;
	
	public PatientService(PatientRepository patientRepository) {
		this.patientRepository = patientRepository;
	}
	
	public List<Patient> allPatients() {
		return patientRepository.findAll();
	}
	
	public Patient createPatient(Patient p, User user) {
		p.setCreator(user);
		Random rand = new Random();
		Integer randomMedicalRecordsNumber = rand.nextInt(1000000);
		p.setMedicalRecordsNumber(randomMedicalRecordsNumber);
		return this.patientRepository.save(p);
	}
	
	public Patient findPatient(Long id) {
		Optional<Patient> optionalPatient = patientRepository.findById(id);
		if(optionalPatient.isPresent()) {
			return optionalPatient.get();
		} else {
			return null;
		}
	}
	
	public Patient updatePatient(Patient p, User user) {
		p.setCreator(user);
    	return patientRepository.save(p);
    }
	
	 public void deleteById(Long id) {
	    	this.patientRepository.deleteById(id);
	    }
}
