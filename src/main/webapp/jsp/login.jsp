<%--
  Created by IntelliJ IDEA.
  User: HASEE
  Date: 2019/4/4
  Time: 11:56
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>登陆</title>
    <!-- Bootstrap core CSS -->
    <script src="<%=path %>/js/jquery.min.js" type="text/javascript"></script>
    <link href="<%=path %>/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="<%=path %>/bootstrap/js/bootstrap.min.js"></script>

    <%--首页图标--%>
    <link rel="Bookmark" type="image/x-icon" href="<%=path %>/img/top.ico"/>
    <link rel="icon" type="image/x-icon" href="<%=path %>/img/top.ico"/>
    <link rel="shortcut icon" type="image/x-icon" href="<%=path %>/img/top.ico"/>

    <style type="text/css">
        .login{
            position: absolute;
            left: 880px;
            top: 240px;
        }
        body{
            /*background-image: url();*/
            /*background-size:cover;*/
            <%--background: url("<%=path %>/img/big-img.png")no-repeat;--%>
            background: url("<%=path %>/img/big-img.png")repeat-x;
        }
    </style>

</head>

<body>
    <div class="login">
        <form class="form-signin" id="form1" action="/background/login.action" method="post">
            <%--<h2 class="form-signin-heading">留言板</h2>--%>
            <label for="uName" class="sr-only">用户名</label>
            <input style="width: 300px;height: 40px" type="text" id="uName" name="uName" class="form-control" placeholder="用户名" required autofocus>
            <label for="uPsw" class="sr-only">密码</label>
            <input style="width: 300px;height: 40px" type="password" id="uPsw" name="uPsw" class="form-control" placeholder="密码" required>
        </form>
        ${msg}<br>
        <script type="text/javascript">
            function chongZhi() {
            window.location.reload(true);
            }
            function login() {
                document.getElementById("form1").submit();
            }
        </script>
        <input type="submit" style="height: 40px;width: 100px" class="btn btn-info" onclick="chongZhi()"  value="重置"/>
        <input id="login" type="submit" style="height: 40px;width: 100px" class="btn btn-info" onclick="login()" value="登录">
    </div>
</body>
</html>
