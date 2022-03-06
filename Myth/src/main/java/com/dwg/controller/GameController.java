package com.dwg.controller;

import com.dwg.entity.Comment;
import com.dwg.entity.Games;
import com.dwg.entity.User;
import com.dwg.service.CommentService;
import com.dwg.service.GameService;
import com.dwg.service.WareHouseService;
import com.dwg.service.WishListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class GameController {

    @Autowired
    private GameService gameServiceImpl;
    @Autowired
    private WareHouseService wareHouseServiceImpl;
    @Autowired
    private WishListService wishListServiceImpl;
    @Autowired
    private CommentService commentServiceImpl;

    @RequestMapping("/homePage")
    public String gameList(Model model) {
        List<Games> games = gameServiceImpl.allGame();
        model.addAttribute("List", games);
        return "/homepage";
    }

    @RequestMapping("/communication")
    String communication(){ return "/communication";}

    @RequestMapping("/about")
    String about(){ return "/about";}

    @RequestMapping("/seekGames")
    String seekGames01(String Gname, Model model) {
        List<Games> games = gameServiceImpl.selectGameByName(Gname);
       /* for (Games game : games) {
            System.out.println(game);
        }*/
        model.addAttribute("result", games);
        return "/seekresult";
    }

    @RequestMapping("/showGames")
    @ResponseBody
    List<Games> showGames(String text) {
        List<Games> gamesForShow = null;
        if (text.equals("热销")) {
            gamesForShow = gameServiceImpl.selectGameByStar();
            //System.out.println(gamesForShow);
        }
        if (text.equals("推荐")) {
            gamesForShow = gameServiceImpl.listGamesOrder();
        }
        if (text.equals("最新推出")) {
            gamesForShow = gameServiceImpl.listGamesAnti();
        }
        return gamesForShow;
    }

    @RequestMapping("/gIntroduction")
    String gIntroduction(Integer gId, Model model) {
        Games game = gameServiceImpl.getGameById(gId);
        model.addAttribute("game", game);
        //根据点赞数的评论
        List<Comment> commentForUpThumbsNumList = commentServiceImpl.listGameCommentForUpThumbsNum(gId);
        int size = commentForUpThumbsNumList.size();
        model.addAttribute("commentForUpThumbsNumList", commentForUpThumbsNumList);
        //根据发布日期的评论
        List<Comment> commentForRecentList = commentServiceImpl.listGameCommentForRecent(gId);
        model.addAttribute("commentForRecentList", commentForRecentList);
        return "/introduction";
    }

    @RequestMapping("checkHaveGame/{gId}")
    @ResponseBody
    List<Boolean> checkHaveGame(HttpServletRequest request, @PathVariable("gId") Integer gId) {
        Integer uId;
        List<Boolean> verify = new ArrayList<>();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        boolean checkWishlist = false;
        boolean checkWareHouse = false;
        uId = user.getId();

        //验证用户愿望清单中是否有该游戏
        Integer i01 = wishListServiceImpl.checkGameOnWishList(gId, uId);
        System.out.println();
        if (i01 == null) {//
            checkWishlist = true;
        }

        //验证用户仓库中是否有该游戏
        Integer i02 = wareHouseServiceImpl.checkGameOnWareHouse(gId, uId);

        if (i02 == null) {
            checkWareHouse = true;
        }
        verify.add(checkWishlist);
        verify.add(checkWareHouse);
       /* System.out.println("uId=" + uId + "; " + "gId=" + gId + "; " + "i01=" + i01 + "; " + "i02=" + i02);
        System.out.println(verify);*/
        return verify;
    }

    /*================管理员功能=============*/
    @RequestMapping("/getGamesList")
    String getGamesList(Model model) {
        List<Games> gamesList = gameServiceImpl.listGames();
        model.addAttribute("gamesList", gamesList);
        return "/admin/showgames";
    }

    @RequestMapping("/gamesDeleteById")
    String gamesDeleteById(Integer gId) {
        gameServiceImpl.gamesDeleteById(gId);
        return "redirect:getGamesList";
    }

    @RequestMapping("/selectByNameAndId")
    String selectByNameAndId(String gName, String gId, Model model) {
        Integer gId1 = null;
        if (!gId.equals("")) {
            gId1 = new Integer(gId);
        }
        List<Games> gamesList = gameServiceImpl.selectByNameAndId(gName, gId1);
        model.addAttribute("gamesList", gamesList);
        return "/admin/showgames";
    }

    @RequestMapping("/toAddGames")
    String toAddGames(){
        return "/admin/addgames";
    }


    @RequestMapping("/AddGames")
    String AddGames(MultipartFile file, Games games, Model model) {

        /*======上传游戏图片==========*/
        String prePath = "E:\\WebProject\\Myth\\web\\static\\image";
        Integer i = gameServiceImpl.getGameMaxId() + 1;
        String imageName = "header";
        //获取文件后缀名
        String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
        //设置上传文件的规定文件名
        String finalUrl = prePath + imageName + suffix;
        File file1 = new File(finalUrl);
        games.setG_picture("static/image/" + i + "/header.jpg");
        Boolean aBoolean = gameServiceImpl.saveGame(games);
        if (aBoolean) {
            try {
                if (!file1.exists()) {
                    file1.createNewFile();
                }
                file.transferTo(file1);
            } catch (IOException e) {
                e.printStackTrace();
            }
            return "redirect:toAddGames";
        } else {
            model.addAttribute("upLoadMsg", "上传失败!");
            return "redirect:toAddGames";
        }

    }










}
