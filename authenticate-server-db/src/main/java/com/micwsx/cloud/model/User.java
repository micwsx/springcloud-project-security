package com.micwsx.cloud.model;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Michael
 * @create 9/1/2020 3:42 PM
 */
public class User{

    private Long id;
    private String username;
    private String password;
    private List<Role> roles=new ArrayList<>();

    public User(Long id, String username, String password) {
        this.id = id;
        this.username = username;
        this.password = password;
    }

    public Long getId() {
        return id;
    }

    public List<Role> getRoles() {
        return roles;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }


    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", roles=" + roles +
                '}';
    }
}
