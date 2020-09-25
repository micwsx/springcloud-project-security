package com.micwsx.cloud.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configurers.ResourceServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.oauth2.provider.token.store.JwtAccessTokenConverter;
import org.springframework.security.oauth2.provider.token.store.JwtTokenStore;
import org.springframework.util.FileCopyUtils;

import java.io.IOException;

/**
 * @author Michael
 * @create 8/31/2020 2:27 PM
 * 资源服务器配置
 * ResourceServerConfigurerAdapter 用于保护oauth要开放的资源，同时主要作用于client端以及token的认证(Bear auth)
 */
//@Configuration
//@EnableResourceServer
//public class ResourceSecurityConfigurer extends ResourceServerConfigurerAdapter {
//
//    @Autowired
//    private TokenStore tokenStore;
//
//
//    @Override
//    public void configure(ResourceServerSecurityConfigurer resources) throws Exception {
//        // 无状态token
//        resources.tokenStore(tokenStore);
////        resources.tokenStore(new JwtTokenStore(jwtTokenEnhancer())).stateless(true);
//        resources.resourceId("oauth-server");
//    }
//
//    /**
//     * 配置JWT转换器,公匙验证JWT token
//     * @return
//     */
//    @Bean
//    public JwtAccessTokenConverter jwtTokenEnhancer() {
//        // 用作JWT转换器
//        JwtAccessTokenConverter converter =  new JwtAccessTokenConverter();
//        Resource resource = new ClassPathResource("public_jwt.pem");
//        String publicKey;
//        try {
//            publicKey = new String(FileCopyUtils.copyToByteArray(resource.getInputStream()));
//        } catch (IOException e) {
//            throw new RuntimeException(e);
//        }
//        //设置公钥
//        converter.setVerifierKey(publicKey);
//        return converter;
//    }
//
//    @Override
//    public void configure(HttpSecurity http) throws Exception {
//        // 认证所有资源
//        http.csrf().disable().authorizeRequests().anyRequest().authenticated();
//
//        //配置资源服务器的拦截规则
////        http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
////                .and().requestMatchers().anyRequest()
////                .and().anonymous()
////                //test_resource接口必须经过认证才可以访问
////                .and().authorizeRequests().antMatchers("/test_resource").authenticated()
////                .and().httpBasic()
////                .and()
////                .exceptionHandling().accessDeniedHandler(new OAuth2AccessDeniedHandler());
//
//    }
//}
