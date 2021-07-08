package com.flowerPot.error;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path="/error")
public class errorController {
	
	@GetMapping
	public String error404() {
		return "error/error_404";
	}

}
