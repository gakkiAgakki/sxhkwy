<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: HASEE
  Date: 2019/4/23
  Time: 16:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/ajaxfileupload.js"></script>
    <title>测试</title>
    <%
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date= format.format(new Date());
    %>
    <script>
        function getInformationTotal() {

                location.href="${pageContext.request.contextPath}/background/totalByInformation.action";

        }
    </script>
    <script type="text/javascript">
        function tijiao() {
//            if (document.getElementById("pic").submit()){
//                return true;
//            }else {
//                return false;
//                alert("失败");
//            }


            $.ajaxFileUpload({  //Jquery插件上传文件
                url: '/pic/upload.action',
                secureuri: false,//是否启用安全提交  默认为false
                type:'POST',
                fileElementId: "file", //type="file"的id
                dataType: "json",  //返回值类型
//                dataType: 'html',
//                contentType : "application/json",
                success: function (flag) {
                    if (flag == false){
                        alert("图片上传失败");
                        return false;
                    }else {
                        document.getElementById("information").submit();//表单提交
                    }

                },
                error:function () {
                    alert("Ajax,error");
                    return;
                }

            });
        }

    </script>
</head>
<body>

    <form action="/pic/uploadPic.action" id="pic" method="post" enctype="multipart/form-data">
        <label>图片名：</label><input type="text" name="pName"><br>
        <label>上传图片：</label><input type="file" name="uploadPic" value="上传图片"><br>
        <input type="submit">
    </form>
    <HR align=1000 width=1400 color=#987cb9 SIZE=1>
    <form action="/background/addInformation.action" method="post" enctype="multipart/form-data" id="information">
        <input type="text" name="iTitle" />
        <input type="text" name="iDate" value="<%=date%>"/>
        <input type="text" name="iBody"/><br>
        图片：<input id="file" type="file" name="uploadFilePic" value="上传图片">
        文件:<input id="fileUpload" type="file" name="fileUpload">
        <select id="iCategory" name="iCategory">
            <option value="0">请选择所属分类</option>
            <option value="10">查看全部</option>
            <option value="软件开发">软件开发</option>
            <option value="物联网开发">物联网开发</option>
            <option value="系统集成">系统集成</option>
            <option value="人才培育">人才培育</option>
            <option value="公司简介">公司简介</option>
            <option value="最新资讯">最新资讯</option>
            <option value="资质证书">资质证书</option>
            <option value="核心优势">核心优势</option>
            <option value="精确定位">精确定位</option>
        </select>
    </form>

    <input type="button" value="资讯提交" onclick="return tijiao()">

    <HR align=1000 width=1400 color=#987cb9 SIZE=1>
    <form action="/pic/findAll.action">
        <input type="submit" value="查询全部图片及名称">
    </form>
    <c:forEach items="${pic}" var="pic">
        <tr>
            <td><input name="pName" style="width: 100px;height: 100px" value="${pic.pName}"></td>
            <%--<td><img src="http://localhost:8080/upload/${pic.pPath}" style="width: 100px;height: 100px" name="pPath"></td>--%>
            <td><img src="/upload/${pic.pPath}" style="width: 100px;height: 100px" name="pPath"></td>
        </tr>
    </c:forEach>
    <HR align=1000 width=1400 color=#987cb9 SIZE=1>
    <form action="/background/findAllInformation" method="post">
        <input type="submit" value="查看全部资讯">
    </form>
    ${informationList}
    <HR align=1000 width=1400 color=#987cb9 SIZE=1>
    <form action="/background/findInformationById.action" method="post">
        根据ID查询<input type="text" name="iId" value="${information.iId}"><br>
        <input type="submit" value="根据ID查询"><br>
    </form>
    <HR align=1000 width=1400 color=#987cb9 SIZE=1>
    <form action="/background/totalByInformation.action" method="post">
        总共${total}条；
        <input type="submit" value="总共多少条">
    </form>
    <HR align=1000 width=1400 color=#987cb9 SIZE=1>


    <form action="/background/modifyInformationById.action" method="post">
            <input type="hidden" name="iId" value="${information.iId}">
            标题:<input name="iTitle" value="${information.iTitle}">
            时间:<input name="iDate" value="${information.iDate}">
            主体:<input name="iBody" value="${information.iBody}">
            分类:<input name="iCategory" value="${information.iCategory}">
            图片:<img src="/upload/${information.iPictureName}" style="width: 100px;height: 100px">
            附件:<a href="/background/downLoadFile.action?downFileName=${information.iadjunctName}">${information.iadjunctName} </a><br>
        <input type="submit" value="修改">
    </form>
    <HR align=1000 width=1400 color=#987cb9 SIZE=1>
    <form action="/background/deleteInformationById.action" method="post">
        <input type="hidden" name="iId" value="${information.iId}">
        <input name="iTitle" value="${information.iTitle}">
        <input name="iDate" value="${information.iDate}">
        <input name="iBody" value="${information.iBody}">
        <input type="submit" value="删除">
    </form>
    <HR align=1000 width=1400 color=#987cb9 SIZE=1>
    <form action="/background/findInformationByPage.action" method="post">
        从第<input type="text" name="startIndex" value="${startIndex}">条开始<br>
        查询<input type="text" name="rows" value="${rows}">条
        <input type="submit" value="查询">
    </form>
    <HR align=1000 width=1400 color=#987cb9 SIZE=1>
    <form action="/pic/findPicBypId.action" method="post">
        ${msg}
        <input type="text" name="pId" value=" ${picture.pId}">
        <input type="submit" value="查询图片">
    </form>
    <HR align=1000 width=1400 color=#987cb9 SIZE=1>
    <form name="form1" action="/pic/modifyPicBypId.action" method="post" enctype="multipart/form-data">
        <input type="text" name="pName" value="${picture.pName}">
        <img src="/upload/${picture.pPath}" style="width: 100px;height: 100px">
        <input type="file" name="uploadFile" id="picpath" style="display:none;" onChange="document.form1.path.value=this.value"> 
        <input name="path" readonly>
        <input type="button" value="更换图片" onclick="document.form1.uploadFile.click()">
        <%--<input type="file" name="uploadFile" value="更换图片">--%>
        <input type="hidden" name="pPath" value="${picture.pPath}">
        <input type="hidden" name="pId" value="${picture.pId}">
        <input type="submit" value="提交">
    </form>
    <HR align=1000 width=1400 color=#987cb9 SIZE=1>
    <form action="/pic/delete.action" method="post">
        <input type="text" name="pId" value=" ${picture.pId}">
        <img src="/upload/${picture.pPath}" style="width: 100px;height: 100px">
        <input type="hidden" name="pPath" value="${picture.pPath}">
        <input type="submit" value="删除图片">
    </form>
    <HR align=1000 width=1400 color=#987cb9 SIZE=1>
    <form action="/background/setWebsite.action" method="post"  enctype="multipart/form-data">
        网址:<input type="text" name="wURL" /><br>
        说明:<input type="text" name="wExplain"/><br>
        图片：<input  type="file" name="websitePic" value="上传图片">
            <input type="submit" value="提交">
    </form>
    <HR align=1000 width=1400 color=#987cb9 SIZE=1>
    <form action="/background/findWebsiteAll.action" method="post">
        <input type="submit" value="查看所有网站">
    </form>
    <HR align=1000 width=1400 color=#987cb9 SIZE=1>
    <%--<form action="/background/deleteWebsiteById.action" method="post">--%>
        <c:forEach items="${webSiteList}" var="webSite">
            <tr>
                <%--<td><input type="hidden" name="wId" value="${webSite.wId}"></td>--%>
                <td><input name="wURL" style="width: 100px;height: 100px" value="${webSite.wURL}"></td>
                <td><input name="wExplain" style="width: 100px;height: 100px" value="${webSite.wExplain}"></td>
                    <%--<td><img src="http://localhost:8080/upload/${pic.pPath}" style="width: 100px;height: 100px" name="pPath"></td>--%>
                <td><a href="http://${webSite.wURL}" target="_blank"><img src="/websitesPic/${webSite.wPic}" style="width: 100px;height: 100px" name="pPath"></a></td>
                <td><form action="/background/deleteWebsiteById.action" method="post">
                    <input type="hidden" name="wId" value="${webSite.wId}">
                    <input type="submit" value="删除网站">
                </form> </td>

            </tr>
        </c:forEach>
    ${msg}
    <%--</form>--%>
</body>
</html>
