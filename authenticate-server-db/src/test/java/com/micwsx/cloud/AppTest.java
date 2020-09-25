package com.micwsx.cloud;

import com.micwsx.cloud.dao.RoleMapper;
import com.micwsx.cloud.dao.UserMapper;
import com.micwsx.cloud.service.UserService;
import org.junit.jupiter.api.Test;
import org.mockito.internal.util.collections.Sets;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.support.SqlLobValue;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.common.util.SerializationUtils;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.OAuth2Request;

import javax.sql.DataSource;
import javax.xml.crypto.Data;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.*;

/**
 * Unit test for simple App.
 */
@SpringBootTest
public class AppTest {
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private DataSource dataSource;

    @Autowired
    private RoleMapper roleMapper;

    @Test
    public void userTest() {
        System.out.println("result:" + userMapper.selectByName("michael"));
        System.out.println(roleMapper.selectById(1));
    }



    @Test
    public void jjj() {

//        String url = "jdbc:mysql://127.0.0.1:3306/auth?useUnicode=true&characterEncoding=utf8";
//        String username = "root";
//        String password = "p@ssw0rd";
//        Connection conn = null;
//
//        try {
//            Connection connection = DriverManager.getConnection(url, username, password);
//            System.out.println(connection.getAutoCommit());
//
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//
        Map<String, String> map = new HashMap<>();
        map.put("response_type", "code");
        map.put("client_id", "clientDemoApp");
        map.put("redirect_uri", "https://www.baidu.com");
        map.put("scope", "all");
        map.put("state", "456");
        List<GrantedAuthority> list = new ArrayList<GrantedAuthority>() {{
            add(new SimpleGrantedAuthority("ADMIN"));
        }};
        Set<String> set = new HashSet<String>() {{
            add("all");
        }};
        OAuth2Request auth2Request = new OAuth2Request(map, "clientDemoApp", list, true, set, Sets.newSet("clientDemoApp"),
                "https://www.baidu.com", Sets.newSet("code"), null);
        OAuth2Authentication authentication = new OAuth2Authentication(auth2Request, null);
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcTemplate.execute("insert into auth.oauth_code (code, authentication) values ('wwww', 2323)");

//        int result=jdbcTemplate.update("insert into oauth_code (code, authentication) values (?, ?);",
//                new Object[] { "nTCrtQ", new SqlLobValue(SerializationUtils.serialize(authentication)) }, new int[] {
//                        Types.VARCHAR, Types.BLOB });
//
//
//
//        System.out.println(result);


//        try {
//
//            Connection connection = dataSource.getConnection();
//            System.out.println(connection.getAutoCommit());
//            connection.setAutoCommit(false);
//            Statement statement = connection.createStatement();
//            boolean execute = statement.execute("insert into auth.oauth_code (code, authentication) values ('333', 2323)");
////            boolean execute = statement.execute("update oauth_code set code='4444444'");
//            connection.commit();
//            System.out.println(execute);
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
    }
}
