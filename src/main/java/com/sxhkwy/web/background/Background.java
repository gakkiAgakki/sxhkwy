package com.sxhkwy.web.background;

import com.sxhkwy.pojo.Information;
import com.sxhkwy.pojo.User;
import com.sxhkwy.pojo.WebSites;
import com.sxhkwy.service.background.BackgroundServiceImpl;
import com.sxhkwy.utils.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

/**
 * controller层
 * Created by HASEE on 2019/4/23.
 * @author bian
 */
@Controller
@RequestMapping(value = "/background")
public class Background {

    @Autowired
    private BackgroundServiceImpl backgroundService;

    @RequestMapping(value = "/addInformation",method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView addInformation(@RequestParam("fileUpload")MultipartFile file, HttpServletRequest request, HttpServletResponse response,
                                       Information information){
        ModelAndView modelAndView = new ModelAndView();
        if(!backgroundService.hasUser(request)){
            modelAndView.setViewName("login");
            return modelAndView;
        }

//        String[] iCategories = request.getParameterValues("iCategory");
        User user = (User) request.getSession().getAttribute("user");
        information.setMessageMan(user.getuName());

        String iPictureName = (String) request.getSession().getAttribute("iPictureName");

        try {

            information.setiPictureName(iPictureName);
//            boolean b = backgroundService.fileUpload(file, request, response);
//            if (b == true) {
                backgroundService.addInformation(file, request, response, information);
//            }
//            modelAndView.setViewName("forward:/background/findByPage.action");
            modelAndView.setViewName("redirect:/background/findByPage.action");
            //清空session
            request.getSession().removeAttribute("iPictureName");
            request.getSession().removeAttribute("iadjunctName");

            return modelAndView;

        } catch (SQLException e) {
            e.printStackTrace();
            modelAndView.addObject("msg","添加异常");
            modelAndView.setViewName("test");
        }
        modelAndView.addObject("msg","添加失败");
        modelAndView.setViewName("test");
        return modelAndView;
    }

    @RequestMapping(value = "/findAllInformation",method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView findAllInformation(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        if(!backgroundService.hasUser(request)){
            modelAndView.setViewName("login");
            return modelAndView;
        }
        try {
            List<Information> informationAll = backgroundService.findInformationAll();
            modelAndView.addObject("informationList",informationAll);
            modelAndView.setViewName("manage");
            return modelAndView;
        } catch (SQLException e) {
            e.printStackTrace();
            modelAndView.addObject("msg","查询异常");
            modelAndView.setViewName("test");
//            return modelAndView;
        }
        modelAndView.addObject("msg","查询完成");
        modelAndView.setViewName("test");
        return modelAndView;
    }

    @RequestMapping(value = "/findInformationById")
    @ResponseBody
    public ModelAndView findInformationById(@RequestParam("iId") Integer iId,HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        if(!backgroundService.hasUser(request)){
            modelAndView.setViewName("login");
            return modelAndView;
        }
        try {
            Information informationById = backgroundService.findInformationById(iId);
            if (informationById == null){
                modelAndView.addObject("msg","没有查询到结果");
                modelAndView.setViewName("test");
                return modelAndView;
            }
            modelAndView.addObject("information",informationById);
            modelAndView.setViewName("detailed");
            return modelAndView;
        } catch (SQLException e) {
            e.printStackTrace();
            modelAndView.addObject("msg","查询异常");
            modelAndView.setViewName("test");
        }
        modelAndView.addObject("msg","查询完成");
        modelAndView.setViewName("test");
        return modelAndView;
    }
    @RequestMapping(value = "/findInfByIdForModify")
    @ResponseBody
    public ModelAndView findInfByIdForModify(@RequestParam("iId") Integer iId,HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        if(!backgroundService.hasUser(request)){
            modelAndView.setViewName("login");
            return modelAndView;
        }
        try {
            Information informationById = backgroundService.findInformationById(iId);
            if (informationById == null){
                modelAndView.addObject("msg","没有查询到结果");
                modelAndView.setViewName("test");
                return modelAndView;
            }
            modelAndView.addObject("information",informationById);
            modelAndView.setViewName("modifyInformation");
            return modelAndView;
        } catch (SQLException e) {
            e.printStackTrace();
            modelAndView.addObject("msg","查询异常");
            modelAndView.setViewName("test");
        }
        modelAndView.addObject("msg","查询完成");
        modelAndView.setViewName("test");
        return modelAndView;
    }
    @RequestMapping(value = "/modifyInformationById",method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView modifyInformationById(Information information,HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        if(!backgroundService.hasUser(request)){
            modelAndView.setViewName("login");
            return modelAndView;
        }
        try {
            backgroundService.modifyInformationById(information);
            modelAndView.setViewName("forward:/background/findAllInformation.action");
            return modelAndView;
        } catch (SQLException e) {
            e.printStackTrace();
            modelAndView.addObject("msg","查询异常");
            modelAndView.setViewName("test");
//            return modelAndView;
        }
        modelAndView.addObject("msg","查询完成");

        return modelAndView;
    }
    @RequestMapping(value = "/deleteInformationById")
    @ResponseBody
    public ModelAndView deleteInformationById(HttpServletRequest request,Integer iId){
        ModelAndView modelAndView = new ModelAndView();
        if(!backgroundService.hasUser(request)){
            modelAndView.setViewName("login");
            return modelAndView;
        }
        try {
            backgroundService.deleteInformationById(request,iId);
            //向前端发送的数据，前段可以加个隐藏域获取，然后进行操作/弹框
            modelAndView.addObject("msg",true);
            modelAndView.setViewName("redirect:/background/findByPage.action");
            return modelAndView;
        } catch (SQLException e) {
            e.printStackTrace();
            modelAndView.addObject("msg","删除异常");
            modelAndView.setViewName("test");
        }
        return modelAndView;
    }
    @RequestMapping(value = "/totalByInformation",method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView totalByInformation(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        if(!backgroundService.hasUser(request)){
            modelAndView.setViewName("login");
            return modelAndView;
        }
        try {
            Integer integer = backgroundService.totalByInformation();
            modelAndView.addObject("total",integer);
            modelAndView.setViewName("testPic");
            return modelAndView;
        } catch (SQLException e) {
//            e.printStackTrace();
            modelAndView.addObject("msg","查询total异常");
            modelAndView.setViewName("test");
        }
        return modelAndView;
    }
    @RequestMapping(value = "/findInformationByPage",method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView findInformationByPage(@RequestParam("startIndex")Integer startIndex,
                                              @RequestParam("rows")Integer rows,HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        if(!backgroundService.hasUser(request)){
            modelAndView.setViewName("login");
            return modelAndView;
        }
        HashMap<String, Integer> map = new HashMap<String, Integer>(16);
        map.put("startIndex",startIndex);
        map.put("rows",rows);
        modelAndView.addObject("startIndex",startIndex);
        modelAndView.addObject("rows",rows);
        try {
            List<Information> informationByPage = backgroundService.findInformationByPage(map);
            modelAndView.addObject("informationList",informationByPage);
            modelAndView.setViewName("testPic");
            return modelAndView;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return modelAndView;
    }
    @RequestMapping(value = "/setWebsite",method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView setWebsite(@RequestParam("websitePic")MultipartFile file, HttpServletRequest request, HttpServletResponse response, WebSites webSites){
        ModelAndView modelAndView = new ModelAndView();
        if(!backgroundService.hasUser(request)){
            modelAndView.setViewName("login");
            return modelAndView;
        }
        try {
            //调用后台方法，将对象存进数据库
            modelAndView = backgroundService.setWebSite(file, request, response, webSites);
            return modelAndView;
        } catch (SQLException e) {
            e.printStackTrace();
            modelAndView.addObject("msg","上传失败");
            modelAndView.setViewName("test");
        }
        return modelAndView.addObject(false);
    }

    /**
     *  @RequestMapping(value = "/findWebsiteAll",method = RequestMethod.POST)
     *
     */
    @RequestMapping(value = "/findWebsiteAll")
    @ResponseBody
    public ModelAndView findWebsiteAll(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        try {
            modelAndView = backgroundService.findWebsiteAll(request);
            return null;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        modelAndView.addObject("msg","查询出错");
        modelAndView.setViewName("test");
        return modelAndView;
    }
    @RequestMapping(value = "/findWebsites")
    @ResponseBody
    public ModelAndView findWebsites(HttpServletRequest request,PageBean pageBean){
        ModelAndView modelAndView = new ModelAndView();
        if(!backgroundService.hasUser(request)){
            modelAndView.setViewName("login");
            return modelAndView;
        }
        try {
            modelAndView = backgroundService.findWebsites(request,pageBean);
            return modelAndView;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        modelAndView.addObject("msg","查询出错");
        modelAndView.setViewName("test");
        return modelAndView;
    }
    @RequestMapping(value = "/deleteWebsiteById")
    @ResponseBody
    public ModelAndView deleteWebsiteById(@RequestParam("wId")Integer wId,HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        if(!backgroundService.hasUser(request)){
            modelAndView.setViewName("login");
            return modelAndView;
        }
        try {
            modelAndView = backgroundService.deleteWebsiteById(wId);
            return modelAndView;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        modelAndView.addObject("msg","删除异常");
        modelAndView.setViewName("test");
        return modelAndView;
    }
    @RequestMapping("/downLoadFile")
    @ResponseBody
    public void downLoadFile(@RequestParam("downFileName")String iadjunctName,HttpServletRequest request,HttpServletResponse response){
        try {
            backgroundService.downLoadFile(request,response,iadjunctName);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    @RequestMapping(value = "/findInformationByCat",method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView findInformationByCat(@RequestParam(value = "iCategory")String iCategory,HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();

        try {
            modelAndView = backgroundService.findInformationByCat(request,iCategory);
            return modelAndView;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        modelAndView.addObject("msg","查询完成");
        modelAndView.setViewName("test");
        return modelAndView;
    }
    @RequestMapping(value = "/getiCatCount")
    @ResponseBody
    public ModelAndView getiCatCount(@RequestParam("iCategory")String iCategory,HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        if(!backgroundService.hasUser(request)){
            modelAndView.setViewName("login");
            return modelAndView;
        }
        try {
            Integer iCategoryCount = backgroundService.getiCatCount(iCategory);
            modelAndView.addObject("iCategoryCount",iCategoryCount);
            modelAndView.setViewName("testPic");
            return modelAndView;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        modelAndView.addObject("msg","总数查询完成");
        modelAndView.setViewName("test");
        return modelAndView;
    }
    @RequestMapping(value = "/findByPage")
    @ResponseBody
    public ModelAndView findByPage(String iCategory,HttpServletRequest request,PageBean pageBean){
        ModelAndView modelAndView = new ModelAndView();
        if(!backgroundService.hasUser(request)){
            modelAndView.setViewName("login");
            return modelAndView;
        }
        try {
            modelAndView = backgroundService.findByPage(iCategory,request, pageBean);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return modelAndView;
    }
    @RequestMapping(value = "/findMoreByIcat")
    @ResponseBody
    public ModelAndView findMoreByIcat(HttpServletRequest request,PageBean pageBean){
        ModelAndView modelAndView = new ModelAndView();
        try {
            modelAndView = backgroundService.findMoreByIcat(request, pageBean);
            return modelAndView;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return modelAndView;
    }
    @RequestMapping(value = "/findInfById")
    @ResponseBody
    public ModelAndView findInfById(@RequestParam("iId")Integer iId){
        ModelAndView modelAndView = new ModelAndView();
        try {
            Information informationById = backgroundService.findInformationById(iId);
            if (informationById == null){
                modelAndView.addObject("msg","没有查询到结果");
                modelAndView.setViewName("test");
                return modelAndView;
            }
            modelAndView.addObject("information",informationById);
            modelAndView.setViewName("informationById");
            return modelAndView;
        } catch (SQLException e) {
            e.printStackTrace();
            modelAndView.addObject("msg","查询异常");
            modelAndView.setViewName("test");
        }
        modelAndView.addObject("msg","查询完成");
        modelAndView.setViewName("test");
        return modelAndView;
    }
    @RequestMapping(value = "/modifyInfById",method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView modifyInfById(@RequestParam("fileUpload")MultipartFile file, HttpServletRequest request, HttpServletResponse response,
                                      Information information){
        ModelAndView modelAndView = new ModelAndView();
        if(!backgroundService.hasUser(request)){
            modelAndView.setViewName("login");
            return modelAndView;
        }
        User user = (User) request.getSession().getAttribute("user");
        information.setMessageMan(user.getuName());
        try {

//            boolean b = backgroundService.fileUpload(file, request, response);
//            if (b == true) {
            backgroundService.modifyInformation(file, request, response, information);
//            }
//            modelAndView.setViewName("forward:/background/findByPage.action");
            modelAndView.setViewName("redirect:/background/findByPage.action");
            //清空session
            request.getSession().removeAttribute("iadjunctName");

            return modelAndView;

        } catch (SQLException e) {
            e.printStackTrace();
            modelAndView.addObject("msg","添加异常");
            modelAndView.setViewName("test");
        }
        modelAndView.addObject("msg","添加失败");
        modelAndView.setViewName("test");

        return modelAndView;
    }
    @RequestMapping("/deleteFile")
    @ResponseBody
    public ModelAndView deleteFile(@RequestParam("iId")Integer iId,@RequestParam("iadjunctName")String iadjunctName,HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        if(!backgroundService.hasUser(request)){
            modelAndView.setViewName("login");
            return modelAndView;
        }
        modelAndView = backgroundService.deleteFile(request, iId, iadjunctName);
        return modelAndView;
    }
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView login(HttpServletRequest request,User user){
        ModelAndView modelAndView = new ModelAndView();
        boolean login = backgroundService.login(request, user);
        if (login){
            modelAndView.setViewName("redirect:/background/findByPage.action");
            return modelAndView;
        }
        modelAndView.addObject("msg","登陆失败");
        modelAndView.setViewName("login");
        return modelAndView;
    }
    @RequestMapping(value = "/findUser")
    @ResponseBody
    public ModelAndView findUser(HttpServletRequest request,PageBean pageBean){
        ModelAndView modelAndView = new ModelAndView();
        if(!backgroundService.hasUser(request)){
            modelAndView.setViewName("login");
            return modelAndView;
        }
        if (!backgroundService.hasRuler(request)){
            modelAndView.addObject("msg","权限不足");
            modelAndView.setViewName("test");
            return modelAndView;
        }
        modelAndView = backgroundService.findUser(pageBean, request);
        return modelAndView;
    }
    @RequestMapping(value = "/setUser",method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView setUser(User user,HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        if(!backgroundService.hasUser(request)){
            modelAndView.setViewName("login");
            return modelAndView;
        }
        if (!backgroundService.hasRuler(request)){
            modelAndView.addObject("msg","权限不足");
            modelAndView.setViewName("test");
            return modelAndView;
        }
        modelAndView = backgroundService.setUser(user);
        return modelAndView;
    }
    @RequestMapping(value = "delInfs")
    @ResponseBody
    public ModelAndView delInfs(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        if(!backgroundService.hasUser(request)){
            modelAndView.setViewName("login");
            return modelAndView;
        }
        String[] iIds = request.getParameterValues("id");
        Object[][] params = new Object[iIds.length][];
        for (int i = 0; i < params.length ;i++){
            try {
                backgroundService.deleteInformationById(request, Integer.valueOf(iIds[i]));
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        //向前端发送的数据，前段可以加个隐藏域获取，然后进行操作/弹框
        modelAndView.setViewName("redirect:/background/findByPage.action");
        return modelAndView;
    }
    @RequestMapping(value = "delWebsites")
    @ResponseBody
    public ModelAndView delWebsites(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        if(!backgroundService.hasUser(request)){
            modelAndView.setViewName("login");
            return modelAndView;
        }
        String[] wIds = request.getParameterValues("id");
        Object[][] params = new Object[wIds.length][];
        for (int i = 0; i < params.length ;i++){
            try {
                backgroundService.deleteWebsiteById(Integer.valueOf(wIds[i]));
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        //向前端发送的数据，前段可以加个隐藏域获取，然后进行操作/弹框
        modelAndView.setViewName("redirect:/background/findWebsites.action");
        return modelAndView;
    }
    @RequestMapping(value = "delUsers")
    @ResponseBody
    public ModelAndView delUsers(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        if(!backgroundService.hasUser(request)){
            modelAndView.setViewName("login");
            return modelAndView;
        }
        if (!backgroundService.hasRuler(request)){
            modelAndView.addObject("msg","权限不足");
            modelAndView.setViewName("test");
            return modelAndView;
        }
        User user = (User) request.getSession().getAttribute("user");
        Integer loginUser = user.getuId();
        String[] uIds = request.getParameterValues("id");
        Object[][] params = new Object[uIds.length][];
        for (int i = 0; i < params.length ;i++){
//            if (loginUser == Integer.valueOf(uIds[i])){
            if (loginUser.equals(Integer.valueOf(uIds[i]))){
                modelAndView.addObject("msg","无法删除自身用户");
                modelAndView.setViewName("test");
                return modelAndView;
            }
            try {
                backgroundService.deleteUserById(request, Integer.valueOf(uIds[i]));
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        //向前端发送的数据，前段可以加个隐藏域获取，然后进行操作/弹框
        modelAndView.setViewName("redirect:/background/findUser.action");
        return modelAndView;
    }
    @RequestMapping(value = "delUser")
    @ResponseBody
    public ModelAndView delUser(Integer uId,HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        if(!backgroundService.hasUser(request)){
            modelAndView.setViewName("login");
            return modelAndView;
        }
        if (!backgroundService.hasRuler(request)){
            modelAndView.addObject("msg","权限不足");
            modelAndView.setViewName("test");
            return modelAndView;
        }
        User user = (User) request.getSession().getAttribute("user");
        Integer loginUser = user.getuId();
//        if (loginUser == uId){
        if (loginUser.equals(uId)){
            modelAndView.addObject("msg","无法删除自身用户");
            modelAndView.setViewName("test");
            return modelAndView;
        }
        try {
            backgroundService.deleteUserById(request,uId);
            modelAndView.setViewName("redirect:/background/findUser.action");
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return modelAndView;
    }
    @RequestMapping(value = "/userExit",method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView userExit(@RequestParam("uName")String uName,HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        User user = (User) request.getSession().getAttribute("user");
        System.out.println("modifyMsg" + user);

        //退出
        Object user1 = request.getSession().getAttribute("user");
        request.getSession().removeAttribute("user");
        modelAndView.setViewName("login");
        return modelAndView;
    }

}
