package com.micwsx.cloud.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.config.annotation.configurers.ClientDetailsServiceConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configuration.AuthorizationServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerEndpointsConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.token.store.InMemoryTokenStore;
import org.springframework.security.oauth2.provider.token.store.JwtAccessTokenConverter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

import javax.servlet.http.HttpServletRequest;

/**
 * @author Michael
 * @create 8/28/2020 3:48 PM
 * 认证服务器配置-jwt token内存存储
 * 配置能访问资源的测试application.
 */
@Configuration
@EnableAuthorizationServer
public class OAuth2ServerConfig extends AuthorizationServerConfigurerAdapter {

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private UserDetailsService userDetailsService;

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
        String finalSecret = "{bcrypt}" + new BCryptPasswordEncoder().encode("thisisasecret");
        clients.inMemory()
                .withClient("demoApp")// client_id
                .resourceIds("demoApp")
                .secret(finalSecret)// client_secret
                .authorizedGrantTypes("authorization_code", "refresh_token", "implicit", "client_credentials", "password")// 该client允许授权类型
                .scopes("all", "read", "write", "get_user_info")//授权范围
                .authorities("ROLE_USER,ROLE_ADMIN")
                .autoApprove(false)
                .autoApprove("get_user_info")
                .accessTokenValiditySeconds(1200)
                .refreshTokenValiditySeconds(50000)
                .redirectUris("http://www.baidu.com");
    }

    /***
     * AuthorizationServerEndpointsConfiguration 这个类启动时遍历所有AuthorizationServerConfigurer接口实现类
     * @param endpoints
     * @throws Exception
     */
    @Override
    public void configure(AuthorizationServerEndpointsConfigurer endpoints) throws Exception {
        endpoints.authenticationManager(authenticationManager)//The AuthenticationManager for the password grant.
                .userDetailsService(userDetailsService) // 若无，refresh_token会有UserDetailsService is required错误
                .tokenStore(new InMemoryTokenStore())  // token存储对象
                .accessTokenConverter(jwtAccessTokenConverter()) // accessToken转换对象
                .allowedTokenEndpointRequestMethods(HttpMethod.GET, HttpMethod.POST)// 允许token请求方法
                .reuseRefreshTokens(true);
    }

    @Bean
    public JwtAccessTokenConverter jwtAccessTokenConverter() {
        JwtAccessTokenConverter jwtAccessTokenConverter = new JwtAccessTokenConverter();
        jwtAccessTokenConverter.setSigningKey("secret");
        return jwtAccessTokenConverter;
    }


}
