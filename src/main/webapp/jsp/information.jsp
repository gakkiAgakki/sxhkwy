<%--
  Created by IntelliJ IDEA.
  User: HASEE
  Date: 2019/4/30
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
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
    <link rel="Bookmark" type="image/x-icon" href="<%=path %>/img/top.ico"/>
    <link rel="icon" type="image/x-icon" href="<%=path %>/img/top.ico"/>
    <link rel="shortcut icon" type="image/x-icon" href="<%=path %>/img/top.ico"/>

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
</head>
<body>
<jsp:include page="head.jsp"/>
<%--<div class="row myRow" style="height: 90px;line-height: 90px">--%>
<div class="row myRow" style="height: 90px;line-height: 90px">
    <div class="col-md-2" style="width: 200px"></div>
    <div class="col-md-4" style="width: 900px">

        <c:forEach items="${information}" var="information">
        <div>
            <span style="font-size: 20px;font-weight: bold">
                    ${information.iCategory}
            </span>
        </div>
        <div style="text-align: center">
                <span style="font-size: 15px;font-weight: bold;line-height: 90px">
                        ${information.iTitle}
                </span>
        </div>
        </c:forEach>

    </div>
    <div class="col-md-4" style="width: 300px">
        <span>
            <span><a href="/jsp/index.jsp">首页</a>》
            <c:forEach items="${information}" var="information">
            ${information.iCategory}
            </c:forEach>
            </span>
        </span>
    </div>
</div>
<hr width="1000px" style="text-align: center;background-color: #AAAAAA;border: none;height: 1px"/>
<div class="row myRow" style="height: auto;">

    <div class="col-md-2" style="width: 200px"></div>
    <div class="col-md-4" style="width: 900px;height: 700px;overflow: auto">
        <c:forEach items="${information}" var="information">
            ${information.iBody}
            <br>
            <c:if test="${not empty information.iadjunctName}">
                <span>附件(点击下载):</span>
                <a href="/background/downLoadFile.action?downFileName=${information.iadjunctName}">
                        ${information.iadjunctName}
                </a>
            </c:if>
        </c:forEach>
    </div>
    <%--<div style="float:left;margin-top: 30px;width: 1px;height: 500px; background: darkgray;"></div>--%>
    <div style="float:left;width: 1px;height: 500px; background: linear-gradient(to bottom,red,white);"></div>

    <div class="col-md-2" style="width: 350px">
        <c:forEach items="${meList}" var="me">
            ${me.iTitle}<br>
            ${me.iBody}
        </c:forEach>
    </div>
</div>

<jsp:include page="foot.jsp"/>
</body>
</html>
