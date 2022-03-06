package com.deng.Test;

import com.dwg.entity.Games;
import com.dwg.service.GameService;
import com.dwg.service.serviceImpl.GameServiceImpl;
import org.junit.Test;

import java.util.List;

public class selectGameByNameTest {



    @Test
    public void Test02(){
        GameService gameService = new GameServiceImpl();
        List<Games> games = gameService.selectGameByName("O");
        for (Games game : games) {
            System.out.println(game);
        }
    }
}
