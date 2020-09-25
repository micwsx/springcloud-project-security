package com.micwsx.cloud;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;

/**
 * Hello world!
 *
 */
@SpringBootApplication
public class AuthenticateServerDbApplication
{
    public static void main( String[] args )
    {
        SpringApplication.run(AuthenticateServerDbApplication.class,args);
    }
}
