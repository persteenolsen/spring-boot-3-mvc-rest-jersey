package com.persteenolsen.springbootjaxrsjerseyjpa.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

// This Controller is saving a welcome message in the model to be used in the JSP View
// It is using GetMapping to get url request by both /home and /welcome
@Controller
public class ClientRestReactCreateController {
	
	private String helloworld = "";
		
	//@GetMapping({"/", "/clientrest"})
	@GetMapping("/clientrestreactcreate")
	public String clientrest(Map<String, Object> model) {

		helloworld = "Create a Person by a ReactJS client / Jersey RESTful Web API";

		model.put("messageclientreactcreaterest", helloworld);
				
		return "client_react_create_rest";
	}
}