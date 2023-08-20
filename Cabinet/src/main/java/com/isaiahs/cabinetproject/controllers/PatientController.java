package com.isaiahs.cabinetproject.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.isaiahs.cabinetproject.models.EmergencyContact;
import com.isaiahs.cabinetproject.models.Patient;
import com.isaiahs.cabinetproject.services.EmergencyContactService;
import com.isaiahs.cabinetproject.services.PatientService;
import com.isaiahs.cabinetproject.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class PatientController {
	@Autowired
	private PatientService patientService;
	@Autowired
	private UserService userService;
	@Autowired
	private EmergencyContactService emergencyContactService;
	
	@GetMapping("/patients/new") 
	public String index(@ModelAttribute ("newPatient") Patient newPatient, BindingResult result, Model viewModel ) {
		viewModel.addAttribute("allPatients", patientService.allPatients());
		return "newPatient.jsp";
	}
	@PostMapping("/patients/create")
	public String createPatient
	(@Valid @ModelAttribute ("newPatient") Patient newPatient, BindingResult result,
			@ModelAttribute("emergencyContact") EmergencyContact emergencyContact, HttpSession session ) {
		result.getErrorCount();
		System.out.println(result.getErrorCount());
		if(result.hasErrors()) {
			return "newPatient.jsp";
		}
		this.patientService.createPatient(newPatient, this.userService.findById((Long) session.getAttribute("userId")));
		return "redirect:/dashboard";
	}
	
	@GetMapping("/patients/{patientId}")
	public String viewPatient(@PathVariable("patientId") Long id, Model viewModel, HttpSession session) {
		viewModel.addAttribute("viewPatient", this.patientService.findPatient(id));
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		Patient patient = this.patientService.findPatient(id);
		List<EmergencyContact> emergencyContacts = patient.getEmergencyContact();
		if (emergencyContacts == null || emergencyContacts.isEmpty()) {
	        System.out.println("No emergency contacts found");
	    } else {
	        // Iterate through emergencyContacts and print their details
	        for (EmergencyContact emergencyContact : emergencyContacts) {
	            System.out.println("Emergency Contact Name: " + emergencyContact.getEmergencyContactName());
	            // Print other details as needed
	        }
	    }
	    return "view.jsp";
	}
	
	@GetMapping("/patients/edit/{patientId}")
	public String editPatient(@PathVariable("patientId")Long id, Model viewModel, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		viewModel.addAttribute("patientToEdit", this.patientService.findPatient(id));
		return "editPatient.jsp";
	}
	
	@PutMapping("/patients/update/{id}")
	public String updatePatient(@Valid @ModelAttribute("patientToEdit")Patient editedPatient, BindingResult result, Model viewModel, HttpSession session) {
		if(result.hasErrors()) {
		
			return "editProject.jsp";
		}
		this.patientService.updatePatient(editedPatient, this.userService.findById((Long) session.getAttribute("userId")));
		return "redirect:/dashboard";
	}
	
	@GetMapping("/delete/{patientId}")
	public String dischargePatient(@PathVariable("patientId")Long id) {
		this.patientService.deleteById(id);
		return "redirect:/dashboard";
	}
}
