package com.sxhkwy.dao.background;

import com.sxhkwy.pojo.Information;
import com.sxhkwy.pojo.User;
import com.sxhkwy.pojo.WebSites;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 后台系统DAO层
 * Created by HASEE on 2019/4/24.
 */
@Repository
public interface BackgroundMapper {
    /**
     * 查询所有资讯
     * @return  所有资讯集合
     * @throws SQLException
     */
    public List<Information> findInformationAll()throws SQLException;

    /**
     * 添加资讯
     * @param information   被添加资讯的内容
     * @throws SQLException
     */
    public void setInformation(Information information) throws SQLException;

    /**
     * 根据ID查询资讯
     * @param iId   要查询详细的ID
     * @return  查询到的资讯
     * @throws SQLException
     */
    public Information findInformationById(Integer iId) throws SQLException;

    /**
     * 根据ID删除资讯信息
     * @param iId   要删除资讯的ID
     * @throws SQLException
     */
    public void deleteInformationById(Integer iId) throws SQLException;

    /**
     * 根据ID修改资讯信息
     * @param iId   要修改资讯的ID
     * @throws SQLException
     */
    public void modifyInformationById(Information information) throws SQLException;

    /**
     *  分页查询资讯信息
     * @param hashMap map集合放入开始条数，查询行数，比如0,10
     * @return 分页查询后的集合
     * @throws SQLException
     */
    public List<Information> findInformationByPage(HashMap hashMap) throws SQLException;

    /**
     * 查询资讯总条数
     * @return 资讯的总条数
     * @throws SQLException
     */
    public Integer totalByInformation() throws SQLException;

    /**
     * 查询全部网站
     * @return
     * @throws SQLException
     */
    public List<WebSites> findWebSiteAll()throws SQLException;

    /**
     * 添加网站
     * @param webSite
     * @throws SQLException
     */
    public void setWebSite(WebSites webSite)throws SQLException;

    /**
     * 根据ID删除website
     * @param wId
     * @throws SQLException
     */
    public void deleteWebsiteById(Integer wId)throws SQLException;

    /**
     * 根据分类查询
     * @param iCategory
     * @return
     * @throws SQLException
     */
    public List<Information> findInformationByCat(String iCategory) throws SQLException;

    /**
     * 查询该分类总条数
     * @param iCategory
     * @return
     * @throws SQLException
     */
    public Integer getiCatCount(String iCategory)throws SQLException;

    public void deleteIadjunctNameBypId(Integer integer);

    Integer getWebCount();

    List<WebSites> findWebSites(HashMap<String, Object> map);

    Integer getUserCount();

    void setUser(User user);

    User getUser(User user);

    List<User> findUser(Map map);

    Integer getUserByName(User user);

    void deleteUserById(Integer integer)throws SQLException;
}
