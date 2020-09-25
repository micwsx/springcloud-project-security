package com.micwsx.cloud.dao;

import com.micwsx.cloud.model.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author Michael
 * @create 9/1/2020 3:45 PM
 */
public interface UserMapper {
    @Select("select * from user")
    @Results({@Result(id = true, property = "id", column = "id", javaType = Long.class),
            @Result(property = "username", column = "username", javaType = String.class),
            @Result(property = "password", column = "password", javaType = String.class),
            @Result(property = "roles", column = "id", javaType = List.class,
                    many = @Many(select = "com.micwsx.cloud.dao.RoleMapper.selectByUserId"))
    })
    List<User> findAll();

    @Select("select * from `user` where id=#{id}")
    @Results({@Result(id = true, property = "id", column = "id", javaType = Long.class),
            @Result(property = "username", column = "username", javaType = String.class),
            @Result(property = "password", column = "password", javaType = String.class),
            @Result(property = "roles", column = "id", javaType = List.class,
                    many = @Many(select = "com.micwsx.cloud.dao.RoleMapper.selectByUserId"))
    })
    User selectById(@Param("id") Integer id);

    @Insert("insert into user(id,username,password) values(#{id},#{username},#{password})")
    int insert(User user);

    @Update("update user set username=#{username},password=#{password} where id =#{id}")
    void update(User user);

    @Delete("delete from user where id =#{id}")
    void delete(Integer id);


    @Select("select * from `user` where username = '${username}'")
    @Results({
            @Result(id = true, property = "id", column = "id", javaType = Long.class),
            @Result(property = "password", column = "password", javaType = String.class),
            @Result(property = "username", column = "username", javaType = String.class),
            @Result(property = "roles", column = "id", javaType = List.class,
                    many = @Many(select = "com.micwsx.cloud.dao.RoleMapper.selectByUserId"))
    })
    @ConstructorArgs({
            @Arg(column = "id", javaType = Long.class, id = true),
            @Arg(column = "password", javaType = String.class),
            @Arg(column = "username", javaType = String.class)
    })
    User selectByName(@Param("username") String username);


}
