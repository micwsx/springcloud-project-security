package com.micwsx.cloud.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.config.annotation.configurers.ClientDetailsServiceConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configuration.AuthorizationServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerEndpointsConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.ClientDetailsService;
import org.springframework.security.oauth2.provider.code.AuthorizationCodeServices;
import org.springframework.security.oauth2.provider.code.JdbcAuthorizationCodeServices;
import org.springframework.security.oauth2.provider.token.DefaultTokenServices;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.oauth2.provider.token.store.JdbcTokenStore;
import org.springframework.security.oauth2.provider.token.store.JwtAccessTokenConverter;
import org.springframework.security.oauth2.provider.token.store.KeyStoreKeyFactory;
import org.springframework.util.Assert;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;
import java.util.concurrent.TimeUnit;

/**
 * @author Michael
 * @create 8/28/2020 3:48 PM
 * 认证服务器配置
 * 配置能访问资源的测试application.
 */
@Configuration
// 开启认证服务器，token颁发
@EnableAuthorizationServer
// 开户资源服务器，验证token有效性。
@EnableResourceServer
public class OAuth2ServerStoreInDbConfig extends AuthorizationServerConfigurerAdapter {

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private PasswordEncoder passwordEncoder;

    // 用户数据库访问对象act as a DAO
    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    public DataSource dataSource;

    // 存储到oauth_access_token表中
    @Bean
    public TokenStore tokenStore() {
        Assert.state(dataSource != null, "JdbcTokenStore - DataSource must be provided");
        return new JdbcTokenStore(dataSource);
    }

    //存储oauth_code表中
    @Bean
    public AuthorizationCodeServices authorizationCodeServices() {
        Assert.state(dataSource != null, "JdbcAuthorizationCodeServices - DataSource must be provided");
        return new JdbcAuthorizationCodeServices(dataSource);
    }

    // 存储oauth_client_details表中
//    @Autowired
//    public ClientDetailsService clientDetailsService;

    @Override
    public void configure(AuthorizationServerSecurityConfigurer security) throws Exception {
        /**
         * 配置oauth2服务跨域
         */
        CorsConfigurationSource source = new CorsConfigurationSource() {
            @Override
            public CorsConfiguration getCorsConfiguration(HttpServletRequest request) {
                CorsConfiguration corsConfiguration = new CorsConfiguration();
                corsConfiguration.addAllowedHeader("*");
                corsConfiguration.addAllowedOrigin(request.getHeader(HttpHeaders.ORIGIN));
                corsConfiguration.addAllowedMethod("*");
                corsConfiguration.setAllowCredentials(true);
                corsConfiguration.setMaxAge(3600L);
                return corsConfiguration;
            }
        };

        security.allowFormAuthenticationForClients() //允许表单认证，申请令牌
                .tokenKeyAccess("permitAll()") //允许所有人请求令牌
                .checkTokenAccess("isAuthenticated()")//已验证的客户端才能请求check_token端点
                .addTokenEndpointAuthenticationFilter(new CorsFilter(source));
    }

    /***
     * define which clients are going to registered your service.
     * AuthorizationServerSecurityConfiguration 启动后执行
     * @param clients
     * @throws Exception
     */
    @Override
    public void configure(ClientDetailsServiceConfigurer clients) throws Exception {
        clients.jdbc(dataSource).passwordEncoder(passwordEncoder);
    }

    /***
     * AuthorizationServerEndpointsConfiguration 这个类启动时遍历所有AuthorizationServerConfigurer接口实现类
     * @param endpoints
     * @throws Exception
     */
    @Override
    public void configure(AuthorizationServerEndpointsConfigurer endpoints) throws Exception {
        endpoints
                .userDetailsService(userDetailsService) // 若无，refresh_token会有UserDetailsService is required错误
                .authenticationManager(authenticationManager)//The AuthenticationManager for the password grant.
                .authorizationCodeServices(authorizationCodeServices())// authorization_code储存
                .tokenStore(tokenStore())  // token存储
               // .accessTokenConverter(jwtAccessTokenConverter())// 自定义accessToken
                .allowedTokenEndpointRequestMethods(HttpMethod.GET, HttpMethod.POST)// 允许token请求方法
                .reuseRefreshTokens(true);//刷新token

        // 配置TokenService参数
//        DefaultTokenServices tokenServices = new DefaultTokenServices();
//        tokenServices.setAuthenticationManager(authenticationManager);
//        tokenServices.setTokenStore(tokenStore());
//
//        tokenServices.setSupportRefreshToken(false);
//        tokenServices.setClientDetailsService(endpoints.getClientDetailsService());
////        tokenServices.setTokenEnhancer(jwtAccessTokenConverter());
//        tokenServices.setAccessTokenValiditySeconds((int) TimeUnit.DAYS.toSeconds(30));//30 days
//        endpoints.tokenServices(tokenServices);
    }

    private JwtAccessTokenConverter jwtAccessTokenConverter() {
        // 加载jks证书
        KeyStoreKeyFactory keyStoreKeyFactory = new KeyStoreKeyFactory(new ClassPathResource("authenticate-server-jwt.jks"), "123456".toCharArray());
        JwtAccessTokenConverter jwtAccessTokenConverter = new JwtAccessTokenConverter();
        jwtAccessTokenConverter.setKeyPair(keyStoreKeyFactory.getKeyPair("server-jwt", "p@ssword".toCharArray()));
        return jwtAccessTokenConverter;
    }

    public static void main(String[] args) {
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        String value = bCryptPasswordEncoder.encode("123456");
        String thisisasecret = bCryptPasswordEncoder.encode("thisisasecret");
        System.out.println(value);
        System.out.println(thisisasecret);
    }


}
