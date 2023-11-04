package com.app.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.SpringServletContainerInitializer;

@SpringBootApplication
@ComponentScan({"com.app.demo", "com.app.demo.controller"})


public class EventManagementSystemApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		ConfigurableApplicationContext ctx = SpringApplication.run(EventManagementSystemApplication.class, args);
		
		System.out.println("Working ...");
	}
protected SpringApplicationBuilder configure(SpringApplicationBuilder builder)
{
	return builder.sources(EventManagementSystemApplication.class);
}
}
