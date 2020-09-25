package com.micwsx.cloud.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.oauth2.client.OAuth2RestTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * @author Michael
 * @create 9/15/2020 3:31 PM
 */
@RestController
@RequestMapping("/order")
public class OrderController {


    @Autowired
    private OAuth2RestTemplate oAuth2RestTemplate;

    @RequestMapping("/detail")
    public String detail() {

        String resourceUrl="http://127.0.0.1:8902/test/info";
//        MultiValueMap<String, String> formData = new LinkedMultiValueMap<String, String>();
//        formData.add("client_id", clientCredentialsResourceDetails.getClientId());
//        formData.add("client_secret", clientCredentialsResourceDetails.getClientSecret());
//        formData.add("grant_type", clientCredentialsResourceDetails.getGrantType());
//        formData.add("scope", String.join(",",clientCredentialsResourceDetails.getScope()));
//        HttpHeaders headers = new HttpHeaders();
//        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        String content = oAuth2RestTemplate.postForEntity(resourceUrl, HttpMethod.POST, String.class).getBody();
        System.out.println(content);
        return "订单获取成功！";
    }
}
