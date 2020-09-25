package com.micwsx.cloud.service;

import com.micwsx.cloud.model.User;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

/**
 * @author Michael
 * @create 9/1/2020 3:43 PM
 */
public interface UserService extends UserDetailsService {
    List<User> findAll();
}
