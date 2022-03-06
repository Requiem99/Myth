package com.dwg.controller;

import com.dwg.entity.User;
import com.dwg.service.WishListService;
import com.dwg.vo.ViewWishList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class WishListController {

    @Autowired
    private WishListService wishListServiceImpl;

    //展示愿望清单里的游戏
    @RequestMapping("/showWishList")
    String showWishList(HttpServletRequest request, Model model){
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        List<ViewWishList> wishGames = wishListServiceImpl.queryWishGames(user.getId());
        model.addAttribute("wishGames",wishGames);
        return "/wishlist";
    }

    //将游戏添加到愿望清单
    @RequestMapping( "/addWishList/{gId}" )
    @ResponseBody
    boolean addWishList(HttpServletRequest request,@PathVariable("gId") Integer gId){
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        boolean dana;
        Integer falg = wishListServiceImpl.checkGameOnWishList(gId,user.getId());//查看游戏是否已经在愿望清单中
        if(falg!=null){
            return false;
        }else{
            dana = wishListServiceImpl.collectGame(gId,user.getId());//如果不在愿望清单就添加改游戏
        }
        System.out.println("++++"+falg);
        return dana;
    }

    //删除愿望清单的游戏
    @RequestMapping("/removeWishList")
    String removeWishList(HttpServletRequest request,Integer gId){
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        wishListServiceImpl.removeWishGames(gId,user.getId());
        return "redirect:/showWishList";
    }
}
