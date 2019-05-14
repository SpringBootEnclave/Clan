package vn.edu.vinaenter.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")
public class AdminIndexController {
	@GetMapping("")
	public String index(Principal principal) {
		System.out.println("fdfđff");
		
		System.out.println("Username: "+ principal.getName());
		return "cland.admin.index.index";
	}

}
