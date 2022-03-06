package com.dwg.controller;

import com.dwg.entity.Comment;
import com.dwg.service.CommentService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class CommentController {
    @Autowired
    private CommentService commentServiceImpl;

    //提交评论
    @RequestMapping( "/submitComment")
    @ResponseBody
    Comment submitComment(Comment comment){
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateTime = format.format(date);
        comment.setC_datetime(dateTime);
        System.out.println(dateTime);
        Integer integer = commentServiceImpl.saveGameComment(comment);
        Integer c_author_id = comment.getC_author_id();
        Integer c_g_id = comment.getC_g_id();
        //获取用户据最新的评论
        Comment recentComment = commentServiceImpl.getUserRecentComment(c_author_id,c_g_id);
        return recentComment;
    }

    //更新点赞评论
    @RequestMapping("/commentThumbs/{commentId}/{gameId}")
    @ResponseBody
    Integer commentThumbs(@PathVariable("commentId")Integer cId,@PathVariable("gameId")Integer gId,String upOrDownThumbs){
        Integer thumbsUpCount = null;
        if ("是".equals(upOrDownThumbs)){
             thumbsUpCount = commentServiceImpl.getThumbsUpCount(cId, gId);
        }
        System.out.println(thumbsUpCount);
        return thumbsUpCount;/*返回点赞数*/
    }

    //获取每个下的次级评论数
    @RequestMapping("/getSecondaryNum/{c_id}")
    @ResponseBody
    Integer secondaryComment(){
        return 0;
    }

    /*===========管理员操作===========*/

    @RequestMapping("/getCommentLsit")
    String  getCommentLsit(String c_author_username, String c_g_name, String c_u_username, Model model){
        List<Comment> commentLsit = commentServiceImpl.getCommentLsit(c_author_username, c_g_name, c_u_username);
        for (Comment comment : commentLsit) {
            System.out.println(comment);
        }
        model.addAttribute("commentLsit",commentLsit);
        return "/admin/showcomment";
    }

    @RequestMapping("/deleteComments")
    String deleteComments(Integer cId){
        commentServiceImpl.deleteComments(cId);
        return "/admin/showcomment";
    }


}
