package com.skilldistillery.quarantineescape;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class QuarantineEscapeApplication extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(QuarantineEscapeApplication.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(QuarantineEscapeApplication.class, args);
	}

}
