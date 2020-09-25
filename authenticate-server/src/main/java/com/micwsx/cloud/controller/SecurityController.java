package com.micwsx.cloud.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;

/**
 * @author Michael
 * @create 9/3/2020 2:34 PM
 */
@RestController
@RequestMapping("/oauth")
public class SecurityController {

    private Logger logger = LoggerFactory.getLogger(getClass());

    @RequestMapping(value = "/check", method = RequestMethod.GET)
    public Principal getUser(Principal principal) {
        logger.info("security server check================>>>" + principal.toString());
        return principal;
    }
}

