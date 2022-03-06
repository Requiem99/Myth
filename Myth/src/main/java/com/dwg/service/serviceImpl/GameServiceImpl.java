package com.dwg.service.serviceImpl;

import com.dwg.dao.GameDao;
import com.dwg.entity.Games;
import com.dwg.service.GameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GameServiceImpl implements GameService {

    @Autowired
    private GameDao gameDao;

    public List<Games> allGame() {
        return gameDao.gameList();
    }

    @Override
    public List<Games> selectGameByName(String Gname) {
        return gameDao.selectGameByName(Gname);
    }

    @Override
    public List<Games> selectGameByStar() {
        return gameDao.selectGameByStar();
    }

    @Override
    public Games getGameById(Integer id) {
        return gameDao.getGameById(id);
    }

    @Override
    public List<Games> listGames() {
        return gameDao.listGames();
    }

    @Override
    public void gamesDeleteById(Integer gId) {
        gameDao.gamesDeleteById(gId);
    }

    @Override
    public List<Games> selectByNameAndId(String gName, Integer gId) {
        return gameDao.selectByNameAndId(gName,gId);
    }

    @Override
    public Integer getGameMaxId() {
        return gameDao.getGameMaxId();
    }

    @Override
    public Boolean saveGame(Games games) {
        return gameDao.saveGame(games);
    }

    @Override
    public List<Games> listGamesOrder() {
        return gameDao.listGamesOrder();
    }

    @Override
    public List<Games> listGamesAnti() {
        return gameDao.listGamesAnti();
    }
}
