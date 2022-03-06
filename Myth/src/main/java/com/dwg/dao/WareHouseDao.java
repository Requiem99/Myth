package com.dwg.dao;

import com.dwg.entity.GameDetail;
import com.dwg.entity.Games;
import com.dwg.vo.ViewWareHouse;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

public interface WareHouseDao {
    //给用户添加一个仓库
    @Insert("insert into warehouse value(null,#{uid},#{uid})")
    boolean addWareHouse(@Param("uid") Integer uId);


    @Select("select wh.u_id,g.g_id,g.g_name,gd.gd_image from warehouse wh,warehousedetail whd,games g,gamedetail gd " +
            "where wh.whd_id = whd.whd_id and whd.gd_id = gd.gd_id and gd.g_id=g.g_id and wh.u_id = #{uid}")
    List<ViewWareHouse> getOwnGame(@Param("uid") Integer uId);

    @Select("select * from gamedetail where g_id=#{gid}")
    GameDetail getOwnGameDetail(@Param("gid") Integer gid);

    //查看仓库中是否有该游戏
    @Select("select * from warehousedetail where gd_id = (select gd_id from gamedetail where g_id = #{gid} ) " +
            "and whd_id=(select whd_id from warehouse where u_id = #{uid})")
    Integer checkGameOnWareHouse(@Param("gid") Integer gId, @Param("uid") Integer uId);


    //把游戏添加到仓库
    @Insert("insert into warehousedetail value(#{whd_id},(select gd_id from gamedetail where g_id =#{g_id}))  ")
    boolean addGameOnWareHouse(@Param("whd_id") Integer id, @Param("g_id") Integer o_g_id);

    //后台仓库用户有的游戏
    @Select("select * from games where g_id in (select g_id from gamedetail where gd_id in (select gd_id from warehousedetail where whd_id = #{uid})) ")
    @ResultType(Games.class)
    List<Games> lookWareHouse(@Param("uid") Integer uId1);
}
