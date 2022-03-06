package com.dwg.dao;

import com.dwg.entity.Games;
import org.apache.ibatis.annotations.*;

import java.util.List;


public interface GameDao {

    @Select("select * from games limit 4")
    @ResultType(Games.class)
    List<Games> gameList();

    @Select("select * from games where g_name like concat('%',#{Gname},'%') ")
    @ResultType(Games.class)
    List<Games> selectGameByName(@Param("Gname") String Gname);

    @Select("select * from games order by g_star DESC limit 8  ")
    @ResultType(Games.class)
    List<Games> selectGameByStar();

    @Select("select * from games where g_id = #{id}")
    Games getGameById(@Param("id") Integer id);

    @Select("select * from games")
    List<Games> listGames();

    @Select("select * from games limit 8")
    List<Games> listGamesOrder();

    @Select("select * from games order by g_id DESC limit 8")
    List<Games> listGamesAnti();

    @Delete("delete * from games where g_id = #{gid}")
    void gamesDeleteById(@Param("gid") Integer gId);

    @Select("<script>" +
                "select * from games " +
                "<where>" +
                    "<if test = 'gname != null'>" +
                        "and g_name like concat('%',#{gname},'%')" +
                    "</if>" +
                    "<if test = 'gid != null'>" +
                        "and g_id = #{gid}" +
                    "</if>" +
                "</where>" +
            "</script>")
    @ResultType(Games.class)
    List<Games> selectByNameAndId(@Param("gname")String gName, @Param("gid") Integer gId);

    @Select("select MAX(g_id) from games")
    Integer getGameMaxId();

    @Insert("Insert into games(g_name,g_detail,g_type,g_picture,g_star,price,uptime) values(#{g_name},#{g_detail},#{g_type},#{g_picture},#{g_star},#{price},#{uptime})")
    Boolean saveGame(Games games);


}
