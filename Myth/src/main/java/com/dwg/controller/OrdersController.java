package com.dwg.controller;

import com.dwg.entity.Orders;
import com.dwg.entity.User;
import com.dwg.service.OrdersService;
import com.dwg.service.UserService;
import com.dwg.service.WishListService;
import com.dwg.service.serviceImpl.OrdersServiceImpl;
import com.dwg.vo.ViewWishList;
import org.apache.ibatis.annotations.Param;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.persistence.criteria.Order;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class OrdersController {

    @Autowired
    private OrdersService orderServiceImpl;

    @Autowired
    private WishListService wishListServiceImpl;

    @Autowired
    private UserService userServiceImpl;

    @RequestMapping("/showOrder")
    String showOrder(HttpServletRequest request, Model model) {
        double count = 0;
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        List<Orders> ordersList = orderServiceImpl.getOrder(user.getId());
        //计算订单总价格
        for (Orders orders : ordersList) {
            count += orders.getO_g_money();
        }
        model.addAttribute("ordersList", ordersList);
        model.addAttribute("count", count);
        return "/order";
    }

    //添加到购物车
    @RequestMapping("/addCart")
    @ResponseBody
    boolean addOrder(Orders cart) {
        System.out.println(cart);
        boolean flag = orderServiceImpl.addOrder(cart);
        return flag;
    }

    //从愿望清单到购物车
    @RequestMapping("addGamewishListToCart")
    String addGamewishListToCart(Orders cart,HttpSession session,Model model){
        User user =(User) session.getAttribute("user");
        boolean flag = orderServiceImpl.addOrder(cart);
        List<ViewWishList> wishGames = wishListServiceImpl.queryWishGames(user.getId());
        model.addAttribute("wishGames",wishGames);
        return "/wishlist";
    }

    //查看游戏是否在购物车中
    @RequestMapping("/checkGameOnCart")
    @ResponseBody
    boolean checkGameOnCart(Integer gId,Integer uId){
        boolean data = false;
        Integer i = orderServiceImpl.checkGameOnCart(gId, uId);
        if (i!=null){//如果购物车中有
            data = !data;
        }
        return data;
    }

    @RequestMapping("/delOrderForCart")
    String delGameForCart(Integer oId) {
        orderServiceImpl.delOrder(oId);
        return "redirect:/showOrder";
    }

    @RequestMapping("/transferOrder")
    String transferOrder(Integer oId, Integer gId, HttpSession session) {
        User user = (User) session.getAttribute("user");
        Integer falg = wishListServiceImpl.checkGameOnWishList(gId, user.getId());//查看游戏是否已经在愿望清单中
        if (falg == null) {
            wishListServiceImpl.collectGame(gId, user.getId());//如果不在愿望清单就添加改游戏
        }
        orderServiceImpl.delOrder(oId);
        return "redirect:/showOrder";
    }


    @RequestMapping("/buyGameOrder")
    String buyGameOrder(Orders order, Model model, HttpSession session) {
        double count = 0;
        List<Orders> ordersList = new ArrayList<>();
        ordersList.add(order);
        for (Orders orders : ordersList) {
            count += orders.getO_g_money();
        }
        //把订单放入session中
        session.setAttribute("orderList", ordersList);
        model.addAttribute("count", count);

        return "/pay";
    }

    @RequestMapping("/buyGameOrders")
    String buyGameOrders(Integer uId, Model model, HttpSession session) {
        double count = 0;
        List<Orders> ordersList = orderServiceImpl.getOrder(uId);
        //计算订单总金额
        for (Orders orders : ordersList) {
            count += orders.getO_g_money();
        }
        //把订单放入session中
        session.setAttribute("orderList", ordersList);
        model.addAttribute("count", count);
        //System.out.println(count);
        return "/pay";
    }

    @RequestMapping("/paymentResult/{count}/{app}")
    @ResponseBody
    boolean paymentResult(@PathVariable("count") double count, @PathVariable("app") String app, HttpSession session) {
        boolean flag = false;
        double account = 0;
        User user = (User) session.getAttribute("user");
        List<Orders> list = (List<Orders>) session.getAttribute("orderList");
        if (app.equals("wx")) {
            account = user.getWx();
            if (account > count) {//如果余额足够
                account = account - count;
                //购买游戏
                flag = userServiceImpl.userWxBuyGame(user.getId(), account, list);
            }
            return flag;

        } else {
            account = user.getZfb();
            if (account > count) {//如果余额足够
                account = account - count;
                //购买游戏
                flag = userServiceImpl.userZfbBuyGame(user.getId(), account, list);
            }
            return flag;
        }

    }

    /*退出支付*/
    @RequestMapping("exitPay/{oId}")
    @ResponseBody
    boolean exitPay(@PathVariable("oId") Integer oId){
        return orderServiceImpl.delOrder(oId);
    }


    /*=========管理员操作========*/
    @RequestMapping("/getUserCart")
    String getUserCart(String o_u_id,Model model){
        double count = 0;
        Integer uId = null;
        if (!o_u_id.equals("")) {
            uId = new Integer(o_u_id);
        }
        List<Orders> ordersList = orderServiceImpl.getOrder(uId);
        for (Orders orders : ordersList) {
            count += orders.getO_g_money();
        }
        model.addAttribute("carts",ordersList);
        model.addAttribute("count",count);
        return "/admin/showcart";
    }
}
