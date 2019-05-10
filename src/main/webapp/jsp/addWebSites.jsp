<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: HASEE
  Date: 2019/5/7
  Time: 9:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%
    request.setCharacterEncoding("UTF-8");
    String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";
%>
<%
    //    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    String date = format.format(new Date());
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>添加资讯</title>

    <!-- Bootstrap core CSS -->
    <script src="<%=path %>/js/jquery.min.js" type="text/javascript"></script>
    <link href="<%=path %>/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="<%=path %>/bootstrap/js/bootstrap.min.js"></script>
    <%--引入自己写的方法的js--%>
    <script src="<%=path %>/js/manage.js"></script>
    <%--轮播图的js和CSS--%>
    <script type="text/javascript" src="<%=path %>/js/jquery.bxslider.js"></script>
    <link href="<%=path %>/css/jquery.bxslider.css" rel="stylesheet" type="text/css">
    <%--页面标签栏的图标CSS--%>
    <link rel="stylesheet" href="<%=path %>/css/iconfont.css">

    <%--首页图标--%>
    <link rel="Bookmark" type="image/x-icon" href="<%=path %>/img/top.ico"/>
    <link rel="icon" type="image/x-icon" href="<%=path %>/img/top.ico"/>
    <link rel="shortcut icon" type="image/x-icon" href="<%=path %>/img/top.ico"/>
    <%--富文本编辑器的CSS与js--%>
    <link rel="stylesheet" href="<%=path%>/kindeditor/themes/default/default.css"/>
    <link rel="stylesheet" href="<%=path%>/kindeditor/plugins/code/prettify.css"/>
    <script charset="utf-8" src="<%=path%>/kindeditor/kindeditor-all.js"></script>
    <script charset="utf-8" src="<%=path%>/kindeditor/lang/zh-CN.js"></script>
    <script charset="utf-8" src="<%=path%>/kindeditor/plugins/code/prettify.js"></script>
    <style type="text/css">
        * {
            margin: 0 auto;
            padding: 0;
        }

        .myRow {
            width: 1500px;
            margin: 0 auto;
        }

        .juZhong {
            text-align: center;
            /*line-height:;*/
        }

        .btn-circle.btn-xl {
            margin-top: 30px;
            width: 90px;
            height: 90px;
            padding: 10px 16px;
            font-size: 30px;
            /*line-height: 1.33;*/
            line-height: 0.65;
            border-radius: 45px;
        }

        .btn-circle.btn-big {
            margin-top: 10px;
            width: 120px;
            height: 120px;
            padding: 10px 16px;
            font-size: 30px;
            /*line-height: 1.33;*/
            line-height: 0.65;
            border-radius: 60px;
        }
    </style>
    <script>
        <%--富文本编辑器--%>
        KindEditor.ready(function (K) {
            var editor1 = K.create('#editor_id', {
                cssPath: '<%=path%>/kindeditor/plugins/code/prettify.css',
                uploadJson: '<%=path%>/kindeditor/jsp/upload_json.jsp',
                fileManagerJson: '<%=path%>/kindeditor/jsp/file_manager_json.jsp',
                allowFileManager: true,
                afterCreate: function () {
                    var self = this;
                    K.ctrl(document, 13, function () {
                        self.sync();
                        document.forms['example'].submit();
                    });
                    K.ctrl(self.edit.doc, 13, function () {
                        self.sync();
                        document.forms['example'].submit();
                    });
                },
                afterBlur: function () {
                    this.sync();
                }
            });
            prettyPrint();
        });
    </script>
</head>
<body>
<div class="dingbu" style="width: 1519px;height: 200px;background-size: 100%">
    <img src="<%=path%>/img/big-img.png" width="100%" height="100%">
    <%--<div style="position: absolute;z-indent:2;right:20px;top:50px;width: 180px;height: 40px"><font size="4"--%>
    <%--color="white">欢迎您:${user.uName}</font>--%>
    <%--</div>--%>
    <div style="position: absolute;z-indent:2;right:20px;top:80px;width: 120px;height: 40px">
        <form action="/background/userExit.action" method="post">
            <input class="btn btn-primary" type="submit" value="退出">
            <input type="hidden" name="uName" value="${user.uName}">
        </form>
    </div>
</div>
<div style="width: 1519px;height: 50px;background: #00aeff"></div>

