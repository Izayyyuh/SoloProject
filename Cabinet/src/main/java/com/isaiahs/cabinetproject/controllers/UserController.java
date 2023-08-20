package com.isaiahs.cabinetproject.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.isaiahs.cabinetproject.models.User;
import com.isaiahs.cabinetproject.services.PatientService;
import com.isaiahs.cabinetproject.services.UserService;
import com.isaiahs.cabinetproject.validators.LoginValidation;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
@Controller
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private PatientService patientService;
	
	@GetMapping("")
	public String index(@ModelAttribute("newUser")User newUser, //loads empty bean
			Model viewModel) {
		
		//bind empty bean to login/reg form
		viewModel.addAttribute("loginUser", new LoginValidation()); //define & instantiates new class object
		return "index.jsp";
	}
	
	@PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
        
        // TO-DO Later -- call a register method in the service 
        // to do some extra validations and create a new user!
        User newestUser = this.userService.register(newUser, result); //uses register method to register User input from form
        if(result.hasErrors()) {
            // Be sure to send in the empty LoginUser before 
            // re-rendering the page.
           model.addAttribute("loginUser", new LoginValidation());
            return "index.jsp";
        }
        
     // TO-DO Later: Store their ID from the DB in session, 
        session.setAttribute("userId", newestUser.getId());
        // in other words, log them in.
        
        return "redirect:/";
	}
	
	@PostMapping("/login")
    public String login(@Valid @ModelAttribute("loginUser") LoginValidation newLogin, 
            BindingResult result, Model model, HttpSession session) {
        User user = this.userService.login(newLogin, result); //uses register method to register User input from form
    
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "index.jsp";
        }
        
        session.setAttribute("userId", user.getId());
    
        // in other words, log them in.
    
        return "redirect:/dashboard";
    }
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/dashboard")
	public String dashboard(Model viewModel, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		User currentUser = this.userService.findById((Long) session.getAttribute("userId"));
		viewModel.addAttribute("currentUser", currentUser);
		viewModel.addAttribute("allPatients", this.patientService.allPatients());
		return "dashboard.jsp";
		}
	
}
