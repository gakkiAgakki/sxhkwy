<%--
  Created by IntelliJ IDEA.
  User: HASEE
  Date: 2019/4/30
  Time: 16:02
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<meta name="description" content="">
<meta name="author" content="">

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

</head>
<body>
<div class="row myRow" style="height: 20px"></div>
<hr width="1400px" style="text-align: center;background-color: red;border: none;height: 1px"/>
<div class="row myRow" style="height: 20px;line-height: 20px;text-align: center">
    <div style="width: 220px" class="col-md-2">
    </div>
    <div style="width: 180px" class="col-md-2">
        <form action="/background/findInformationByCat.action" method="post">
            <input type="hidden" name="iCategory" value="软件开发">
            <button type="submit" style="width: 90px;height: 30px;border: none" class="btn btn-default ">
                <span>软件开发</span>
            </button>
        </form>
    </div>
    <div style="width: 180px" class="col-md-2">
        <form action="/background/findInformationByCat.action" method="post">
            <input type="hidden" name="iCategory" value="物联网开发">
            <button type="submit" style="width: 90px;height: 30px;border: none" class="btn btn-default ">
                <span>物联网开发</span>
            </button>
        </form>
    </div>
    <div style="width: 180px" class="col-md-2">
        <form action="/background/findInformationByCat.action" method="post">
            <input type="hidden" name="iCategory" value="系统集成">
            <button type="submit" style="width: 90px;height: 30px;border: none" class="btn btn-default ">
                <span>系统集成</span>
            </button>
        </form>
    </div>
    <div style="width: 180px" class="col-md-2">
        <form action="/background/findInformationByCat.action" method="post">
            <input type="hidden" name="iCategory" value="人才培育">
            <button type="submit" style="width: 90px;height: 30px;border: none" class="btn btn-default ">
                <span>人才培育</span>
            </button>
        </form>
    </div>
    <div style="width: 180px" class="col-md-2">
        <form action="/background/findInformationByCat.action" method="post">
            <input type="hidden" name="iCategory" value="最新资讯">
            <button type="submit" style="width: 90px;height: 30px;border: none" class="btn btn-default ">
                <span>最新资讯</span>
            </button>
        </form>
    </div>
    <div style="width: 180px" class="col-md-2">
        <form action="/background/findInformationByCat.action" method="post">
            <input type="hidden" name="iCategory" value="联系我们">
            <button type="submit" style="width: 90px;height: 30px;border: none" class="btn btn-default ">
                <span>联系我们</span>
            </button>
        </form>
    </div>
</div>
<hr style="text-align: center;height: 1px;border: none;background-color: #ff666666"/>
<div class="row myRow" style="height: 20px;line-height: 20px;text-align: center">
    <%--<div>--%>
        <span>Copyright2019山西浩科伟业</span>
    <%--</div>--%>
</div>
<div class="row myRow" style="height: 20px">
    <div style="height: 50px;text-align: center;background-color: black">
        <span style="color: white;line-height: 50px">山西浩科伟业科技有限公司</span>
    </div>
</div>

</body>
</html>
