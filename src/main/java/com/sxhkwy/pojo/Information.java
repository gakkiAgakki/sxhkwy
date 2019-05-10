package com.sxhkwy.pojo;

/**
 * 资讯
 * Created by HASEE on 2019/4/24.
 */
public class Information {
    private int iId;    //资讯ID
    private String iTitle;  //资讯标题
    private String iBody;   //资讯主体
    private String iDate;     //资讯时间
    private String iCategory;   //资讯类别
    private String iadjunctName;     //附件名
    private String iPictureName;    //图片名
    private String MessageMan;      //留言者

    public int getiId() {
        return iId;
    }

    public void setiId(int iId) {
        this.iId = iId;
    }

    public String getiTitle() {
        return iTitle;
    }

    public void setiTitle(String iTitle) {
        this.iTitle = iTitle;
    }

    public String getiBody() {
        return iBody;
    }

    public void setiBody(String iBody) {
        this.iBody = iBody;
    }

    public String getiDate() {
        return iDate;
    }

    public void setiDate(String iDate) {
        this.iDate = iDate;
    }

    public String getiCategory() {
        return iCategory;
    }

    public void setiCategory(String iCategory) {
        this.iCategory = iCategory;
    }

    public String getIadjunctName() {
        return iadjunctName;
    }

    public void setIadjunctName(String iadjunctName) {
        this.iadjunctName = iadjunctName;
    }

    public String getiPictureName() {
        return iPictureName;
    }

    public void setiPictureName(String iPictureName) {
        this.iPictureName = iPictureName;
    }

    public String getMessageMan() {
        return MessageMan;
    }

    public void setMessageMan(String messageMan) {
        MessageMan = messageMan;
    }

    @Override
    public String toString() {
        return "Information{" +
                "iId=" + iId +
                ", iTitle='" + iTitle + '\'' +
                ", iBody='" + iBody + '\'' +
                ", iDate='" + iDate + '\'' +
                ", iCategory='" + iCategory + '\'' +
                ", iadjunctName='" + iadjunctName + '\'' +
                ", iPictureName='" + iPictureName + '\'' +
                ", MessageMan='" + MessageMan + '\'' +
                '}';
    }
}
