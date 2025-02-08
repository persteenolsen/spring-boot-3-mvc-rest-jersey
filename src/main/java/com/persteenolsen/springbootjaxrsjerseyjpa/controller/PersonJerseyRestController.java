package com.persteenolsen.springbootjaxrsjerseyjpa.controller;

//import java.net.URI;
import java.util.List;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.DELETE;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.PUT;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import jakarta.ws.rs.core.Response.Status;

//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


import com.persteenolsen.springbootjaxrsjerseyjpa.model.PersonEntity;

import com.persteenolsen.springbootjaxrsjerseyjpa.service.PersonService;

@Component
@Path("/person-jersey")
public class PersonJerseyRestController {

	//private static final Logger logger = LoggerFactory.getLogger(PersonJerseyRestController.class);	
    
    @Autowired
    private PersonService personService;
    
    @GET
	@Path("/persons")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getAllPersons() {
    
        List<PersonEntity> list =  personService.getAll(); 
        
		return Response.ok(list).build();
    }
    
	@GET
	@Path("/person/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getPersonById(@PathParam("id") Long id) {
        
        PersonEntity person = personService.getPersonById(id);

        return Response.ok(person).build();
     }
    
     
	@POST
	@Path("/person")
	@Consumes(MediaType.APPLICATION_JSON)
	public Response createOrSavePerson( PersonEntity newPerson) {

        PersonEntity person = personService.saveUpdate( newPerson );
        
               if (person == null) {
               // logger.info("Article already exits.");
                  return Response.status(Status.CONFLICT).build();
                }
               return Response.status(Status.CREATED).build();
     }	
    
	    
    @PUT
	@Path("/person/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)	
    public Response updatePerson( PersonEntity newPerson, @PathParam("id") Long id) {
        PersonEntity person = personService.getPersonById(id);

         person.setName(newPerson.getName());
         person.setEmail(newPerson.getEmail());
         person.setAge(newPerson.getAge());

         PersonEntity p = personService.saveUpdate(person);
         
         if (p == null) {
         // logger.info("Article already exits.");
            return Response.status(Status.CONFLICT).build();
         }

      return Response.ok(p).build();
          
   }


	@DELETE
	@Path("/person/{id}")
	@Consumes(MediaType.APPLICATION_JSON)		
	public Response deletePerson(@PathParam("id") Long id) {

        personService.deletePerson(id);
        
		return Response.noContent().build();
	}	
} 