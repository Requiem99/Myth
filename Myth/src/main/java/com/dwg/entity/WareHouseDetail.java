package com.dwg.entity;

public class WareHouseDetail {
    private Integer whd_id;
    private Integer g_id;

    public WareHouseDetail() {
    }

    public WareHouseDetail(Integer whd_id, Integer g_id) {
        this.whd_id = whd_id;
        this.g_id = g_id;
    }

    public Integer getWhd_id() {
        return whd_id;
    }

    public void setWhd_id(Integer whd_id) {
        this.whd_id = whd_id;
    }

    public Integer getG_id() {
        return g_id;
    }

    public void setG_id(Integer g_id) {
        this.g_id = g_id;
    }

    @Override
    public String toString() {
        return "WareHouseDetail{" +
                "whd_id=" + whd_id +
                ", g_id=" + g_id +
                '}';
    }
}
