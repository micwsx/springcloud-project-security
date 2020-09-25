package com.micwsx.cloud;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;

/**
 * @author Michael
 * @create 8/28/2020 3:41 PM
 */
@SpringBootApplication
public class AuthenticateServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(AuthenticateServerApplication.class, args);
    }
}
