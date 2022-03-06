package com.dwg.service.serviceImpl;

import com.dwg.dao.OrdersDao;
import com.dwg.entity.Orders;
import com.dwg.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrdersServiceImpl implements OrdersService {

    @Autowired
    private OrdersDao ordersDao;



    @Override
    public Orders getRecentOrder() {
        return ordersDao.getRecentOrder();
    }

    @Override
    public Integer checkGameOnCart(Integer gId,Integer uId) {
        return ordersDao.checkGameOnCart(gId,uId);
    }

    @Override
    public List<com.dwg.entity.Orders> getOrder(Integer id) {
        return ordersDao.getOrder(id);
    }

    @Override
    public boolean addOrder(com.dwg.entity.Orders cart) {
        return ordersDao.addOrder(cart);
    }

    @Override
    public boolean delOrder(Integer oId) {
        return ordersDao.delOrder(oId);
    }
}
