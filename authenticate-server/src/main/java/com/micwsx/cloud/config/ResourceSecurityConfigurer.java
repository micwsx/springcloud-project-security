package com.micwsx.cloud.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configurers.ResourceServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.token.store.JwtAccessTokenConverter;
import org.springframework.security.oauth2.provider.token.store.JwtTokenStore;

/**
 * @author Michael
 * @create 8/31/2020 2:27 PM
 * 资源服务器配置
 * ResourceServerConfigurerAdapter 用于保护oauth要开放的资源，同时主要作用于client端以及token的认证(Bear auth)
 */
@Configuration
@EnableResourceServer
public class ResourceSecurityConfigurer extends ResourceServerConfigurerAdapter {

    @Override
    public void configure(ResourceServerSecurityConfigurer resources) throws Exception {
        // 无状态token
        resources.tokenStore(new JwtTokenStore(accessTokenConverter())).stateless(true);
        resources.resourceId("demoApp");
    }

    /**
     * 配置JWT转换器
     *
     * @return
     */
    @Bean
    public JwtAccessTokenConverter accessTokenConverter() {
        JwtAccessTokenConverter converter = new JwtAccessTokenConverter();
        converter.setSigningKey("secret");
        return converter;
    }

    @Override
    public void configure(HttpSecurity http) throws Exception {

        http.csrf().disable().authorizeRequests().anyRequest().authenticated();

//        配置资源服务器的拦截规则
//        http .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
//                .and().requestMatchers().anyRequest()
//                .and().anonymous()
//                //user接口必须经过认证才可以访问
//                .and().authorizeRequests().antMatchers("/user/**").authenticated()
//                .and().httpBasic();
//                .and()
//                .exceptionHandling().accessDeniedHandler(new OAuth2AccessDeniedHandler());

    }
}
