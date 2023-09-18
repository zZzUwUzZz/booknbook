package com.cjcs.bnb;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

@SpringBootApplication(exclude = {SecurityAutoConfiguration.class})
public class BnbApplication {

	public static void main(String[] args) {
		SpringApplication.run(BnbApplication.class, args);
	}



	
}
