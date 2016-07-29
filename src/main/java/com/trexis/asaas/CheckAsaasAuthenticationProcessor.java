package com.trexis.asaas;

import org.apache.camel.Exchange;
import org.apache.camel.Processor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.backbase.portal.foundation.business.service.UserBusinessService;
import com.backbase.portal.foundation.domain.conceptual.UserPropertyDefinition;
import com.backbase.portal.foundation.domain.model.User;

import org.springframework.security.core.context.SecurityContextHolder;

import java.io.BufferedReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.inject.Inject;

public class CheckAsaasAuthenticationProcessor implements Processor {
	
	private static Logger LOG = LoggerFactory.getLogger(CheckAsaasAuthenticationProcessor.class);
	
	private final String USER_AGENT = "Mozilla/5.0";
	
	@Inject
	UserBusinessService userBusinessService;

    public void process(Exchange exchange) throws Exception {
    	try{
			if(SecurityContextHolder.getContext().getAuthentication()!=null)
			{
				User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
				
				// UserPropertyDefinition bobUsername = user.getPropertyDefinitions().get("bob_username");
				
				String url = "https://web8.secureinternetbank.com/EBC_EBC1961";
				int responseCode = sendGet(url);
				
				LOG.info("Checking authentication on URL:  " + url);
				
				if(responseCode == 200){
					exchange.getOut().setBody("{'authenticated':'true'}");
				} else {
					exchange.getOut().setBody("{'authenticated':'false'}");
				}
				
			} else {
				exchange.getOut().setBody("{'authenticated':'false'}");
			}
		} catch(Exception ex){
			LOG.info("Unable to check user  " + ex.getMessage());
			
			throw new Exception("Unable to check user  " + ex.getMessage(), ex);
		}

    }
    
	private int sendGet(String url) throws Exception {
		
		URL obj = new URL(url);
		HttpURLConnection connection = (HttpURLConnection) obj.openConnection();

		connection.setRequestMethod("GET");

		connection.setRequestProperty("User-Agent", USER_AGENT);

		int responseCode = connection.getResponseCode();
//		System.out.println("\nSending 'GET' request to URL : " + url);
//		System.out.println("Response Code : " + responseCode);
//
//		System.out.println(responseCode);
		
		return responseCode;

	}
}
