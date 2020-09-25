package com.micwsx.cloud.oauth2;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.oauth2.client.OAuth2RestTemplate;
import org.springframework.security.oauth2.client.token.grant.client.ClientCredentialsResourceDetails;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableOAuth2Client;

/**
 * @author Michael
 * @create 9/14/2020 4:44 PM
 */
@EnableOAuth2Client
@EnableConfigurationProperties
@Configuration
public class OAuth2ClientConfigure {

    // Client认证数据
    @Bean
    @ConfigurationProperties(prefix = "security.oauth2.client")
    public ClientCredentialsResourceDetails clientCredentialsResourceDetails(){
        return new ClientCredentialsResourceDetails();
    }

    // Bearer accessToken认证过程
    @Bean
    public OAuth2RestTemplate oAuth2RestTemplate(ClientCredentialsResourceDetails clientCredentialsResourceDetails){
        OAuth2RestTemplate oAuth2RestTemplate = new OAuth2RestTemplate(clientCredentialsResourceDetails);
        return oAuth2RestTemplate;
    }

}
