package com.isaiahs.cabinetproject.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.isaiahs.cabinetproject.models.EmergencyContact;
import com.isaiahs.cabinetproject.models.Patient;
import com.isaiahs.cabinetproject.services.EmergencyContactService;
import com.isaiahs.cabinetproject.services.PatientService;
import com.isaiahs.cabinetproject.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class EmergencyContactController {

	@Autowired
	private PatientService patientService;
	@Autowired
	private UserService userService;
	@Autowired
	private EmergencyContactService emergencyContactService;
	
	@GetMapping("/emergencyContact/create/{patientId}") 
	public String createEmergencyContact(@PathVariable ("patientId") Long patientId, 
			@ModelAttribute ("newEmergencyContact")EmergencyContact emergencyContact,
			Model viewModel) {
		viewModel.addAttribute("thisPatient", this.patientService.findPatient(patientId));
	return "newEmergencyContact.jsp";
	}
	
	@PostMapping("/emergencyContact/create/{patientId}")
	public String createEmergencyContact(@Valid @ModelAttribute ("newEmergencyContact") EmergencyContact emergencyContact, BindingResult result, @PathVariable("patientId") Long patientId) {
		if(result.hasErrors()) {
			return "newEmergencyContact.jsp";
		}
		Patient patient = patientService.findPatient(patientId);
		if (patient == null) {
			return "newEmergencyContact.jsp";
		}
		
		emergencyContact.setPatient(patient);
		this.emergencyContactService.create(emergencyContact, patient );
		return "redirect:/dashboard";
	}
	
	@GetMapping("/emergencyContact/edit/{emergencyContactId}")
	public String editEmergencyContact(@PathVariable("emergencyContactId")Long id, Model viewModel, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		
		EmergencyContact emergencyContact = this.emergencyContactService.findEmergencyContact(id);
	    System.out.println("Retrieved emergencyContact: " + emergencyContact.getEmergencyContactName());
		
		viewModel.addAttribute("emergencyContactToEdit", emergencyContact);
		return "editEmergencyContact.jsp";
	}
	
	@PutMapping("/emergencyContact/edit/{emergencyContactId}")
	public String updateEmergencyContact(@PathVariable("emergencyContactId") Long emergencyContactId, @Valid @ModelAttribute("emergencyContactToEdit") EmergencyContact updatedEmergencyContact, BindingResult result, Model viewModel) {
		if(result.hasErrors()) {
			return "editEmergencyContact.jsp";
		}
		EmergencyContact existingEmergencyContact = emergencyContactService.findEmergencyContact(emergencyContactId);
		System.out.println(emergencyContactId);
		existingEmergencyContact.setEmergencyContactName(updatedEmergencyContact.getEmergencyContactName());
        existingEmergencyContact.setEmergencyContactPhoneNumber(updatedEmergencyContact.getEmergencyContactPhoneNumber());
        existingEmergencyContact.setEmergencyContactAddress(updatedEmergencyContact.getEmergencyContactAddress());
        
        emergencyContactService.update(existingEmergencyContact);
		return "redirect:/dashboard";
	}
	// when the edit form is submitted, a new emergency contact is being created instead of updating
	
	@GetMapping("/emergencyContacts/delete/{emergencyContactId}")
	public String removeEmergencyContact(@PathVariable("emergencyContactId")Long id) {
		this.emergencyContactService.deleteById(id);
		return "redirect:/dashboard";
	}
}
