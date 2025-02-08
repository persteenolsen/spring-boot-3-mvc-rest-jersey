

package com.persteenolsen.springbootjaxrsjerseyjpa.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

// This Controller is saving a welcome message in the model to be used in the JSP View
// It is using GetMapping to get url request by both /home and /welcome
@Controller
public class ClientRestAngularController {
	
	private String helloworld = "";
		
	//@GetMapping({"/", "/clientrest"})
	@GetMapping("/clientrestangular")
	public String clientrest(Map<String, Object> model) {

		helloworld = "An AngularJS client / Jersey RESTful Web API";

		model.put("messageclientangularrest", helloworld);
				
		return "client_angular_rest";
	}
}