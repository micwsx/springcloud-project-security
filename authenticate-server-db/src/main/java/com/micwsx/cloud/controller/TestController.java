package com.micwsx.cloud.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Michael
 * @create 9/2/2020 5:48 PM
 */
@RestController
@RequestMapping("/test")
public class TestController {

    @RequestMapping("/info")
    public String info() {
        return "/test/info";
    }

}
