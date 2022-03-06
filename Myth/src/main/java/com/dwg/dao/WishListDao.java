package com.dwg.dao;

import com.dwg.vo.ViewWishList;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface WishListDao {

    //给新用户添加一个愿望清单
    @Insert("insert into wishlist value(null,#{uid},#{uid})")
    boolean addWishList(@Param("uid") Integer uId);

    //展示用户愿望清单中的游戏
    @Select("select * from wishlist w, wishlistdetail wd, games g where w.wd_id = wd.wd_id and wd.g_id = g.g_id and w.u_id= #{uid}")
    List<ViewWishList> queryWishGames(@Param("uid") Integer uId);

    //游戏添加到用户的愿望清单
    @Insert("insert into wishlistdetail(wd_id,g_id) " +
            "value((select wd_id from wishlist where u_id = #{uid}),#{gid}) ")
    boolean collectGame(@Param("gid") Integer gId, @Param("uid") Integer uId);

    //删除用户愿望清单中的游戏
    @Delete("delete from wishlistdetail " +
            "where g_id = #{gid} and wd_id = (select wd_id from wishlist where u_id = #{uid})")
    void removeWishGames(@Param("gid") Integer gId, @Param("uid") Integer uId);

    //查看愿望清单中是否有该游戏
    @Select("select * from wishlistdetail where g_id = #{gid} " +
            "and wd_id=(select wd_id from wishlist where u_id = #{uid})")
    Integer checkGameOnWishList(@Param("gid") Integer gId, @Param("uid") Integer uId);
}
