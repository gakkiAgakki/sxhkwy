package com.sxhkwy.pojo;

import java.io.Serializable;

/**
 * 后台系统用户
 * Created by HASEE on 2019/4/23.
 */
public class User implements Serializable {
    private Integer uId;    //用户ID
    private String uName;   //用户名
    private String uPsw;    //用户密码
    private String ruler;   //权限

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    public String getuPsw() {
        return uPsw;
    }

    public void setuPsw(String uPsw) {
        this.uPsw = uPsw;
    }

    public String getRuler() {
        return ruler;
    }

    public void setRuler(String ruler) {
        this.ruler = ruler;
    }

    @Override
    public String toString() {
        return "User{" +
                "uId=" + uId +
                ", uName='" + uName + '\'' +
                ", uPsw='" + uPsw + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        User user = (User) o;

        if (uId != null ? !uId.equals(user.uId) : user.uId != null) return false;
        if (uName != null ? !uName.equals(user.uName) : user.uName != null) return false;
        return uPsw != null ? uPsw.equals(user.uPsw) : user.uPsw == null;
    }

    @Override
    public int hashCode() {
        int result = uId != null ? uId.hashCode() : 0;
        result = 31 * result + (uName != null ? uName.hashCode() : 0);
        result = 31 * result + (uPsw != null ? uPsw.hashCode() : 0);
        return result;
    }
}
