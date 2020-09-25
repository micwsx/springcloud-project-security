package com.micwsx.cloud.service.impl;

import com.micwsx.cloud.dao.UserMapper;
import com.micwsx.cloud.model.Role;
import com.micwsx.cloud.model.User;
import com.micwsx.cloud.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Michael
 * @create 9/1/2020 3:44 PM
 */
@Service("userDetailService")
public class UserServiceImp implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public List<User> findAll() {
        return userMapper.findAll();
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userMapper.selectByName(username);
        if (user==null ){
            throw new UsernameNotFoundException("登录用户["+username+"]没有注册");
        }

        List<GrantedAuthority> grantedAuthorities=new ArrayList<>();
        for (Role role : user.getRoles()) {
            String roleName = role.getName();
            grantedAuthorities.add(new SimpleGrantedAuthority(roleName));
        }

        UserDetails userDetails = org.springframework.security.core.userdetails.User.builder()
                .username(user.getUsername())
                .password(user.getPassword())
                .authorities(grantedAuthorities)
                .roles("ADMIN")
                .build();
        return userDetails;
    }
}
