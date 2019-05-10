package com.sxhkwy.web.background;

import com.sxhkwy.pojo.Picture;
import com.sxhkwy.service.front.PictureServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * 对图片的处理
 * Created by HASEE on 2019/4/24.
 */
@Controller

@RequestMapping(value = "/pic")

public class Pic {
    // 上传文件存储目录
    private static final String UPLOAD_DIRECTORY = "upload";
    @Autowired
    private PictureServiceImpl pictureService;


    @RequestMapping(value = "/upload",method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView setPic(@RequestParam(value = "uploadFilePic") MultipartFile file, HttpServletRequest request, HttpServletResponse response, Picture picture) {
        ModelAndView modelAndView = new ModelAndView();

        try {
            modelAndView = pictureService.setPicture(file, request, response, picture);//调用后台方法，将对象存进数据库
            Map<String, Object> map = modelAndView.getModel();
            try {
                if ("false".equals(map.get("flag"))) {
                        response.getWriter().write("false");
                    return null;
                }else if ("true".equals(map.get("flag"))){
                    response.getWriter().write("true");
                    return null;
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
            return null;
        } catch (SQLException e) {
            e.printStackTrace();
            modelAndView.addObject("msg","上传失败");
            modelAndView.setViewName("test");
        }
        return modelAndView.addObject("false");

    }
    @RequestMapping(value = "/uploadPic",method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView uploadPic(@RequestParam(value = "uploadPic") MultipartFile file,HttpServletRequest request,HttpServletResponse response,Picture picture){
        ModelAndView modelAndView = new ModelAndView();
        try {
            modelAndView = pictureService.uploadPic(file, request, response, picture);
            return modelAndView;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return modelAndView;
    }
    @RequestMapping(value = "/findAll")
    public String findAllPic(Model model){
        ModelAndView modelAndView = new ModelAndView();
        try {
            List<Picture> pictureAll = pictureService.findPictureAll();
            model.addAttribute("pic",pictureAll);
            return "index";
        } catch (SQLException e) {
            e.printStackTrace();
        }

        model.addAttribute("msg","查询失败");
        return "test";
    }

    @RequestMapping(value = "findPicBypId",method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView findPicBypId(@RequestParam("pId")Integer pId){
        ModelAndView modelAndView = new ModelAndView();
        try {
            Picture picBypId = pictureService.findPicBypId(pId);
            modelAndView.addObject("picture",picBypId);
            modelAndView.addObject("msg","查询完成");
            modelAndView.setViewName("testPic");
            return modelAndView;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        modelAndView.addObject("msg","查询完成");
        modelAndView.setViewName("test");
        return modelAndView;
    }
    //删除图片测试
    @RequestMapping(value = "delete",method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView deletePicBypTest(Picture picture,HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        try {
                modelAndView = pictureService.deletePicBypTest(picture, request);
                return modelAndView;
            } catch (SQLException e) {
                e.printStackTrace();
            }

        modelAndView.addObject("msg","删除未完成");
        modelAndView.setViewName("test");
        return modelAndView;
    }

    /**
     * 图片修改
     * @param file  新的图片
     * @param request   需要用来获取路径
     * @param picture   图片对象
     * @return  修改是否完成
     */
    @RequestMapping(value = "modifyPicBypId",method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView modifyPicBypId(@RequestParam(value = "uploadFile")MultipartFile file ,HttpServletRequest request,
                                       Picture picture){
        ModelAndView modelAndView = new ModelAndView();
        try {
            modelAndView = pictureService.modifyPicBypId(file, request, picture);
            return modelAndView;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        modelAndView.addObject("msg","修改未完成");
        modelAndView.setViewName("test");
        return modelAndView;
    }
}
