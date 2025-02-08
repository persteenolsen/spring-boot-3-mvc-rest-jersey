package com.persteenolsen.springbootjaxrsjerseyjpa.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

// This Controller is saving a welcome message in the model to be used in the JSP View
// It is using GetMapping to get url request by both /home and /welcome
@Controller
public class ClientRestReactListController {
	
	private String helloworld = "";
		
	//@GetMapping({"/", "/clientrest"})
	@GetMapping("/clientrestreactlist")
	public String clientrest(Map<String, Object> model) {

		helloworld = "A ReactJS admin client / Jersey RESTful Web API";

		model.put("messageclientreactlistrest", helloworld);
				
		return "client_react_list_rest";
	}
}