package com.dwg.dao;

import com.dwg.entity.Comment;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;


public interface CommentDao {
    @Insert("insert into comment" +
            "(c_g_id, c_author_id, c_author_username, c_author_header_icon, c_content, c_datetime,thumbs_up,thumbs_down) " +
            "values(#{c_g_id}, #{c_author_id}, #{c_author_username}, #{c_author_header_icon}, #{c_content}, #{c_datetime},0,0)")
    Integer saveGameComment(Comment comment);

    //根据点赞数多到少评论，加上and ISNULL(c_u_id) 是因为要搜索出第一层的评论，而不是回复测评的评论
    @Select("select * from comment where c_g_id = #{gid} and ISNULL(c_u_id) order by thumbs_up DESC limit 5")
    @ResultType(Comment.class)
    List<Comment> listGameCommentForUpThumbsNum(@Param("gid") Integer gId);

    //根据最近日期的评论
    @Select("select * from comment where c_g_id = #{gid} and ISNULL(c_u_id) order by c_datetime DESC limit 4")
    @ResultType(Comment.class)
    List<Comment> listGameCommentForRecent(@Param("gid") Integer gId);


    //更新点赞数 加上and ISNULL(c_u_id) 是因为要搜索出第一层的评论，而不是回复测评的评论
    @Update("update comment set thumbs_up = thumbs_up + 1 where c_id = #{cId} and c_g_id = #{gId} and ISNULL(c_u_id)")
    void updateThumbsUpCount(@Param("cId") Integer cId, @Param("gId") Integer gId);

    //反回点赞数 加上and ISNULL(c_u_id) 是因为要搜索出第一层的评论，而不是回复测评的评论
    @Select("select thumbs_up from comment where c_id = #{cId} and c_g_id = #{gId} and ISNULL(c_u_id)")
    Integer getThumbsUpCount(@Param("cId") Integer cId, @Param("gId") Integer gId);

    //返会用户刚刚发表的评论
    @Select("select * from comment where c_author_id = #{authorId} and c_g_id = #{gId} and ISNULL(c_h_id) order by c_id DESC limit 1")
    Comment getRecentComment(@Param("authorId") Integer authorId, @Param("gId") Integer gId);

    @Select("<script>" +
                "select * from comment" +
                "<where>" +
                    "<if test = 'author_username != null'>" +
                    "or c_author_username = #{author_username}" +
                    "</if>" +
                    "<if test = 'g_name != null'>" +
                    "or c_g_name = #{g_name}" +
                    "</if>" +
                    "<if test = 'u_username'>" +
                    "or c_u_username = #{u_username}"+
                    "</if>" +
                "</where>" +
            "</script>")
    /*查询三个或以上用 or 不要用 and */
    @ResultType(Comment.class)
    List<Comment> getCommentLsit(@Param("author_username") String c_author_username, @Param("g_name") String c_g_name, @Param("u_username") String c_u_username);

    @Delete("delete from comment where c_id = #{cId}")
    boolean deleteGameds(@Param("cId") Integer cId);
}
