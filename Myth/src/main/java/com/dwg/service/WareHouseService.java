package com.dwg.service;


import com.dwg.entity.GameDetail;
import com.dwg.entity.Games;
import com.dwg.vo.ViewWareHouse;

import java.util.List;

public interface WareHouseService {
    List<ViewWareHouse> getOwnGame(Integer uId);

    GameDetail getOwnGameDetail(Integer gid);

    //查看仓库是否有该游戏
    Integer checkGameOnWareHouse(Integer gId, Integer uId);

    List<Games> lookWareHouse(Integer uId1);
}
