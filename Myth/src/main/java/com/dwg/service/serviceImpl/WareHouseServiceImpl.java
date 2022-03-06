package com.dwg.service.serviceImpl;

import com.dwg.dao.WareHouseDao;
import com.dwg.entity.GameDetail;
import com.dwg.entity.Games;
import com.dwg.service.WareHouseService;
import com.dwg.vo.ViewWareHouse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WareHouseServiceImpl implements WareHouseService {

    @Autowired
    private WareHouseDao wareHouseDao;

    @Override
    public List<ViewWareHouse> getOwnGame(Integer uId) {
        return wareHouseDao.getOwnGame(uId);
    }

    @Override
    public GameDetail getOwnGameDetail(Integer gid) {
        return wareHouseDao.getOwnGameDetail(gid);
    }

    @Override
    public Integer checkGameOnWareHouse(Integer uId, Integer gId) {
        return wareHouseDao.checkGameOnWareHouse(uId,gId);
    }

    @Override
    public List<Games> lookWareHouse(Integer uId1) {
        return wareHouseDao.lookWareHouse(uId1);
    }
}
