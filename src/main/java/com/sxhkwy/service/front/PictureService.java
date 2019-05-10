package com.sxhkwy.service.front;

import com.sxhkwy.pojo.Picture;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;

/**
 * picture的service接口
 * Created by HASEE on 2019/4/23.
 */
public interface PictureService {
    /**
     * 查询图片信息，封装到集合中
     * @return
     * @throws SQLException
     */
    public List<Picture> findPictureAll() throws SQLException;

    /**
     * 上传文件时添加图片
     * @param picture
     * @return
     * @throws SQLException
     */
    public ModelAndView setPicture(MultipartFile file, HttpServletRequest request, HttpServletResponse response, Picture picture)throws SQLException;

    /**
     * 添加图片
     * @param file
     * @param request
     * @param response
     * @param picture
     * @return
     * @throws SQLException
     */
    public ModelAndView uploadPic(MultipartFile file,HttpServletRequest request,HttpServletResponse response,Picture picture)throws SQLException;

    /**
     * 根据ID查询图片信息
     * @param pId
     * @return
     * @throws SQLException
     */
    public Picture findPicBypId(Integer pId)throws SQLException;

    /**
     * 删除
     * @param picture
     * @throws SQLException
     */
    public ModelAndView deletePicBypTest(Picture picture,HttpServletRequest request)throws SQLException;

    /**
     * 修改图片
     * @param file  图片
     * @param request   获取路径
     * @param picture   图片信息
     * @return  修改成功或失败
     * @throws SQLException
     */
    public ModelAndView modifyPicBypId(MultipartFile file , HttpServletRequest request,
                                       Picture picture)throws SQLException;
}
