package com.dwg.service.serviceImpl;

import com.dwg.dao.CommentDao;
import com.dwg.entity.Comment;
import com.dwg.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentDao commentDao;

    @Override
    public Integer saveGameComment(Comment comment) {
        return commentDao.saveGameComment(comment);
    }

    @Override
    public List<Comment> listGameCommentForUpThumbsNum(Integer gId) {
        return commentDao.listGameCommentForUpThumbsNum(gId);
    }

    @Override
    public List<Comment> listGameCommentForRecent(Integer gId) {
        return commentDao.listGameCommentForRecent(gId);
    }

    @Override
    public Comment getUserRecentComment(Integer c_author_id, Integer c_g_id) {
        return commentDao.getRecentComment(c_author_id,c_g_id);
    }

    @Override
    public List<Comment> getCommentLsit(String c_author_username, String c_g_name, String c_u_username) {
        return commentDao.getCommentLsit(c_author_username,c_g_name,c_u_username);
    }

    @Override
    public boolean deleteComments(Integer cId) {
        return commentDao.deleteGameds(cId);
    }

    @Override
    public Integer getThumbsUpCount(Integer cId, Integer gId) {
        commentDao.updateThumbsUpCount(cId,gId);
        return commentDao.getThumbsUpCount(cId,gId);
    }
}
