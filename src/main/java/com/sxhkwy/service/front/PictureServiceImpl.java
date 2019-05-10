package com.sxhkwy.service.front;

import com.sxhkwy.dao.front.PictureMapper;
import com.sxhkwy.pojo.Picture;
import com.sxhkwy.utils.IsPicture;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * picture的接口实现类
 * Created by HASEE on 2019/4/23.
 */
@Service
public class PictureServiceImpl implements PictureService {
    // 上传文件存储目录
    private static final String UPLOAD_DIRECTORY = "upload";

    @Autowired
    private PictureMapper pictureMapper;
    
    @Override
    public List<Picture> findPictureAll()throws SQLException {
        return pictureMapper.findPicAll();
    }

    @Override
    public ModelAndView setPicture(MultipartFile file, HttpServletRequest request, HttpServletResponse response, Picture picture)throws SQLException {
        request.getSession().removeAttribute("iPictureName");
        ModelAndView modelAndView = new ModelAndView();
        try {
            //上传后的地址，注意("/upload")是表示文件上传后的目标文件夹

//            String realPath = request.getSession().getServletContext().getRealPath("/upload");
            String realPath = request.getServletContext().getRealPath("/") + File.separator + UPLOAD_DIRECTORY;
            System.out.println("打印文件上传的路径"+realPath);

            //获取文件名

            String filename = file.getOriginalFilename();

            //文件名称为空的场合,
            if (filename == null || filename == ""){
                //返回false
//                response.getWriter().write("true");
                modelAndView.addObject("flag","true");
                return modelAndView;
            }

            //判断文件类型
//            IsPicture isPicture = new IsPicture();
//            try {
//                boolean picture1 = isPicture.isPicture(filename, null);
//                if (picture1 == false){
//                    modelAndView.addObject("msg","类型错误");
//                    modelAndView.setViewName("test");
////                    request.getRequestDispatcher("test.jsp").forward(request,response);
//                    return modelAndView;
//                }
//
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
            if (isPicture(modelAndView, filename)){
                return modelAndView;
            }

            //获取文件后缀名
//            String extensionname = filename.substring(filename.lastIndexOf(".") + 1);
//            //给上传的文件起别名，有很多种方式
//            String newFilename=String.valueOf(System.currentTimeMillis())+"."+extensionname;

            String extensionname = filename.substring(filename.lastIndexOf(".") + 1);
            //获取当前系统时间
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
            String format = simpleDateFormat.format(new Date());
//            //给上传的文件起别名，有很多种方式
//            String newFilename=String.valueOf(System.currentTimeMillis())+"."+extensionname;
            String substring = filename.substring(0,filename.lastIndexOf("."));
            String newFilename = substring + format + "." + extensionname;



            //创建File对象，传入目标路径参数，和新的文件别名

            File dir=new File(realPath,newFilename);

            if (!dir.exists()){//如果dir代表的文件不存在，则创建它，

                dir.mkdirs();

            }

            //如果存在则直接执行下面操作

            file.transferTo(dir);//将上传的实体文件复制到指定目录upload下
//            System.out.println(dir.getPath());
            picture.setpPath(newFilename);
//            picture.setpName(newFilename);//将文件名赋值给实体类，然后一并存到数据库

            pictureMapper.setPicture(picture);


            System.out.println("测试是否执行完毕");
//            modelAndView.addObject("msg","上传成功");
            request.getSession().setAttribute("iPictureName",picture.getpPath());
            response.getWriter().write("true");
//            modelAndView.setViewName("redirect:/pic/findAll.action");
            modelAndView.addObject( "flag",true);
//            modelAndView.setViewName("testPic");
            return modelAndView;

        } catch (IOException e) {

            e.printStackTrace();

        }
        modelAndView.addObject("msg","上传失败");
        modelAndView.setViewName("test");
        return modelAndView;
    }
    @Override
    public ModelAndView uploadPic(MultipartFile file,HttpServletRequest request,HttpServletResponse response,Picture picture)throws SQLException{
        ModelAndView modelAndView = new ModelAndView();
        try {
            //上传后的地址，注意("/upload")是表示文件上传后的目标文件夹

//            String realPath = request.getSession().getServletContext().getRealPath("/upload");
            String realPath = request.getServletContext().getRealPath("/") + File.separator + UPLOAD_DIRECTORY;
            System.out.println("打印文件上传的路径"+realPath);

            //获取文件名

            String filename = file.getOriginalFilename();

            //文件名称为空的场合,
            if (filename == null || filename == ""){
                //返回false
                modelAndView.addObject("msg","文件为空");
                modelAndView.setViewName("test");
                return modelAndView;
            }

            //判断文件类型
//            IsPicture isPicture = new IsPicture();
//            try {
//                boolean picture1 = isPicture.isPicture(filename, null);
//                if (picture1 == false){
//                    modelAndView.addObject("msg","类型错误");
//                    modelAndView.setViewName("test");
////                    request.getRequestDispatcher("test.jsp").forward(request,response);
//                    return modelAndView;
//                }
//
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
            if (isPicture(modelAndView, filename)){
                return modelAndView;
            }

            //获取文件后缀名
//            String extensionname = filename.substring(filename.lastIndexOf(".") + 1);
//            //给上传的文件起别名，有很多种方式
//            String newFilename=String.valueOf(System.currentTimeMillis())+"."+extensionname;

            String extensionname = filename.substring(filename.lastIndexOf(".") + 1);
            //获取当前系统时间
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
            String format = simpleDateFormat.format(new Date());
//            //给上传的文件起别名，有很多种方式
//            String newFilename=String.valueOf(System.currentTimeMillis())+"."+extensionname;
            String substring = filename.substring(0,filename.lastIndexOf("."));
            String newFilename = substring + format + "." + extensionname;


            //创建File对象，传入目标路径参数，和新的文件别名

            File dir=new File(realPath,newFilename);

            if (!dir.exists()){//如果dir代表的文件不存在，则创建它，

                dir.mkdirs();

            }

            //如果存在则直接执行下面操作

            file.transferTo(dir);//将上传的实体文件复制到指定目录upload下
//            System.out.println(dir.getPath());
            picture.setpPath(newFilename);
//            picture.setpName(newFilename);//将文件名赋值给实体类，然后一并存到数据库

            pictureMapper.setPicture(picture);


            System.out.println("测试是否执行完毕");
            modelAndView.setViewName("redirect:/pic/findAll.action");
            return modelAndView;

        } catch (IOException e) {

            e.printStackTrace();

        }
        return modelAndView;
    }

