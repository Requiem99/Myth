package com.dwg.service;

import com.dwg.entity.Comment;

import java.util.List;

public interface CommentService {
    Integer saveGameComment(Comment comment);

    List<Comment> listGameCommentForUpThumbsNum(Integer gId);

    Integer getThumbsUpCount(Integer cId, Integer gId);

    List<Comment> listGameCommentForRecent(Integer gId);

    Comment getUserRecentComment(Integer c_author_id, Integer c_g_id);

    List<Comment> getCommentLsit(String c_author_username, String c_g_name, String c_u_username);

    boolean deleteComments(Integer cId);
}
