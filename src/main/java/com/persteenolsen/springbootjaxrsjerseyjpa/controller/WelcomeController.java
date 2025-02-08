package com.persteenolsen.springbootjaxrsjerseyjpa.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

// This Controller is saving a welcome message in the model to be used in the JSP View
// It is using GetMapping to get url request by both /home and /welcome
@Controller
public class WelcomeController {
	
	private String helloworld = "";

	int mb = 1024*1024;

	//@GetMapping("/")
	//@GetMapping({"/welcome", "/home"})
	@GetMapping({"/", "/welcome"})
	public String welcome(Map<String, Object> model) {

	
	//Getting the runtime reference from system
	Runtime runtime = Runtime.getRuntime();
	
	//System.out.println("##### Heap utilization statistics [MB] #####");
	
	//Print used memory
	//System.out.println("Used Memory:" + (runtime.totalMemory() - runtime.freeMemory()) / mb);
    
	long usedmemory = (runtime.totalMemory() - runtime.freeMemory()) / mb;

	
	//Print free memory
	//System.out.println("Free Memory:" + runtime.freeMemory() / mb);
	long freememory = runtime.freeMemory() / mb;

	//Print total available memory
	//System.out.println("Total Memory:" + runtime.totalMemory() / mb);
	long totalmemory = runtime.totalMemory() / mb;
	
	//Print Maximum available memory
	//System.out.println("Max Memory:" + runtime.maxMemory() / mb);
	long maxmemory = runtime.maxMemory() / mb;
	
	String memoryheapS = "JVM Memory info in MB - Used: " + usedmemory + " Free: " + freememory + " Total: " + totalmemory + " Max: " + maxmemory;

	model.put("memorymessage", memoryheapS);

	helloworld = "Welcome to A Java Spring Boot 3 JAX-RS Jersey REST JPA Web application!!";

	model.put("welcomemessage", helloworld);

	// TEST 
	runtime.gc();
				
	return "welcome";
	}
}