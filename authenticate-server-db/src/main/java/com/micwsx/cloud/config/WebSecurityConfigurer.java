package com.micwsx.cloud.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;

import javax.sql.DataSource;

/**
 * @author Michael
 * @create 8/28/2020 3:59 PM
 * WebSecurityConfigurerAdapter用于保护oauth相关的endpoints，同时主要作用于用户登录(form login,basic auth)
 */
@Configuration
@EnableWebSecurity(debug = true)
public class WebSecurityConfigurer extends WebSecurityConfigurerAdapter {



    /**
     * 认证管理器，处理authentication请求。
     *
     * @return
     * @throws Exception
     */
    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    @Bean
    PasswordEncoder passwordEncoder() {
        return PasswordEncoderFactories.createDelegatingPasswordEncoder();
    }

    /**
     * 允许匿名访问所有接口，主要是oauth接口
     *
     * @param http
     * @throws Exception
     */
    @Override
    protected void configure(HttpSecurity http) throws Exception {
//        http.csrf().disable()
//                // 排除oauth接口，允许匿名访问oauth接口，不需要Basic Auth认证
//                .authorizeRequests().antMatchers("/").permitAll()
////                .authorizeRequests().antMatchers("/oauth/**").permitAll()
//                .and()
//                // 认证其它所有接口(填写用户名和密码)
//                .authorizeRequests().anyRequest().authenticated()
//                .and()
//                .httpBasic();//authorization_code必须需要认证才能获取code
        http.requestMatchers().anyRequest()
                .and()
                .authorizeRequests()
                .antMatchers("/").authenticated()
        .and()
        .authorizeRequests().antMatchers("/**").fullyAuthenticated().and().httpBasic();



    }


}
