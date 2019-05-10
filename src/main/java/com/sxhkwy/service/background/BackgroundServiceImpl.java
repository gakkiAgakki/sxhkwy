package com.sxhkwy.service.background;

import com.ndktools.javamd5.Mademd5;
import com.sxhkwy.dao.background.BackgroundMapper;
import com.sxhkwy.pojo.Information;
import com.sxhkwy.pojo.User;
import com.sxhkwy.pojo.WebSites;
import com.sxhkwy.utils.IsPicture;
import com.sxhkwy.utils.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * 后台代码实现类
 * Created by HASEE on 2019/4/23.
 */
@Service
public class BackgroundServiceImpl implements BackgroundService {
    // 上传文件存储目录
    private static final String UPLOAD_DIRECTORY = "file";
    // 上传网站图片存储目录
    private static final String UPLOAD_WEBSITEPIC = "websitesPic";


    @Autowired
    private BackgroundMapper backgroundMapper;

    /**
     * 添加资讯
     * @param information 要添加的资讯信息
     * @throws SQLException
     */
    @Override
    public void addInformation(MultipartFile file, HttpServletRequest request, HttpServletResponse response, Information information) throws SQLException {

        boolean b = fileUpload(file,request, response);
        if (b == true) {
            String iadjunctName = (String) request.getSession().getAttribute("iadjunctName");
            information.setIadjunctName(iadjunctName);
            backgroundMapper.setInformation(information);
        }
    }

    /**
     * 查询所有
     * @return 查询出的所有资讯
     * @throws SQLException
     */
    @Override
    public List<Information> findInformationAll() throws SQLException {
        List<Information> informationAll = backgroundMapper.findInformationAll();
        return informationAll;
    }

    /**
     * 根据ID查询information
     * @param iId
     * @return 要查询资讯的ID
     * @throws SQLException
     */
    @Override
    public Information findInformationById(Integer iId) throws SQLException {
        Information informationById = backgroundMapper.findInformationById(iId);
        return informationById;
    }

    /**
     * 根据ID删除information
     * @param iId   要删除资讯的ID
     * @throws SQLException
     */
    @Override
    public void deleteInformationById(HttpServletRequest request,Integer iId) throws SQLException {

        //被删除的资讯
        Information informationById = backgroundMapper.findInformationById(iId);
        //删除附件
        if (informationById.getIadjunctName() != null){
            //路径
            String realPath = request.getServletContext().getRealPath("/") + File.separator + UPLOAD_DIRECTORY;
            //文件名
//        File file = new File(realPath);
            String filename = informationById.getIadjunctName();
            File fileTemp = new File(realPath + "\\" + filename);
            // 判断文件是否存在
            boolean falg = false;
            falg = fileTemp.exists();
            if (falg) {
                fileTemp.delete();
            }

        }

        backgroundMapper.deleteInformationById(iId);
    }

    /**
     * 根据ID修改资讯信息
     * @param information 被修改后的资讯保存到数据库中
     * @throws SQLException
     */
    @Override
    public void modifyInformationById(Information information) throws SQLException {
        backgroundMapper.modifyInformationById(information);
    }

    /**
     * 分页查询
     * @param hashMap map集合放入开始条数，查询行数,如0,10
     * @return
     * @throws SQLException
     */
    @Override
    public List<Information> findInformationByPage(HashMap hashMap) throws SQLException {
        List<Information> informationByPage = backgroundMapper.findInformationByPage(hashMap);
        return informationByPage;
    }

    /**
     * 查询总条数
     * @return  资讯总条数
     * @throws SQLException
     */
    @Override
    public Integer totalByInformation() throws SQLException {
        Integer integer = backgroundMapper.totalByInformation();
        return integer;
    }

