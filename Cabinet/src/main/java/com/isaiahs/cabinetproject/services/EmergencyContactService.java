package com.isaiahs.cabinetproject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.isaiahs.cabinetproject.models.EmergencyContact;
import com.isaiahs.cabinetproject.models.Patient;
import com.isaiahs.cabinetproject.repositories.EmergencyContactRepository;
@Service
public class EmergencyContactService {
	@Autowired
	private EmergencyContactRepository emergencyContactRepository; 
	
	public EmergencyContact create(EmergencyContact newEmergencyContact, Patient p) {
		newEmergencyContact.setPatient(p);
		return this.emergencyContactRepository.save(newEmergencyContact);
	}
	
	public EmergencyContact update(EmergencyContact newEmergencyContact) {
		return this.emergencyContactRepository.save(newEmergencyContact);
	}
	
	public void deleteById(Long id) {
		this.emergencyContactRepository.deleteById(id);
	}
	
	public EmergencyContact findEmergencyContact(Long id) {
		Optional<EmergencyContact> optionalEmergencyContact = emergencyContactRepository.findById(id);
		if(optionalEmergencyContact.isPresent()) {
			return optionalEmergencyContact.get();
		} else {
			return null;
		}
	}

	public List<EmergencyContact> allEmergencyContacts() {
		return emergencyContactRepository.findAll();
	}
}
