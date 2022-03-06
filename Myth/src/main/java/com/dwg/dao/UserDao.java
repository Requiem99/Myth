package com.dwg.dao;

import com.dwg.entity.Admin;
import com.dwg.entity.User;
import org.apache.ibatis.annotations.*;

import java.util.List;
/*@Repository*/
public interface UserDao {

    @Select("select * from User")
    @ResultType(User.class)
    List<User> allUser();

    @Select("select * from user where id = #{uid}")
    @ResultType(User.class)
    User getUser(@Param("uid") Integer uId);

    @Select("select * from user where username = #{userName} and password = #{passWord}")
    @ResultType(User.class)
    User queryUser(@Param("userName") String userName, @Param("passWord") String passWord);

    @Insert("insert into user(name,email,address,username,password,grade) values(#{name},#{email},#{address},#{username},#{password},1)")
    boolean addUser(User user);

    @Update("update user set username = #{username} where id=#{id}")
    Integer changeUserName(@Param("username") String userName,@Param("id") Integer id);

    @Update("update user set password = #{pwd} where id = #{id}")
    Integer changePwd(@Param("pwd") String pwd, @Param("id") Integer id);

    @Update("update user set email = #{email} where id = #{id}")
    Integer changeEmail(@Param("email") String email, @Param("id") Integer id);

    @Update("update user set address = #{address} where id = #{id}")
    Integer changeAddress(@Param("address") String address, @Param("id") Integer id);

    @Update("update user set username = #{username} ,email = #{email} , " +
            "address = #{address} , password = #{pwd} where id = #{id}")
    Integer resetUserAllIntro(String userName,String email,String address,String pwd,Integer id);

    //获取新注册用户的id
    @Select("select MAX(id) from user ")
    Integer getNewUserId();

    @Update("update user set header_icon  = #{dBfilePath} where id = #{uid}")
    Integer uploadHeaderIcon(@Param("uid") Integer uId,@Param("dBfilePath")String dBfilePath);

    //管理员登录
    @Select("select * from admin where name = #{name} and password = #{password}")
    @ResultType(Admin.class)
    Admin queryAdmin(@Param("name") String name, @Param("password") String password);

    @Select("select * from user ")
    List<User> liserUser();

    @Delete("delete from user where id = #{uid}")
    Integer userDel(@Param("uid") Integer uId);

    @Select("select * from user where username like concat(%,#{username},%)")
    @ResultType(User.class)
    User userSearch(@Param("username") String userName);

    //得到用户的账户余额
    @Select("select #{app} from user where id = #{id}")
    double getAccount(@Param("id") Integer id, @Param("app") String app);

    //更新用户的微信账户余额
    @Update("update user set wx= #{account} where id = #{uid}")
    boolean updateWxAccount(@Param("uid") Integer id, @Param("account") double account);


}
