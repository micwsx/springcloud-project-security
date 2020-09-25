package com.micwsx.cloud.controller;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

/**
 * @author Michael
 * @create 8/28/2020 3:44 PM
 */
@RestController
@RequestMapping("/user")
public class AuthenticateController {

    private Logger logger=LoggerFactory.getLogger(getClass());

    @RequestMapping("/getCurrentUser")
    public Object user(Authentication authentication) {
        logger.info(authentication.getPrincipal().toString());
        return authentication.getPrincipal();
    }

    @RequestMapping("/info")
    public String info() {
        return "/user/info";
    }


    @RequestMapping(value = "/check",method = RequestMethod.GET)
    public Principal check(Principal principal) {
        logger.info(principal.toString());
        return principal;
    }


}