    /**
     * 添加网站
     * @param file
     * @param request
     * @param response
     * @param webSites
     * @return
     * @throws SQLException
     */
    @Override
    public ModelAndView setWebSite(MultipartFile file, HttpServletRequest request, HttpServletResponse response, WebSites webSites) throws SQLException {
        ModelAndView modelAndView = new ModelAndView();

        try {
            //上传后的地址，注意("/upload")是表示文件上传后的目标文件夹

//            String realPath = request.getSession().getServletContext().getRealPath("/upload");
            String realPath = request.getServletContext().getRealPath("/") + File.separator + UPLOAD_WEBSITEPIC;
            System.out.println("打印文件上传的路径"+realPath);

            //获取图片名

            String filename = file.getOriginalFilename();

            //文件名称为空的场合,
            if (filename == null || filename == ""){
                //返回false
                response.getWriter().write("false");
                return null;
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
            webSites.setwPic(newFilename);
//            picture.setpName(newFilename);//将文件名赋值给实体类，然后一并存到数据库

            backgroundMapper.setWebSite(webSites);


            System.out.println("测试是否执行完毕");
//            modelAndView.addObject("msg","上传成功");
//            request.getSession().setAttribute("wPic",webSites.getwPic());
//            response.getWriter().write("true");
            modelAndView.setViewName("redirect:/background/findWebsites.action");
//            modelAndView.setViewName("testPic");
            return modelAndView;

        } catch (IOException e) {

            e.printStackTrace();

        }
        modelAndView.addObject("msg","上传失败");
        modelAndView.setViewName("test");

        return null;
    }

    /**
     * 查询所有网站
     * @return
     * @throws SQLException
     */
    @Override
    public ModelAndView findWebsiteAll(HttpServletRequest request) throws SQLException {
        ModelAndView modelAndView = new ModelAndView();
        List<WebSites> webSiteAll = backgroundMapper.findWebSiteAll();
        modelAndView.addObject("webSiteList",webSiteAll);
        request.getSession().setAttribute("webSiteList",webSiteAll);
        modelAndView.setViewName("index");
        return null;
    }
    @Override
    public ModelAndView findWebsites(HttpServletRequest request, PageBean pageBean) throws SQLException {
        ModelAndView modelAndView = new ModelAndView();

        String pageNumStr = request.getParameter("pageNum");
        if (pageNumStr == null){
            pageBean.setPageNum(1);
        }else {
            pageBean.setPageNum(Integer.parseInt(pageNumStr));
        }
        int rows = 10;
        pageBean.setRows(rows);
        int start = (pageBean.getPageNum() - 1) * rows;
        pageBean.setStartIndex(start);
        Integer totalRecord = backgroundMapper.getWebCount();
        pageBean.setTotalRecord(totalRecord);
        pageBean.setPages(totalRecord % rows == 0 ? totalRecord / rows : totalRecord / rows + 1);
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("startIndex",pageBean.getStartIndex());
        map.put("rows",pageBean.getRows());
        List<WebSites> informationByPage = backgroundMapper.findWebSites(map);
        pageBean.setwList(informationByPage);
        modelAndView.addObject("pb",pageBean);
        modelAndView.setViewName("findWebSites");

//        List<WebSites> webSiteAll = backgroundMapper.findWebSiteAll();
//        modelAndView.addObject("webSiteList",webSiteAll);
//        modelAndView.setViewName("findWebSites");
        return modelAndView;
    }

    /**
     * 删除网站
     * @param wId
     * @return
     * @throws SQLException
     */
    @Override
    public ModelAndView deleteWebsiteById(Integer wId) throws SQLException {
        ModelAndView modelAndView = new ModelAndView();
        backgroundMapper.deleteWebsiteById(wId);
//        modelAndView.addObject("msg","删除完成");
        modelAndView.setViewName("redirect:/background/findWebsites.action");
        return modelAndView;
    }

    /**
     * 文件下载
     * @param request
     * @param response
     * @param iadjunctName
     * @throws SQLException
     */
    @Override
    public void downLoadFile(HttpServletRequest request,HttpServletResponse response,String iadjunctName) throws SQLException {

        try {
            request.setCharacterEncoding("UTF-8");
            response.setHeader("Content-type", "text/html;charset=UTF-8");
            /**
             * 获取到要下载的文件名
             */
            String fileName = iadjunctName;
            fileName = new String(fileName.getBytes("ISO-8859-1"), "UTF-8");

            /**
             * 文件存储路径
             */
            String fileSavePath = request.getServletContext().getRealPath("/") + File.separator + UPLOAD_DIRECTORY;
            //要下载的文件
            File file = new File(fileSavePath + File.separator + fileName);
            //如果文件不存在
            if (!file.exists()){
                    response.getWriter().write("文件不存在");
                return;
            }
            //设置响应头,控制浏览器下载该文件
            response.setHeader("content-disposition","attachment;filename*=UTF-8''" + URLEncoder.encode(fileName,"UTF-8").replaceAll("\\+", "%20"));
            //读取要下载的文件,保存到文件输入流
            FileInputStream in = new FileInputStream(fileSavePath + File.separator + fileName);
            //创建输出流
            OutputStream out = response.getOutputStream();
            //创建缓冲区
            byte[] buffer = new byte[1024 * 1024];
            int len = 0;
            //循环将输入流中的内容读取到缓冲区当中
            while(0<=(len=in.read(buffer))){
                //输出缓冲区的内容到浏览器,实现文件下载
                out.write(buffer, 0, len);
            }
            //关闭文件输入输出流
            out.close();
            in.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    /**
     * 根据类别查询
     * @param iCategory
     * @return
     * @throws SQLException
     */
    @Override
    public ModelAndView findInformationByCat(HttpServletRequest request,String iCategory) throws SQLException {
        ModelAndView modelAndView = new ModelAndView();
        List<Information> informationByCat = backgroundMapper.findInformationByCat(iCategory);

        List<Information> me = findMe();
        modelAndView.addObject("meList",me);

        if (backgroundMapper.getiCatCount(iCategory) == 1){
            modelAndView.addObject("information",informationByCat);
            modelAndView.setViewName("information");
        }else {
            request.getSession().setAttribute("findByIcategory",iCategory);
            modelAndView.setViewName("redirect:/background/findMoreByIcat.action");
        }
       return modelAndView;
    }

    /**
     * 根据类别查询总数
     * @param iCategory
     * @return
     * @throws SQLException
     */
    @Override
    public Integer getiCatCount(String iCategory) throws SQLException {
        Integer integer = backgroundMapper.getiCatCount(iCategory);
        return integer;
    }

    @Override
    public ModelAndView findByPage(String iCategory,HttpServletRequest request,PageBean pageBean)throws SQLException {
        ModelAndView modelAndView = new ModelAndView();

        if ("all".equals(iCategory)){
            iCategory = "";
            request.getSession().setAttribute("iCategory",iCategory);
        }else if (iCategory == null){
            if (request.getSession().getAttribute("iCategory") == null){
                iCategory = "";
                request.getSession().setAttribute("iCategory",iCategory);
            }else {
                iCategory = String.valueOf(request.getSession().getAttribute("iCategory"));
            }
        }else {
            request.getSession().setAttribute("iCategory",iCategory);
        }

        String pageNumStr = request.getParameter("pageNum");
        if (pageNumStr == null){
            pageBean.setPageNum(1);
        }else {
            pageBean.setPageNum(Integer.parseInt(pageNumStr));
        }
        int rows = 10;
        pageBean.setRows(rows);
        int start = (pageBean.getPageNum() - 1) * rows;
        pageBean.setStartIndex(start);
        Integer totalRecord = backgroundMapper.getiCatCount(String.valueOf(request.getSession().getAttribute("iCategory")));
        pageBean.setTotalRecord(totalRecord);
        pageBean.setPages(totalRecord % rows == 0 ? totalRecord / rows : totalRecord / rows + 1);
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("startIndex",pageBean.getStartIndex());
        map.put("rows",pageBean.getRows());
        map.put("iCategory",iCategory);
        List<Information> informationByPage = backgroundMapper.findInformationByPage(map);
        pageBean.setiList(informationByPage);
        modelAndView.addObject("pb",pageBean);
        modelAndView.setViewName("manage");
        return modelAndView;
    }

    @Override
    public ModelAndView deleteFile(HttpServletRequest request,Integer iId, String iadjunctName) {
        ModelAndView modelAndView = new ModelAndView();
        //路径
        String realPath = request.getServletContext().getRealPath("/") + File.separator + UPLOAD_DIRECTORY;
        //文件名
//        File file = new File(realPath);
        String filename = iadjunctName;
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

            Integer integer = iId;

            try {
                backgroundMapper.deleteIadjunctNameBypId(integer);
                modelAndView.addObject("msg","图片信息删除成功");
                modelAndView.setViewName("redirect:/background/findInfByIdForModify.action?iId="+iId);
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
    public void modifyInformation(MultipartFile file, HttpServletRequest request, HttpServletResponse response, Information information)throws SQLException {
        boolean b = fileUpload(file,request, response);
        if (b == true) {
            String iadjunctName = (String) request.getSession().getAttribute("iadjunctName");
            information.setIadjunctName(iadjunctName);
            backgroundMapper.modifyInformationById(information);
        }
    }

    @Override
    public ModelAndView findMoreByIcat(HttpServletRequest request, PageBean pageBean)throws SQLException {
        ModelAndView modelAndView = new ModelAndView();
        String iCategory = String.valueOf(request.getSession().getAttribute("findByIcategory"));

        String pageNumStr = request.getParameter("pageNum");
        if (pageNumStr == null){
            pageBean.setPageNum(1);
        }else {
            pageBean.setPageNum(Integer.parseInt(pageNumStr));
        }
        int rows = 10;
        pageBean.setRows(rows);
        int start = (pageBean.getPageNum() - 1) * rows;
        pageBean.setStartIndex(start);
        Integer totalRecord = backgroundMapper.getiCatCount(String.valueOf(request.getSession().getAttribute("findByIcategory")));
        pageBean.setTotalRecord(totalRecord);
        pageBean.setPages(totalRecord % rows == 0 ? totalRecord / rows : totalRecord / rows + 1);
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("startIndex",pageBean.getStartIndex());
        map.put("rows",pageBean.getRows());
        map.put("iCategory",iCategory);
        List<Information> informationByPage = backgroundMapper.findInformationByPage(map);
        pageBean.setiList(informationByPage);

        List<Information> me = findMe();
        modelAndView.addObject("meList",me);

        modelAndView.addObject("iCategory",iCategory);
        modelAndView.addObject("pb",pageBean);
        modelAndView.setViewName("informationMore");
        return modelAndView;
    }

    @Override
    public boolean login(HttpServletRequest request,User user) {

        Integer userCount = backgroundMapper.getUserCount();
        Mademd5 md5 = new Mademd5();
        if (userCount == 0){
            User user1 = new User();
            user1.setuName("root");
            user1.setuPsw(md5.toMd5("root"));
            user1.setRuler("0");
            backgroundMapper.setUser(user1);
        }
        //获取到user，进行判断
        user.setuPsw(md5.toMd5(user.getuPsw()));
        User theUser = backgroundMapper.getUser(user);
        request.getSession().setAttribute("user",theUser);
        if (hasUser(request)) {
            return true;
        }else {
            return false;
        }
    }

    @Override
    public ModelAndView findUser(PageBean pageBean,HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        String pageNumStr = request.getParameter("pageNum");
        if (pageNumStr == null){
            pageBean.setPageNum(1);
        }else {
            pageBean.setPageNum(Integer.parseInt(pageNumStr));
        }
        int rows = 10;
        pageBean.setRows(rows);
        int start = (pageBean.getPageNum() - 1) * rows;
        pageBean.setStartIndex(start);
        Integer totalRecord = backgroundMapper.getUserCount();
        pageBean.setTotalRecord(totalRecord);
        pageBean.setPages(totalRecord % rows == 0 ? totalRecord / rows : totalRecord / rows + 1);
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("startIndex",pageBean.getStartIndex());
        map.put("rows",pageBean.getRows());
        List<User> user = backgroundMapper.findUser(map);
        pageBean.setuList(user);
//        User loginUser = (User) request.getSession().getAttribute("user");
//        modelAndView.addObject("user",loginUser);
        modelAndView.addObject("pb",pageBean);
        modelAndView.setViewName("findUser");
        return modelAndView;
    }

    @Override
    public ModelAndView setUser(User user) {
        ModelAndView modelAndView = new ModelAndView();

//        查看该用户是否存在
        Integer userByName = backgroundMapper.getUserByName(user);
        if (userByName >= 1){
            modelAndView.addObject("msg","该用户已存在");
            modelAndView.setViewName("addUser");
            return modelAndView;
        }

        Mademd5 mademd5 = new Mademd5();
        String s = mademd5.toMd5(user.getuPsw());
        user.setuPsw(s);
        backgroundMapper.setUser(user);
        modelAndView.setViewName("redirect:/background/findUser.action");
        return modelAndView;
    }

    @Override
    public void deleteUserById(HttpServletRequest request, Integer integer)throws SQLException {
        backgroundMapper.deleteUserById(integer);
    }

    public boolean hasUser(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        if (user != null){
            request.getSession().setAttribute("ruler",user.getRuler());
            return true;
        }else {
            return false;
        }
    }
    public boolean hasRuler(HttpServletRequest request){
        String ruler = String.valueOf(request.getSession().getAttribute("ruler"));
        if ("0".equals(ruler)){
            return true;
        }
        return false;
    }

    public boolean fileUpload(MultipartFile file, HttpServletRequest request, HttpServletResponse response){
        /**
         * 上传数据及保存文件
         */
            if (file.isEmpty()){
                return true;
            }

        //上传后的地址，注意("/upload")是表示文件上传后的目标文件夹

//            String realPath = request.getSession().getServletContext().getRealPath("/upload");
        String realPath = request.getServletContext().getRealPath("/") + File.separator + UPLOAD_DIRECTORY;
        System.out.println("打印文件上传的路径"+realPath);

        //获取文件名

        String filename = file.getOriginalFilename();

        //获取文件时间+后缀名
        // SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        //System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
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
            request.getSession().setAttribute("iadjunctName",newFilename);
            response.getWriter().write("true");
            return true;
        } catch (IOException e) {
            e.printStackTrace();
        }
//            System.out.println(dir.getPath());

        System.out.println("测试是否执行完毕");
//            modelAndView.addObject("msg","上传成功");
//            picture.setpName(newFilename);//将文件名赋值给实体类，然后一并存到数据库


        return false;
    }
    private boolean isPicture(ModelAndView modelAndView, String filename) {
        IsPicture isPicture = new IsPicture();
        try {
            boolean picture1 = isPicture.isPicture(filename, null);
            //不是图片格式
            if (picture1 == false){
                modelAndView.addObject("msg","类型错误");
                modelAndView.setViewName("test");
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
    private List<Information> findMe()throws SQLException{
        String FINDME = "联系我们";
        List<Information> informationByCat = backgroundMapper.findInformationByCat(FINDME);
        return informationByCat;
    }


}
