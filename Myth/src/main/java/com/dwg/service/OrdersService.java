package com.dwg.service;

import com.dwg.entity.Orders;


import java.util.List;

public interface OrdersService {
    List<Orders> getOrder(Integer id);

    boolean addOrder(Orders order);

    boolean delOrder(Integer oId);

    Orders getRecentOrder();

    Integer checkGameOnCart(Integer gId,Integer uId);
}
