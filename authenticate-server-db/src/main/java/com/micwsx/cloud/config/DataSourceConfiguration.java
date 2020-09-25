package com.micwsx.cloud.config;

import com.alibaba.druid.pool.DruidDataSource;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.sql.SQLException;

/**
 * @author Michael
 * @create 9/1/2020 2:43 PM
 */
@Configuration
@MapperScan("com.micwsx.cloud.dao")
public class DataSourceConfiguration {

    @Value("${spring.datasource.driver-class-name}")
    private String driverClassName;
    @Value("${spring.datasource.url}")
    private String url;
    @Value("${spring.datasource.username}")
    private String username;
    @Value("${spring.datasource.password}")
    private String password;

    @Bean(initMethod = "init", destroyMethod = "close")
    public DruidDataSource dataSource() throws SQLException {
        DruidDataSource dataSource = new DruidDataSource();
        dataSource.setDriverClassName(driverClassName);
        dataSource.setUrl(url);
        dataSource.setUsername(username);
        dataSource.setPassword(password);
        // 配置初始化大小、最小、最大
//        dataSource.setInitialSize(10);
//        dataSource.setMinIdle(1);
//        dataSource.setMaxActive(20);
//        dataSource.setMaxWait(60000);// 配置获取连接等待超时的时间
//        dataSource.setTimeBetweenEvictionRunsMillis(60000);// 配置间隔多久才进行一次检测，检测需要关闭的空闲连接，单位是毫秒
//        dataSource.setMinEvictableIdleTimeMillis(300000);// 配置一个连接在池中最小生存的时间，单位是毫秒
//        dataSource.setDefaultAutoCommit(true);// 禁止自动提交，实现事务管理
//        dataSource.setValidationQuery("SELECT 1;");
//        dataSource.setValidationQueryTimeout(30000);
//        dataSource.setTestWhileIdle(true);
//        dataSource.setTestOnBorrow(false);
//        dataSource.setTestOnReturn(false);
//        dataSource.setPoolPreparedStatements(true);
//        dataSource.setMaxPoolPreparedStatementPerConnectionSize(50);
        // 拦截配置
        dataSource.setFilters("stat,wall");
        return dataSource;
    }

}
