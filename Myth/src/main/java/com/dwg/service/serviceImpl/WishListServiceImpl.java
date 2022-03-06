package com.dwg.service.serviceImpl;

import com.dwg.dao.WishListDao;
import com.dwg.service.WishListService;
import com.dwg.vo.ViewWishList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WishListServiceImpl implements WishListService {

    @Autowired
    private WishListDao wishListDao;

    @Override
    public List<ViewWishList> queryWishGames(Integer id) {
        return wishListDao.queryWishGames(id);
    }

    @Override
    public boolean collectGame(Integer gId,Integer uId) { return wishListDao.collectGame(gId,uId); }

    @Override
    public void removeWishGames(Integer gId,Integer uId) {
         wishListDao.removeWishGames(gId,uId);
    }

    @Override
    public Integer checkGameOnWishList(Integer gId, Integer uId) { return wishListDao.checkGameOnWishList(gId, uId); }
}
