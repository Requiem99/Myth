package com.dwg.dao;

import com.dwg.entity.Orders;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface OrdersDao {

    @Select("select * from orders where o_u_id = #{id}")
    @ResultType(com.dwg.entity.Orders.class)
    List<com.dwg.entity.Orders> getOrder(Integer id);

    @Insert("insert into orders(o_u_id, o_g_id, o_g_name, o_g_picture, o_g_money)" +
            "values(#{o_u_id},#{o_g_id},#{o_g_name},#{o_g_picture},#{o_g_money})")
    boolean addOrder(Orders order);

    @Delete("delete from orders where o_id =#{oid}")
    boolean delOrder(@Param("oid") Integer oId);


    @Select("select * from orders order by o_id DESC limit 1")
    Orders getRecentOrder();

    @Select("select * from orders where o_g_id= #{gid} and o_u_id = #{uid}")
    Integer checkGameOnCart(@Param("gid") Integer gId,@Param("uid") Integer uId);
}