<div class="row" style="width: 1400px">
    <div class="col-xs-3 col-md-2 cebian" style="width: 220px;height: 750px">
        <%--<div style="z-index: 9999; position: fixed ! important; left: 0px; top: 0;">--%>
        <%--<div style="height: 200px;text-align: center">--%>
        <div style="height: 60px;width: 205px;text-align: center;line-height: 60px;background: #2aabd2">
            <font size="5" style="font-weight: bold">工作台</font>
        </div>
        <div style="height: 40px"></div>
        <%--</div>--%>
        <div class="row" style="height: 80px">
            <div class="col-xs-8 col-sm-6 col-xs-offset-3">
                <input class="btn btn-primary btn-lg" type="submit" style="width: 100px" value="查看资讯"
                       onclick="findInformation()">
            </div>
        </div>
        <div class="row" style="height: 80px">
            <div class="col-xs-8 col-sm-6 col-xs-offset-3">
                <input class="btn btn-primary btn-lg" type="submit" style="width: 100px" value="添加资讯"
                       onclick="addinformation()">
            </div>
        </div>
        <div class="row" style="height: 80px">
            <div class="col-xs-8 col-sm-6 col-xs-offset-3" style="text-align: center">
                <input class="btn btn-primary btn-lg" type="submit" style="width: 100px" value="查看网站"
                       onclick="findWebSites()">
            </div>
        </div>
        <div class="row" style="height: 80px">
            <div class="col-xs-8 col-sm-6 col-xs-offset-3">
                <input class="btn btn-primary btn-lg" type="submit" style="width: 100px" value="添加网站"
                       onclick="addWebSite()">
            </div>
        </div>
        <c:if test="${user.ruler != 1}">
            <div class="row" style="height: 80px">
                <div class="col-xs-8 col-sm-6 col-xs-offset-3" style="text-align: center">
                    <input class="btn btn-primary btn-lg" type="submit" style="width: 100px" value="查看用戶"
                           onclick="findUser()">
                </div>
            </div>

            <div class="row" style="height: 80px">
                <div class="col-xs-8 col-sm-6 col-xs-offset-3" style="text-align: center">
                    <input class="btn btn-primary btn-lg" type="submit" style="width: 100px" value="添加用戶"
                           onclick="addUser()">
                </div>
            </div>
        </c:if>
        <%--<div class="row" style="height: 80px">--%>
        <%--<div class="col-xs-8 col-sm-6 col-xs-offset-3">--%>
        <%--<input class="btn btn-primary" type="button" style="width: 100px;height: 40px" value="删除选中资讯"--%>
        <%--onclick="delInformations()">--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</div>--%>
    </div>
    <div class="col-xs-10 col-md-10">
        <form class="form-signin" id="addWebSites" action="/background/setWebsite.action" method="post"
              enctype="multipart/form-data">
            <%--<h2 class="form-signin-heading">留言板</h2>--%>
            <%--<table style="text-align: center" width="100%"  class="table table-striped table-bordered">--%>
            <%--<tr>--%>
            <%--<td style="width: 150px">标题</td>--%>
            <div class="row">
                <%--<td>--%>
                <label for="wURL" style="line-height: 40px;width: 70px" class="col-sm-1">网址:</label>
                <div class="col-sm-11">
                    <input style="width: 500px;height: 40px" id="wURL" type="text" name="wURL" class="form-control"
                           placeholder="路径" required autofocus>
                    例:<input type="text" style="width: 500px;height: 40px" class="form-control" value="www.baidu.com" disabled>
                </div>
                <%--</td>--%>
                <%--<td>时间</td>--%>
            </div>
            <%--<td>--%>
            <div class="row">
                <label for="wExplain" style="line-height: 40px;width: 70px" class="col-sm-1">说明:</label>
                <div class="col-sm-10">
                    <input style="width: 500px;height: 40px" id="wExplain" type="text" name="wExplain"
                           class="form-control" placeholder="网站说明" required autofocus>
                </div>
            </div>

            <tr>
                <td>
                    <div class="row">
                        <label for="wPic" style="line-height: 40px;width: 70px" class="col-sm-1">图片:</label>
                        <div class="col-sm-11">
                            <input style="width: 300px;height: 40px" id="wPic" type="file" name="websitePic"
                                   value="上传图片" class="form-control" placeholder="图片" autofocus>
                            <%--<input type="text" class="form-control" value="展示大小为width:240px;height:270px" disabled>--%>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
        </form>
        <script type="text/javascript">
            function addWebSites() {

                var title = document.getElementById("wURL").value;
                if (title == null || title == '') {
                    alert("路径不能为空！");
                    return false;
                }
                var date = document.getElementById("wExplain").value;
                if (date == null || date == '') {
                    alert("说明不能为空！");
                    return false;
                }
                var editor_id = document.getElementById("wPic").value;
                if (editor_id == null || editor_id == '') {
                    alert("图片不能为空！");
                    return false;
                }

                document.getElementById("addWebSites").submit();
            }
        </script>
        <input type="submit" style="height: 40px;width: 100px" class="btn btn-info" onclick="return addWebSites()"
               value="添加网站">

    </div>
</div>
</body>
</html>
<%!
    private String htmlspecialchars(String str) {
        str = str.replaceAll("&", "&amp;");
        str = str.replaceAll("<", "&lt;");
        str = str.replaceAll(">", "&gt;");
        str = str.replaceAll("\"", "&quot;");
        return str;
    }
%>