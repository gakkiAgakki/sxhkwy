package com.sxhkwy.dao.front;

import com.sxhkwy.pojo.WebSites;

import java.util.List;

/**
 * 前台的轮播网站
 * Created by HASEE on 2019/4/23.
 */
public interface WebSitesMapper {
    public List<WebSites> findWebSitesAll();
}
