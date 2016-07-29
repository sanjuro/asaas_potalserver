package com.trexis.asaas;

import org.apache.camel.Exchange;
import org.apache.camel.Processor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.backbase.portal.foundation.business.service.UserBusinessService;
import com.backbase.portal.foundation.domain.conceptual.UserPropertyDefinition;
import com.backbase.portal.foundation.domain.model.User;

import org.springframework.security.core.context.SecurityContextHolder;

import javax.inject.Inject;

public class CheckAsaasAuthenticationProcessor implements Processor {
	
	private static Logger LOG = LoggerFactory.getLogger(CheckAsaasAuthenticationProcessor.class);
	
	@Inject
	UserBusinessService userBusinessService;

    public void process(Exchange exchange) throws Exception {
    	try{
			if(SecurityContextHolder.getContext().getAuthentication()!=null)
			{
				User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
				
				// UserPropertyDefinition bobUsername = user.getPropertyDefinitions().get("bob_username");
				
				// LOG.info("Capturing authentication for  " + bobUsername);
				
				exchange.getOut().setBody("User is authenticated.");
				
			} else {
				exchange.getOut().setBody("User is not authenticated.");
			}
		} catch(Exception ex){
			LOG.info("Unable to check user  " + ex.getMessage());
			
			throw new Exception("Unable to check user  " + ex.getMessage(), ex);
		}

    }
    
}
