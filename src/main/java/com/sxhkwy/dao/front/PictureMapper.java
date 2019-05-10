package com.sxhkwy.dao.front;

import com.sxhkwy.pojo.Picture;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;

/**
 * 前台图片
 * Created by HASEE on 2019/4/23.
 */
@Repository
public interface PictureMapper {
    /**
     * 查询所有图片信息（图片名，路径）
     * @return
     */
    public List<Picture> findPicAll();

    /**
     * 添加图片
     * @param picture
     * @return
     * @throws SQLException
     */
    public boolean setPicture(Picture picture) throws SQLException;

    /**
     * 查询图片总条数
     * @return
     * @throws SQLException
     */
    public Integer totalByPicture()throws SQLException;

    /**
     * 根据ID查询图片信息
     * @param pId
     * @return
     */
    public Picture findPicBypId(Integer pId);

    public void deletePicBypId(Integer integer);

    public void modifyPicBypPid(Picture picture);
}
