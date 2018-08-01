package springsecurity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	@GetMapping("/")
	public String getIndex(){
		return "index";
	}
	
	@GetMapping("/admin")
	public String getAdmins(){
		return "admin";
	}
	
	@GetMapping("/manager")
	public String getManagers(){
		return "manager";
	}
	
	@GetMapping("/boss")
	public String getBoss(){
		return "boss";
	}
	
}
