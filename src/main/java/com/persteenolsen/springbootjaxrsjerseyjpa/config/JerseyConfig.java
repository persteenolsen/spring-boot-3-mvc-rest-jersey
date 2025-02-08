package com.persteenolsen.springbootjaxrsjerseyjpa.config;

import com.persteenolsen.springbootjaxrsjerseyjpa.controller.PersonJerseyRestController;

import org.glassfish.jersey.server.ResourceConfig;
import org.springframework.stereotype.Component;
 import jakarta.ws.rs.ApplicationPath;

@Component
 @ApplicationPath("/jax-rs")
public class JerseyConfig extends ResourceConfig {
    
    public JerseyConfig()
    {
        register(PersonJerseyRestController.class);
    }
}