package com.dwg.service.serviceImpl;

import com.dwg.dao.OrdersDao;
import com.dwg.dao.UserDao;
import com.dwg.dao.WareHouseDao;
import com.dwg.dao.WishListDao;
import com.dwg.entity.Admin;
import com.dwg.entity.Orders;
import com.dwg.entity.User;
import com.dwg.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private WishListDao wishListDao;

    @Autowired
    private WareHouseDao wareHouseDao;

    @Autowired
    private OrdersDao ordersDao;

    public List<User> allUser() {
        return userDao.allUser();
    }

    public User queryUser(String userName,String passWord) {
        return userDao.queryUser(userName,passWord);
    }

    @Override
    @Transactional
    public boolean registerUser(User user) {
        boolean c1 = userDao.addUser(user);//添加用户到user表
        Integer uId = userDao.getNewUserId();
        boolean c2 = wishListDao.addWishList(uId);//给新用户一个愿望清单
        boolean c3 = wareHouseDao.addWareHouse(uId);// 给用户添加一个仓库
        return c1&&c2&&c3;
    }

    @Override
    public Integer changeUserName(String userName, Integer id) {
        return userDao.changeUserName(userName,id);
    }

    @Override
    public Integer changePwd(String pwd, Integer id) {
        return userDao.changePwd(pwd,id);
    }

    @Override
    public Integer changeEmail(String email, Integer id) {
        return userDao.changeEmail(email,id);
    }

    @Override
    public Integer changeAddress(String address, Integer id) {
        return userDao.changeAddress(address,id);
    }

    @Override
    public Integer resetUserAllIntro(String userName, String email, String address, String pwd,Integer id) {
        return userDao.resetUserAllIntro(userName,email,address,pwd,id);
    }

    @Override
    public Integer uploadHeaderIcon(Integer uId,String dBfilePath) {
        return userDao.uploadHeaderIcon(uId,dBfilePath);
    }

    @Override
    public Admin queryAdmin(String name, String password) {
        return userDao.queryAdmin(name,password);
    }

    @Override
    public List<User> listUser() {
        return userDao.liserUser();
    }

    @Override
    public Integer userDel(Integer uId) {
        return userDao.userDel(uId);
    }

    @Override
    public User userSearch(String userName) {
        return userDao.userSearch(userName);
    }

    @Override
    public double getAccount(Integer id, String app) {
        return userDao.getAccount(id,app);
    }

    /*用户用微信购买游戏的事务*/
    @Override
    @Transactional
    public boolean userWxBuyGame(Integer id, double account, List<Orders> list) {
        //判断更新用户的余额是否成功，不成功则返回false;
        if (!userDao.updateWxAccount(id,account)){
            return false;
        };
        //删除用户购物车中的游戏，并添加到用户的仓库
        if (list.size()==1){
            boolean b2 = wareHouseDao.addGameOnWareHouse(id, list.get(0).getO_g_id());
        }else {
            for (Orders orders : list) {
                boolean b1 = ordersDao.delOrder(orders.getO_id());
                boolean b2 = wareHouseDao.addGameOnWareHouse(id, orders.getO_g_id());
                //判断删除和添加是否成功，如果有一个不成功则返回false
                if(!(b1&&b2)){
                    return false;
                }
            }
        }

        return true;
    }

    /*用户用微信购买游戏的事务*/
    @Override
    public boolean userZfbBuyGame(Integer id, double count, List<Orders> list) {
        return false;
    }

    @Override
    public User getUser(Integer uId) {
        return userDao.getUser(uId);
    }


}
