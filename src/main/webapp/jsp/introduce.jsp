<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<meta name="description" content="">
<meta name="author" content="">

<title>查看信息</title>

<!-- Bootstrap core CSS -->
<script src="<%=path %>/js/jquery.min.js" type="text/javascript"></script>
<link href="<%=path %>/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="<%=path %>/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript" src="<%=path %>/js/jquery.bxslider.js"></script>
<link href="<%=path %>/css/jquery.bxslider.css" rel="stylesheet" type="text/css">

<link rel="stylesheet" href="<%=path %>/css/iconfont.css">

<%--首页图标--%>
<link rel="Bookmark" type="image/x-icon" href="<%=path %>/img/top.ico" />
<link rel="icon" type="image/x-icon" href="<%=path %>/img/top.ico" />
<link rel="shortcut icon" type="image/x-icon" href="<%=path %>/img/top.ico" />

<style type="text/css">
    *{
        margin: 0 auto;
        padding: 0;
    }
    .myRow{
        width: 1500px;
        margin: 0 auto;
    }
    .juZhong{
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
