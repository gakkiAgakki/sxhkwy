package com.sxhkwy.service.background;

import com.sxhkwy.pojo.Information;
import com.sxhkwy.pojo.User;
import com.sxhkwy.pojo.WebSites;
import com.sxhkwy.utils.PageBean;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

/**
 * 后台service接口
 * Created by HASEE on 2019/4/23.
 */
public interface BackgroundService {
    /**
     * 添加资讯
     * @param information
     * @throws SQLException
     */
    public void addInformation(MultipartFile file, HttpServletRequest request, HttpServletResponse response, Information information)throws SQLException;

    /**
     * 查询所有资讯
     * @return
     * @throws SQLException
     */
    public List<Information> findInformationAll()throws SQLException;

    /**
     * 根据ID查询资讯信息
     * @param iId
     * @return
     * @throws SQLException
     */
    public Information findInformationById(Integer iId)throws SQLException;

    /**
     * 根据ID删除资讯信息
     * @param iId
     * @throws SQLException
     */
    public void deleteInformationById(HttpServletRequest request,Integer iId)throws SQLException;

    /**
     * 根据ID修改资讯信息
     * @param iId
     * @throws SQLException
     */
    public void modifyInformationById(Information information)throws SQLException;

    /**
     * 分页查询资讯信息
     * @param hashMap map集合放入开始条数，查询行数,如0,10
     * @return  分页查询后的集合
     * @throws SQLException
     */
    public List<Information> findInformationByPage(HashMap hashMap)throws SQLException;

    /**
     * 查询资讯信息的总条数
     * @return
     * @throws SQLException
     */
    public Integer totalByInformation() throws SQLException;

    /**
     * 添加首页需要的网站
     * @param file
     * @param request
     * @param response
     * @param webSites
     * @return
     * @throws SQLException
     */
    public ModelAndView setWebSite(MultipartFile file, HttpServletRequest request, HttpServletResponse response, WebSites webSites)throws SQLException;

    /**
     * 查询所有网站
     * @return
     * @throws SQLException
     */
    public ModelAndView findWebsiteAll(HttpServletRequest request)throws SQLException;

    ModelAndView findWebsites(HttpServletRequest request, PageBean pageBean) throws SQLException;

    /**
     * 根据ID删除
     * @param wId
     * @return
     * @throws SQLException
     */
    public ModelAndView deleteWebsiteById(Integer wId)throws SQLException;

    /**
     * 文件下载
     * @param request
     * @param response
     * @param iadjunctName
     * @throws SQLException
     */
    public void downLoadFile(HttpServletRequest request,HttpServletResponse response,String iadjunctName)throws SQLException;
    public ModelAndView findInformationByCat(HttpServletRequest request,String iCategory)throws SQLException;
    public Integer getiCatCount(String iCategory)throws SQLException;
//    分页查询
    public ModelAndView findByPage(String iCategory,HttpServletRequest request,PageBean pageBean)throws SQLException;

    public ModelAndView deleteFile(HttpServletRequest request,Integer iId, String iadjunctName);

    public void modifyInformation(MultipartFile file, HttpServletRequest request, HttpServletResponse response, Information information)throws SQLException;

    ModelAndView findMoreByIcat(HttpServletRequest request, PageBean pageBean) throws SQLException;

    boolean login(HttpServletRequest request,User user);

    ModelAndView findUser(PageBean pageBean,HttpServletRequest request);

    ModelAndView setUser(User user);

    void deleteUserById(HttpServletRequest request, Integer integer) throws SQLException;
}
