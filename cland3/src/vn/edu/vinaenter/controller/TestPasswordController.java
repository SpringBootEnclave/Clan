package vn.edu.vinaenter.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("test-password")
public class TestPasswordController {
	
	@Autowired
	private BCryptPasswordEncoder encoder;/*thư viện mã hóa thêm vô lib*/
	
	@ResponseBody 
	@GetMapping("test")
	public String login() {
		return encoder.encode("123456");
	}
	

}
