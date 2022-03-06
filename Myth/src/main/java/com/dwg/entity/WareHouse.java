package com.dwg.entity;

public class WareHouse {
       private Integer wh_id;
       private Integer whd_id;
       private Integer u_id;

    public WareHouse() {
    }

    public WareHouse(Integer wh_id, Integer whd_id, Integer u_id) {
        this.wh_id = wh_id;
        this.whd_id = whd_id;
        this.u_id = u_id;
    }

    public Integer getWh_id() {
        return wh_id;
    }

    public void setWh_id(Integer wh_id) {
        this.wh_id = wh_id;
    }

    public Integer getWhd_id() {
        return whd_id;
    }

    public void setWhd_id(Integer whd_id) {
        this.whd_id = whd_id;
    }

    public Integer getU_id() {
        return u_id;
    }

    public void setU_id(Integer u_id) {
        this.u_id = u_id;
    }

    @Override
    public String toString() {
        return "Warehouse{" +
                "wh_id=" + wh_id +
                ", whd_id=" + whd_id +
                ", u_id=" + u_id +
                '}';
    }
}
