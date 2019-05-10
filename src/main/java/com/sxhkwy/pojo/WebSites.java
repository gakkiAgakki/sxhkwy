package com.sxhkwy.pojo;

import java.io.Serializable;

/**
 * 首页网站展示
 * Created by HASEE on 2019/4/23.
 */
public class WebSites implements Serializable {
    private Integer wId;    //展示网站的ID
    private String wURL;    //展示网站的URL
    private String wPic;    //展示网站的图片
    private String wExplain;//展示网站的说明

    public Integer getwId() {
        return wId;
    }

    public void setwId(Integer wId) {
        this.wId = wId;
    }

    public String getwURL() {
        return wURL;
    }

    public void setwURL(String wURL) {
        this.wURL = wURL;
    }

    public String getwPic() {
        return wPic;
    }

    public void setwPic(String wPic) {
        this.wPic = wPic;
    }

    public String getwExplain() {
        return wExplain;
    }

    public void setwExplain(String wExplain) {
        this.wExplain = wExplain;
    }

    @Override
    public String toString() {
        return "WebSites{" +
                "wId=" + wId +
                ", wURL='" + wURL + '\'' +
                ", wPic='" + wPic + '\'' +
                ", wExplain='" + wExplain + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        WebSites webSites = (WebSites) o;

        if (wId != null ? !wId.equals(webSites.wId) : webSites.wId != null) return false;
        if (wURL != null ? !wURL.equals(webSites.wURL) : webSites.wURL != null) return false;
        if (wPic != null ? !wPic.equals(webSites.wPic) : webSites.wPic != null) return false;
        return wExplain != null ? wExplain.equals(webSites.wExplain) : webSites.wExplain == null;
    }

    @Override
    public int hashCode() {
        int result = wId != null ? wId.hashCode() : 0;
        result = 31 * result + (wURL != null ? wURL.hashCode() : 0);
        result = 31 * result + (wPic != null ? wPic.hashCode() : 0);
        result = 31 * result + (wExplain != null ? wExplain.hashCode() : 0);
        return result;
    }
}
