package com.sxhkwy.utils;

import java.io.Serializable;

/**
 * 返回值
 * Created by HASEE on 2019/4/23.
 */
public class Result implements Serializable {

    //是否成功, 成功true, 失败false
    private boolean success;
    //成果或者失败的消息
    private String message;
    public Result(boolean success, String message) {
        super();
        this.success = success;
        this.message = message;
    }
    public boolean isSuccess() {
        return success;
    }
    public void setSuccess(boolean success) {
        this.success = success;
    }
    public String getMessage() {
        return message;
    }
    public void setMessage(String message) {
        this.message = message;
    }


}
