package com.dwg.entity;

public class WishList {
   private Integer w_id;
   private Integer u_id;
   private Integer wd_id;

    public WishList() {
    }

    public WishList(Integer w_id, Integer u_id, Integer wd_id) {
        this.w_id = w_id;
        this.u_id = u_id;
        this.wd_id = wd_id;
    }

    public Integer getW_id() {
        return w_id;
    }

    public void setW_id(Integer w_id) {
        this.w_id = w_id;
    }

    public Integer getU_id() {
        return u_id;
    }

    public void setU_id(Integer u_id) {
        this.u_id = u_id;
    }

    public Integer getWd_id() {
        return wd_id;
    }

    public void setWd_id(Integer wd_id) {
        this.wd_id = wd_id;
    }

    @Override
    public String toString() {
        return "WishList{" +
                "w_id=" + w_id +
                ", u_id=" + u_id +
                ", wd_id=" + wd_id +
                '}';
    }
}
