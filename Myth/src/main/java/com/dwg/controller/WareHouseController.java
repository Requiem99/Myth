package com.dwg.controller;

import com.dwg.entity.GameDetail;
import com.dwg.entity.Games;
import com.dwg.entity.User;
import com.dwg.service.UserService;
import com.dwg.service.WareHouseService;
import com.dwg.vo.ViewWareHouse;
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
public class WareHouseController {
    @Autowired
    private WareHouseService wareHouseServiceImpl;

    @Autowired
    private UserService userServiceImpl;

    @RequestMapping("/showWareHouse")
    String showWareHouse(HttpServletRequest request, Model model){
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        Integer uId = user.getId();
        List<ViewWareHouse> wareHousesGames = wareHouseServiceImpl.getOwnGame(uId);
        model.addAttribute("OwnGame",wareHousesGames);
        return "/warehouse";
    }

    @RequestMapping("/revealGame/{gid}")
    @ResponseBody
    GameDetail showGameDetail(@PathVariable("gid") Integer gid){
        GameDetail gameDetail = wareHouseServiceImpl.getOwnGameDetail(gid);
        System.out.println(gameDetail);
        return gameDetail;
    }

    @RequestMapping("/checkGameOnWareHouse")
    @ResponseBody
    boolean checkGameOnWareHouse(Integer gId,Integer uId){
        boolean data = false;
        if (wareHouseServiceImpl.checkGameOnWareHouse(gId,uId)!=null){
            data = true;
        }
        /*System.out.println("gId = "+gId+";"+"uid = "+uId+";"+
                wareHouseServiceImpl.checkGameOnWareHouse(gId,uId)+"===========");*/
        return data;
    }

    /*=============管理员================*/
    @RequestMapping("lookWareHouse")
    String lookWareHouse(String uId,Model model){
        Integer uId1 = null;
        if (!uId.equals("")) {
            uId1 = new Integer(uId);
        }
        User user = userServiceImpl.getUser(uId1);
        List<Games> gamesList = wareHouseServiceImpl.lookWareHouse(uId1);
        model.addAttribute("username",user.getName());
        model.addAttribute("gamesList",gamesList);
        return "/admin/showwarehouse";
    }
}
