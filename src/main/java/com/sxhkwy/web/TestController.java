package com.sxhkwy.web;

import com.sxhkwy.service.front.PictureServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;

/**
 * Created by HASEE on 2019/4/24.
 */
@RequestMapping("/corporation")
@Controller
public class TestController {

        @Resource
        private PictureServiceImpl pictureService;


    @RequestMapping("/upload")
    public String upload
            (@RequestParam("pName")String pName, MultipartFile file, HttpServletRequest request, Model model)
            throws Exception
    {
        String sqlPath=null;//保存数据库的路径
        String filename=null;//定义文件名
        String contentType=file.getContentType();	//获取文件类型（后缀）
        //因为获取的后缀是XXXX/xxx形式
        contentType=contentType.substring(contentType.indexOf("/")+1);
        filename=pName+"."+contentType;
        System.out.println(filename);
        String url = request.getSession().getServletContext().getRealPath("/pic");
        System.out.println(url);
        url=url+"/";
        file.transferTo(new File(url+filename));//保存图片
//        User u=userService.userMessage(pName);
//        u.setHead("userhead/"+filename);
//        System.out.println("头像为："+u.getHead());
//        model.addAttribute("user",u);
        return "showImage";
    }
}

