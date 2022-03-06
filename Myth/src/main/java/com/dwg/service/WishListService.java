package com.dwg.service;

import com.dwg.vo.ViewWishList;

import java.util.List;

public interface WishListService {


    //展示用户愿望清单中的游戏
    List<ViewWishList> queryWishGames(Integer id);

    //添加游戏到用户的愿望清单
    boolean collectGame(Integer gId,Integer uId);

    //删除用户愿望清单中的游戏
    void removeWishGames(Integer gId,Integer uId);

    //查看愿望清单中是否已有游戏
    Integer checkGameOnWishList(Integer gId, Integer id);
}
