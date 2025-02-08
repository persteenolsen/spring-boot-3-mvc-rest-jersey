

package com.persteenolsen.springbootjaxrsjerseyjpa.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

// This Controller is saving a welcome message in the model to be used in the JSP View
// It is using GetMapping to get url request by both /home and /welcome
@Controller
public class ClientJerseyRestController {
	
	private String helloworld = "";
		
	//@GetMapping({"/", "/clientrest"})
	@GetMapping("/clientjerseyrest")
	public String clientrest(Map<String, Object> model) {

		helloworld = "JAX-RS Jersey REST JPA Web application!";

		model.put("messageclientjerseyrest", helloworld);
				
		return "client_jersey_rest";
	}
}