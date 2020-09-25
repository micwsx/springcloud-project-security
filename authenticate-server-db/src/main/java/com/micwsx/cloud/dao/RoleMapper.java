package com.micwsx.cloud.dao;

import com.micwsx.cloud.model.Role;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author Michael
 * @create 9/1/2020 3:45 PM
 */
public interface RoleMapper {
    @Select("select * from role")
    @Results({
            @Result(property = "id", column = "id", javaType = Long.class),
            @Result(property = "name", column = "name", javaType = String.class)
    })
    List<Role> findAll();

    @Select("select * from role where id = #{id}")
    @Results({@Result(property = "id", column = "id", javaType = Long.class),
            @Result(property = "username", column = "username", javaType = String.class)})
    Role selectById(@Param("id") Integer id);

    @Insert("insert into role(id,name) values(#{id},#{name})")
    int insert(Role role);

    @Update("update role set name=#{name} where id =#{id}")
    void update(Role role);

    @Delete("delete from role where id =#{id}")
    void delete(Integer id);

    @Select("select r.id,r.name from `role` r inner join user_role ur on r.id=ur.role_id where ur.user_id= #{userId}")
    @Results({
            @Result(id = true, property = "id", column = "id", javaType = Long.class),
            @Result(property = "name", column = "name", javaType = String.class),
    })
    List<Role> selectByUserId(@Param("userId") Long userId);


}
