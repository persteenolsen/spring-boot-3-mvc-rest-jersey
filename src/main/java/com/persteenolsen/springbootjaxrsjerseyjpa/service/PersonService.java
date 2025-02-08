package com.persteenolsen.springbootjaxrsjerseyjpa.service;

import java.util.List;
import java.util.Optional;
 
import jakarta.persistence.EntityNotFoundException;
 
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
 
import com.persteenolsen.springbootjaxrsjerseyjpa.model.PersonEntity;
import com.persteenolsen.springbootjaxrsjerseyjpa.dao.PersonRepository;
 
@Service
public class PersonService {
 
    @Autowired
    PersonRepository personRepo;
    
    
    // --------------------------------These methods are used by the MVC Controller----------------------------
    // This method is getting all of the Persons
    public List<PersonEntity> getAll() {
        return (List<PersonEntity>) personRepo.findAll();
    }
 
    // This method get a Person by Id
    public PersonEntity getPersonById(long id) {

        PersonEntity person = null;
        Optional<PersonEntity> searchEntity = personRepo.findById(id);
        if (searchEntity.isPresent()) 
            person = searchEntity.get();
         else 
             throw new EntityNotFoundException();
         return person;
       }
       
       // Note: This method is used by Update + Create by MVC controller only
       public void saveOrUpdate(PersonEntity person) {
          personRepo.save(person);
       }

       // Note: This method is used by Update + Create by REST controller only
       public PersonEntity saveUpdate(PersonEntity person) {
        return personRepo.save(person);
     }
    
       // This method is used to delete a person by Id
       public void deletePerson(long id) {
          personRepo.deleteById(id);
       }
    
  
}