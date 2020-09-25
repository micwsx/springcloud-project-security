package com.micwsx.cloud.controller;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import sun.net.www.MessageHeader;
import sun.net.www.protocol.http.AuthenticationHeader;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static org.springframework.http.HttpStatus.*;

/**
 * @author Michael
 * @create 9/10/2020 2:43 PM
 */
@RestController
@RequestMapping("/test")
public class TestController {

    @RequestMapping("/getSession")
    public void getSession(HttpServletRequest request, HttpServletResponse response) {

        Map<String, String> urlMap = new HashMap<>();
        StringBuffer requestURL = request.getRequestURL();
        urlMap.put("requestURL", requestURL.toString());
        urlMap.put("scheme", request.getScheme());
        urlMap.put("serverName", request.getServerName());
        urlMap.put("contextPaht", request.getContextPath());
        urlMap.put("servletPath", request.getServletPath());
        System.out.println(urlMap);

        Map<String, String> headerMap = new HashMap<>();
        Enumeration<String> headerNames = request.getHeaderNames();
        Collections.list(headerNames).forEach(headName -> {
            Enumeration<String> headerValues = request.getHeaders(headName);
            String arrayValues = String.join(",", Collections.list(headerValues));
            headerMap.put(headName, arrayValues);
        });
        System.out.println(headerMap);

        Cookie[] cookies = request.getCookies();

        if (cookies!=null){
            for (int i = 0; i < cookies.length; i++) {
                System.out.println(cookies[i].getName() + ":" + cookies[i].getValue() + ":" + cookies[i].getDomain() + ":" + cookies[i].getPath());
            }
        }

        System.out.println(request.getHeader("X-Auhtorization"));
        String sessionId = request.getSession().getId();

//        Object name = request.getSession().getAttribute("name");
//        if (name == null) {
//            // 添加一个session,一个cookie和一个Header
//            request.getSession().setAttribute("name", "Michael");
//            Cookie cookie = new Cookie("city", "Sh");
//            response.addCookie(cookie);
//            response.addHeader("X-Auhtorization", "jack");
//        }

        // 打印sessionid
        try {
            response.getWriter().write(sessionId);
        } catch (IOException e) {
            e.printStackTrace();
        }


    }
}
