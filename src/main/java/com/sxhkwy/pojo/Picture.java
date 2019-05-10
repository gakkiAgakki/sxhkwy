package com.sxhkwy.pojo;

import java.io.Serializable;

/**
 * 首页导航图展示
 * Created by HASEE on 2019/4/23.
 */
public class Picture implements Serializable {
    private Integer pId;    //图片ID
    private String pName;   //图片名称
    private String pPath;   //图片路径
    private String pCategory; //图片所属类别

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getpPath() {
        return pPath;
    }

    public void setpPath(String pPath) {
        this.pPath = pPath;
    }

    public String getpCategory() {
        return pCategory;
    }

    public void setpCategory(String pCategory) {
        this.pCategory = pCategory;
    }

    @Override
    public String toString() {
        return "Picture{" +
                "pId=" + pId +
                ", pName='" + pName + '\'' +
                ", pPath='" + pPath + '\'' +
                ", pCategory='" + pCategory + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o){ return true;}
        if (o == null || getClass() != o.getClass()){ return false;}

        Picture picture = (Picture) o;

        if (pId != null ? !pId.equals(picture.pId) : picture.pId != null){ return false;}
        if (pName != null ? !pName.equals(picture.pName) : picture.pName != null) {return false;}
        return pPath != null ? pPath.equals(picture.pPath) : picture.pPath == null;
    }

    @Override
    public int hashCode() {
        int result = pId != null ? pId.hashCode() : 0;
        result = 31 * result + (pName != null ? pName.hashCode() : 0);
        result = 31 * result + (pPath != null ? pPath.hashCode() : 0);
        return result;
    }
}