    @Override
    public Picture findPicBypId(Integer pId) throws SQLException {
        Picture picture = pictureMapper.findPicBypId(pId);
        return picture;
    }

    @Override
    public ModelAndView deletePicBypTest(Picture picture,HttpServletRequest request) throws SQLException {

        //删除操作
//            先通过servletContext.getRealPath("/upload")返回路径再操作
//            new File(servletContext.getRealPath("/upload") + "/aa.txt").delete();
        ModelAndView modelAndView = new ModelAndView();
        //路径
        String realPath = request.getServletContext().getRealPath("/") + File.separator + UPLOAD_DIRECTORY;
        //文件名
//        File file = new File(realPath);
        String filename = picture.getpPath();
        File fileTemp = new File(realPath + "\\" + filename);
        // 判断文件是否存在
        boolean falg = false;
        falg = fileTemp.exists();
        if (!falg) {
            modelAndView.addObject("msg", "删除文件不存在");
            modelAndView.setViewName("test");
            return modelAndView;
        }

        boolean delete = fileTemp.delete();
        if (delete) {

            Integer integer = picture.getpId();

            try {
                pictureMapper.deletePicBypId(integer);
                modelAndView.addObject("msg","图片信息删除成功");
                modelAndView.setViewName("test");
                return modelAndView;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        modelAndView.addObject("msg", "删除未完成");
        modelAndView.setViewName("test");
        return modelAndView;
    }

    @Override
    public ModelAndView modifyPicBypId(MultipartFile file, HttpServletRequest request, Picture picture) throws SQLException {
        ModelAndView modelAndView = new ModelAndView();
        String realPath = request.getServletContext().getRealPath("/") + File.separator + UPLOAD_DIRECTORY;
        System.out.println("打印文件上传的路径"+realPath);
        //获取文件名
        String filename = file.getOriginalFilename();
        //判断文件类型
        //这里判断是否为图片，是则false，不是则true
        if (isPicture(modelAndView, filename)){
            return modelAndView;
        }
        //删除原图
        //路径
        //文件名
//        File delFile = new File(realPath);
        String delFilename =picture.getpPath();
        File fileTemp = new File(realPath + "\\" + delFilename);
        // 判断原图是否存在
        boolean falg = false;
        falg = fileTemp.exists();
        if (!falg) {
            modelAndView.addObject("msg","删除文件不存在，未进行替换");
            modelAndView.setViewName("test");
            return modelAndView;
        }
        boolean delete = fileTemp.delete();
        if (delete){
            //获取文件后缀名

//            String extensionname = filename.substring(filename.lastIndexOf(".") + 1);
//
//            //给上传的文件起别名，有很多种方式
//
//            String newFilename=String.valueOf(System.currentTimeMillis())+"."+extensionname;

            String extensionname = filename.substring(filename.lastIndexOf(".") + 1);
            //获取当前系统时间
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
            String format = simpleDateFormat.format(new Date());
//            //给上传的文件起别名，有很多种方式
//            String newFilename=String.valueOf(System.currentTimeMillis())+"."+extensionname;
            String substring = filename.substring(0,filename.lastIndexOf("."));
            String newFilename = substring + format + "." + extensionname;


            //创建File对象，传入目标路径参数，和新的文件别名

            File dir=new File(realPath,newFilename);

            if (!dir.exists()){//如果dir代表的文件不存在，则创建它，

                dir.mkdirs();

            }

            //如果存在则直接执行下面操作

            try {
                file.transferTo(dir);//将上传的实体文件复制到指定目录upload下

            } catch (IOException e) {
                e.printStackTrace();
                modelAndView.addObject("msg","替换时失败");
                modelAndView.setViewName("test");
                return modelAndView;
            }
//            System.out.println(dir.getPath());
            picture.setpPath(newFilename);
//            picture.setpName(newFilename);//将文件名赋值给实体类，然后一并存到数据库
            pictureMapper.modifyPicBypPid(picture);
            modelAndView.setViewName("redirect:/pic/findAll.action");
            return modelAndView;
        }

        modelAndView.addObject("msg","删除原图片时失败");
        modelAndView.setViewName("test");
        return modelAndView;
    }

    private boolean isPicture(ModelAndView modelAndView, String filename) {
        IsPicture isPicture = new IsPicture();
        try {
            boolean picture1 = isPicture.isPicture(filename, null);
            //不是图片格式
            if (picture1 == false){
//                modelAndView.addObject("flag","类型错误");
                modelAndView.addObject("flag","false");
//                modelAndView.setViewName("testPic");
//                    request.getRequestDispatcher("test.jsp").forward(request,response);
                //返回是，进入方法，返回modelandview
                return true;
            }
            return false;
        } catch (Exception e) {
            e.printStackTrace();
        }
        modelAndView.addObject("msg","判断格式失败");
        modelAndView.setViewName("test");
        return true;
    }

}
