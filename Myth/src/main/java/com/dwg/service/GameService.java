package com.dwg.service;

import com.dwg.entity.Games;

import java.util.List;

public interface GameService {
    List<Games> allGame();

    List<Games> selectGameByName(String Gname);

    List<Games> selectGameByStar();

    Games getGameById(Integer id);


    List<Games> listGames();

    void gamesDeleteById(Integer gId);

    List<Games> selectByNameAndId(String gName, Integer gId);

    Integer getGameMaxId();

    Boolean saveGame(Games games);

    List<Games> listGamesOrder();

    List<Games> listGamesAnti();

}
