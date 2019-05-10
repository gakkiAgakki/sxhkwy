<%--
  Created by IntelliJ IDEA.
  User: HASEE
  Date: 2019/4/30
  Time: 15:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <%--<title>Title</title>--%>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <title>山西浩科伟业科技有限公司</title>
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
        <script type="text/javascript">
            function over(obj){
                obj.style.backgroundColor="red";
                obj.style.color="white";
            }
            function out(obj){
                obj.style.backgroundColor="";
                obj.style.color="";
            }
            function webSitesLoad() {

//            location.href = "/background/findWebsiteAll.action";


                $.ajax({
                    type: "post",
                    url: "/background/findWebsiteAll.action",
//                data: {},
//                dataType: "json",
                    success: function(){
//                    window.location.reload();
//                    alert("true");

                        url = location.href; //把当前页面的地址赋给变量 url
//                    var times = url.split("?"); //分切变量 url 分隔符号为 "?"
//                    if(times[1] != 1){ //如果?后的值不等于1表示没有刷新
//                        url += "?1"; //把变量 url 的值加入 ?1
//                        self.location.replace(url); //刷新页面
//                    }
                        if( url.indexOf("Fresh=") <1 ){
                            if( url.indexOf("?") <1 ){
                                url = url+"?Fresh="+(Math.floor(Math.random()*100000000+100000000) );
                            }else{
                                url = url+"&Fresh="+(Math.floor(Math.random()*100000000+100000000) );
                            }
                            self.location.replace(url);
                        }

                    },
//                error: function () {
//                    alert("false");
//                }
                });
            }
        </script>
<%--<%@ include file="introduce.jsp"%>--%>
</head>
<body>
    <div class="row myRow" style="height: 80px">
        <div class="col-xs-6 juZhong" style="line-height: 80px">
            <img src="<%=path %>/img/top-left.png">
        </div>
        <div class="col-xs-6 juZhong" style="line-height: 80px">
            <div class="col-xs-1 juZhong" style="width: 106px">
                <a href="/jsp/index.jsp">
                <button type="submit" style="width: 106px" class="btn btn-default btn-lg"  onmousemove="over(this);" onmouseout="out(this);">首页</button>
                </a>
            </div>
            <div class="col-xs-1 juZhong" style="width: 106px;">
                <form action="/background/findInformationByCat.action" method="post">
                    <input type="hidden" name="iCategory" value="业务方向">
                    <button type="submit" class="btn btn-default btn-lg" onmousemove="over(this);" onmouseout="out(this);">业务方向</button>
                </form>
            </div>
            <div class="col-xs-1 juZhong" style="width: 106px;">
                <form action="/background/findInformationByCat.action" method="post">
                    <input type="hidden" name="iCategory" value="项目案例">
                    <button type="submit" class="btn btn-default btn-lg"  onmousemove="over(this);" onmouseout="out(this);">项目案例</button>
                </form>
            </div>
            <div class="col-xs-1 juZhong" style="width: 106px;">
                <form action="/background/findInformationByCat.action" method="post">
                    <input type="hidden" name="iCategory" value="最新资讯">
                    <button type="submit" class="btn btn-default btn-lg"  onmousemove="over(this);" onmouseout="out(this);">最新资讯</button>
                </form>
            </div>
            <div class="col-xs-1 juZhong" style="width: 106px;">
                <form action="/background/findInformationByCat.action" method="post">
                    <input type="hidden" name="iCategory" value="联系我们">
                    <button type="submit" class="btn btn-default btn-lg"  onmousemove="over(this);" onmouseout="out(this);">联系我们</button>
                </form>
            </div>
        </div>
    </div>
    <div class="row myRow" style="height: 260px;text-align: center">
        <div class="col-xs-12 juZhong">
            <img src="<%=path %>/img/big-img.png" width="100%" height="100%">
        </div>
    </div>
</body>
</html>
