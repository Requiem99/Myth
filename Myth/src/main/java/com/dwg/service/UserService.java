package com.dwg.service;

import com.dwg.entity.Admin;
import com.dwg.entity.Orders;
import com.dwg.entity.User;

import java.util.List;

public interface UserService {

    //查询所有用户
    List<User> allUser();

    //根据用户名（userName）和密码(passWord)查询用户
    User queryUser(String userName,String passWord);

    //添加用户
    boolean registerUser(User user);

    //改用户改变用户名
    Integer  changeUserName(String userName, Integer id);

    //给用户更改密码
    Integer changePwd(String pwd, Integer id);

    //给用户更改邮箱
    Integer changeEmail(String email, Integer id);

    //给用户更改地址
    Integer changeAddress(String address, Integer id);

    //重置用户所有信息
    Integer resetUserAllIntro(String userName, String email, String address, String pwd,Integer id);

    Integer uploadHeaderIcon(Integer uId,String dBfilePath);

    Admin queryAdmin(String name, String password);

    List<User> listUser();

    Integer userDel(Integer uId);

    User userSearch(String userName);

    double getAccount(Integer id, String app);

    boolean userWxBuyGame(Integer id, double count, List<Orders> list);

    boolean userZfbBuyGame(Integer id, double count, List<Orders> list);

    User getUser(Integer uId1);
}
