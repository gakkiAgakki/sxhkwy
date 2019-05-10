<%--
  Created by IntelliJ IDEA.
  User: HASEE
  Date: 2019/4/23
  Time: 10:19
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
</head>
<body onload="return webSitesLoad()">
    <div class="row myRow" style="height: 80px">
        <div class="col-xs-6 juZhong" style="line-height: 80px">
            <img src="<%=path %>/img/top-left.png">
        </div>
        <div class="col-xs-6 juZhong" style="line-height: 80px">
            <div class="col-xs-1 juZhong" style="width: 106px">
            <button type="submit" style="width: 106px" class="btn btn-default btn-lg"  onmousemove="over(this);" onmouseout="out(this);">首页</button>
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
    <div class="row myRow" style="height: 627px">
        <div class="col-xs-12">
            <img src="<%=path %>/img/big-img.png" width="100%" height="100%">
        </div>
    </div>
    <div class="row myRow">
        <div class="col-xs-12" style="height: 205px">
            <img src="<%=path %>/img/development.png" width="100%" height="100%">
        </div>
    </div>
    <div class="row myRow" style="height: 275px">
        <div class="col-xs-12">
            <div class="row">
                <div style="width: 300px" class="col-md-1"></div>
                <div style="width: 300px" class="col-md-2">
                    <div>
                        <%--<img src="img/xiangmulixiang.png">--%>
                            <form action="/background/findInformationByCat.action" method="post">
                                <input type="hidden" name="iCategory" value="项目立项">
                            <button type="submit" style="height: 85px;" class="btn btn-default btn-lg btn-block" onmousemove="over(this);" onmouseout="out(this);">
                                <%--<span class="glyphicon glyphicon-star-empty" aria-hidden="true" style="font-size: 50px;float: left"></span>--%>
                                <span class="iconfont icon-deng" aria-hidden="true" style="font-size: 50px;float: left"></span>
                                <span style="float: left">项目立项</span>
                                <br>
                                <span style="font-size: 13px;float: right">确定软件的开发目标及其可行性</span>
                            </button>
                            </form>
                    </div>
                    <div style="height: 10px"></div>
                    <div>
                        <%--<img src="img/xuqiufenxi.png">--%>
                            <form action="/background/findInformationByCat.action" method="post">
                                <input type="hidden" name="iCategory" value="需求分析">
                            <button type="submit" style="height: 85px;" class="btn btn-default btn-lg btn-block" onmousemove="over(this);" onmouseout="out(this);">
                                <%--<span class="glyphicon glyphicon-star-empty" aria-hidden="true" style="font-size: 50px;float: left"></span>--%>
                                <span class="iconfont icon-gongju" aria-hidden="true" style="font-size: 50px;float: left"></span>
                                <span style="float: left">需求分析</span>
                                <br>
                                <span style="font-size: 13px;float: left">对各个功能做详细需求分析</span>
                            </button>
                            </form>
                    </div>
                    <div style="height: 10px"></div>
                    <div>
                        <%--<img src="img/ruanjiansheji.png">--%>
                            <form action="/background/findInformationByCat.action" method="post">
                                <input type="hidden" name="iCategory" value="软件设计">
                            <button type="submit" style="height: 85px;" class="btn btn-default btn-lg btn-block" onmousemove="over(this);" onmouseout="out(this);">
                                <%--<span class="glyphicon glyphicon-star-empty" aria-hidden="true" style="font-size: 50px;float: left"></span>--%>
                                <span class="iconfont icon-shejishi1" aria-hidden="true" style="font-size: 50px;float: left"></span>
                                <span style="float: left">软件设计</span>
                                <br>
                                <span style="font-size: 13px;float: left">对整个软件系统进行设计</span>
                            </button>
                            </form>
                    </div>
                </div>
                <div style="width: 300px" class="col-md-2">
                    <img src="<%=path %>/img/tuBiao.png" height="100%" width="100%">
                </div>
                <div style="width: 300px" class="col-md-2">
                    <div>
                        <%--<img src="img/chengxubianma.png">--%>
                            <form action="/background/findInformationByCat.action" method="post">
                                <input type="hidden" name="iCategory" value="程序编码">
                            <button type="submit" style="height: 85px;" class="btn btn-default btn-lg btn-block" onmousemove="over(this);" onmouseout="out(this);">
                                <%--<span class="glyphicon glyphicon-star-empty" aria-hidden="true" style="font-size: 50px;float: left"></span>--%>
                                <span class="iconfont icon-bianma" aria-hidden="true" style="font-size: 50px;float: left"></span>
                                <span style="float: left">程序编码</span>
                                <br>
                                <span style="font-size: 12px;float: left">将界面转为电脑可运行的程序编码</span>
                            </button>
                            </form>
                    </div>
                    <div style="height: 10px"></div>
                    <div>
                        <%--<img src="img/ruanjianceshi.png">--%>
                            <form action="/background/findInformationByCat.action" method="post">
                                <input type="hidden" name="iCategory" value="软件测试">
                            <button type="submit" style="height: 85px;" class="btn btn-default btn-lg btn-block" onmousemove="over(this);" onmouseout="out(this);">
                                <%--<span class="glyphicon glyphicon-star-empty" aria-hidden="true" style="font-size: 50px;float: left"></span>--%>
                                <span class="iconfont icon-ceshi" aria-hidden="true" style="font-size: 50px;float: left"></span>
                                <span style="float: left">软件测试</span>
                                <br>
                                <span style="font-size: 12px;float: left">软件完成后，发现问题和纠正</span>
                            </button>
                            </form>
                    </div>
                    <div style="height: 10px"></div>
                    <div>
                        <%--<img src="img/fabushangshi.png">--%>
                            <form action="/background/findInformationByCat.action" method="post">
                                <input type="hidden" name="iCategory" value="发布上市">
                            <button type="submit" style="height: 85px;" class="btn btn-default btn-lg btn-block" onmousemove="over(this);" onmouseout="out(this);">
                                <%--<span class="glyphicon glyphicon-star-empty" aria-hidden="true" style="font-size: 50px;float: left"></span>--%>
                                <span class="iconfont icon-zhifeiji" aria-hidden="true" style="font-size: 50px;float: left"></span>
                                <span style="float: left">发布上市</span>
                                <br>
                                <span style="font-size: 12px;float: left">整理资料，放心上市</span>
                            </button>
                            </form>
                    </div>
                </div>
                <div style="width: 200px" class="col-md-1"></div>
            </div>
        </div>
    </div>
    <div class="row myRow">
        <div class="col-xs-12">
            <div class="row" style="height: 200px">
                <div style="width: 300px" class="col-md-1"></div>
                <div style="width: 300px;text-align: center;" class="col-md-2">
                    <form action="/background/findInformationByCat.action" method="post">
                        <input type="hidden" name="iCategory" value="精确定位">
                    <button type="submit" style="text-align: center" class="btn btn-default btn-circle btn-xl"  onmousemove="over(this);" onmouseout="out(this);">
                        <%--<span class="iconfont icon-bazi" aria-hidden="true" style="font-size: 80px"></span>--%>
                        <span class="iconfont icon-bazi" aria-hidden="true" style="font-size: 80px;margin-left: -10px"></span>
                    </button>
                    </form>
                    <br>
                    <span>精确定位</span>
                    <br>
                    <span style="line-height: 3">深入了解项目需求，提炼关键</span>
                    <%--<img src="..." alt="..." class="img-circle">--%>
                </div>
                <div style="width: 300px;text-align: center;" class="col-md-2">
                    <form action="/background/findInformationByCat.action" method="post">
                        <input type="hidden" name="iCategory" value="精确定位">
                    <button type="submit" style="text-align: center" class="btn btn-default btn-circle btn-xl"  onmousemove="over(this);" onmouseout="out(this);">
                        <%--<span class="iconfont icon-bazi" aria-hidden="true" style="font-size: 80px"></span>--%>
                        <span class="iconfont icon-bazi" aria-hidden="true" style="font-size: 80px;margin-left: -10px"></span>
                    </button>
                    </form>
                    <br>
                    <span>精确定位</span>
                    <br>
                    <span style="line-height: 3">深入了解项目需求，提炼关键</span>
                    <%--<img src="..." alt="..." class="img-circle">--%>
                </div>
                <div style="width: 300px;text-align: center;" class="col-md-2">
                    <form action="/background/findInformationByCat.action" method="post">
                        <input type="hidden" name="iCategory" value="精确定位">
                    <button type="submit" style="text-align: center" class="btn btn-default btn-circle btn-xl"  onmousemove="over(this);" onmouseout="out(this);">
                        <%--<span class="iconfont icon-bazi" aria-hidden="true" style="font-size: 80px"></span>--%>
                        <span class="iconfont icon-bazi" aria-hidden="true" style="font-size: 80px;margin-left: -10px"></span>
                    </button>
                    </form>
                    <br>
                    <span>精确定位</span>
                    <br>
                    <span style="line-height: 3">深入了解项目需求，提炼关键</span>
                    <%--<img src="..." alt="..." class="img-circle">--%>
                </div>
                <div style="width: 300px" class="col-md-1"></div>
            </div>
        </div>
    </div>
    <div class="row myRow">
        <div class="col-xs-12" style="height: 280px">
            <div class="slider9" style="height: 280px">
                <c:forEach items="${webSiteList}" var="webSite">
                    <%--<div class="slide"><a href="http://${webSite.wURL}" style="width: 240px;height: 270px" target="_blank"><img src="/websitesPic/${webSite.wPic}"style="width: 240px;height: 270px" name="pPath"></a></div></td>--%>
                    <div style="width: 240px; height: 270px; float: left; list-style: none; position: relative; margin-right: 10px;">
                        <a href="http://${webSite.wURL}" style="width: 240px;height: 270px" target="_blank">
                            <img src="/websitesPic/${webSite.wPic}"style="width: 240px;height: 270px" alt="#" name="pPath">
                            <%--<span style="position: absolute;top: 250px;">${webSite.wExplain}</span>--%>
                        </a>
                    </div>
                </c:forEach>
            </div>
            <script type="text/javascript">
                $(document).ready(function(){
                    $('.slider9').bxSlider({
                        slideWidth: 1500,
                        minSlides: 6,
                        maxSlides: 6,
                        ticker: true,
//                        speed: 12000,
                        speed: 30000,
                        startSlides: 0,
                        slideMargin: 10
                    });
                });
            </script>
        </div>
    </div>
    <div class="row"></div>
    <div class="row myRow">
        <div class="col-xs-12" style="height: 205px">
            <img src="<%=path %>/img/yewufangxiang.png" width="100%" height="100%">
        </div>
    </div>
    <div class="row myRow">
        <div class="col-xs-12">
            <div style="width: 250px" class="col-md-2">
            </div>
            <div style="width: 250px;text-align: center" class="col-md-2">
                <form action="/background/findInformationByCat.action" method="post">
                    <input type="hidden" name="iCategory" value="软件开发">
                <button type="submit" style="text-align: center" class="btn btn-default btn-circle btn-big"  onmousemove="over(this);" onmouseout="out(this);">
                    <span class="iconfont icon-wenjian1" aria-hidden="true" style="font-size: 90px;margin-left: -2px"></span>
                </button>
                </form>
                <br>
                <span>软件开发</span>
            </div>
            <div style="width: 250px;text-align: center" class="col-md-2">
                <form action="/background/findInformationByCat.action" method="post">
                    <input type="hidden" name="iCategory" value="物联网开发">
                <button type="submit" style="text-align: center" class="btn btn-default btn-circle btn-big"  onmousemove="over(this);" onmouseout="out(this);">
                    <span class="iconfont icon-wenjian1" aria-hidden="true" style="font-size: 90px;margin-left: -2px"></span>
                </button>
                </form>
                <br>
                <span>物联网开发</span>
            </div>
            <div style="width: 250px;text-align: center" class="col-md-2">
                <form action="/background/findInformationByCat.action" method="post">
                    <input type="hidden" name="iCategory" value="系统集成">
                <button type="submit" style="text-align: center" class="btn btn-default btn-circle btn-big"  onmousemove="over(this);" onmouseout="out(this);">
                    <span class="iconfont icon-wenjian1" aria-hidden="true" style="font-size: 90px;margin-left: -2px"></span>
                </button>
                </form>
                <br>
                <span>系统集成</span>
            </div>
            <div style="width: 250px;text-align: center" class="col-md-2">
                <form action="/background/findInformationByCat.action" method="post">
                    <input type="hidden" name="iCategory" value="人才培育">
                <button type="submit" style="text-align: center" class="btn btn-default btn-circle btn-big"  onmousemove="over(this);" onmouseout="out(this);">
                    <span class="iconfont icon-wenjian1" aria-hidden="true" style="font-size: 90px;margin-left: -2px"></span>
                </button>
                </form>
                <br>
                <span>人才培育</span>
            </div>
            <div style="width: 250px" class="col-md-2">
            </div>
        </div>
    </div>
    <div class="row myRow" style="height: 20px"></div>
    <div class="row myRow">
        <div class="col-xs-12">
            <div style="width: 250px;text-align: center" class="col-md-2">
            </div>
            <div style="width: 573px;height: 222px;" class="col-md-4">
                <form id="gongsijianjie" action="/background/findInformationByCat.action" method="post">
                    <input type="hidden" name="iCategory" value="公司简介">
                    <button type="submit" style="background: url(<%=path %>/img/gongsijianjie.png);width: 100%;height: 100%" class="btn btn-default btn-lg btn-block" onmousemove="over(this);" onmouseout="out(this);">
                        <%--<img src="<%=path %>/img/gongsijianjie.png" width="100%" height="100%">--%>
                    </button>
                <span>公司简介</span>
                </form>
            </div>
            <div style="width: 5px"></div>
            <div style="width: 353px;height:222px;" class="col-md-2">
                <form id="zuixinzixun" action="/background/findInformationByCat.action" method="post">
                    <input type="hidden" name="iCategory" value="最新资讯">
                    <button type="submit" style="background: url(<%=path %>/img/zuixinzixun.png);width: 100%;height: 100%" class="btn btn-default btn-lg btn-block" onmousemove="over(this);" onmouseout="out(this);">
                        <%--<img src="<%=path %>/img/zuixinzixun.png" width= "100%" height= "100%">--%>
                    </button>
                <span>最新资讯</span>
                </form>
            </div>
        </div>
    </div>
    <div class="row myRow" style="height: 30px"></div>
    <div class="row myRow">
        <div class="col-xs-12">
            <div style="width: 250px;text-align: center" class="col-md-2">
            </div>
            <div style="width: 353px;height:222px;" class="col-md-2">
                <form id="zizhizhengshu" action="/background/findInformationByCat.action" method="post">
                    <input type="hidden" name="iCategory" value="资质证书">
                    <button type="submit" style="background: url(<%=path %>/img/zizhizhengshu.png);width: 100%;height: 100%" class="btn btn-default btn-lg btn-block" onmousemove="over(this);" onmouseout="out(this);">
                            <%--<img src="<%=path %>/img/zizhizhengshu.png" width= "100%" height= "100%">--%>
                    </button>
                <span>资质证书</span>
                </form>
            </div>
            <div style="width: 5px"></div>
            <div style="width: 573px;height: 222px;" class="col-md-4">
                <form id="hexinyoushi" action="/background/findInformationByCat.action" method="post">
                    <input type="hidden" name="iCategory" value="核心优势">
                    <button type="submit" style="background: url(<%=path %>/img/hexinyoushi.png);width: 100%;height: 100%" class="btn btn-default btn-lg btn-block" onmousemove="over(this);" onmouseout="out(this);">
                        <%--<img src="<%=path %>/img/hexinyoushi.png" width="100%" height="100%">--%>
                    </button>
                <span>核心优势</span>
                </form>
            </div>
        </div>
    </div>
    <div class="row myRow" style="height: 20px"></div>
    <div class="row myRow">
        <div class="col-xs-12">
            <div class="col-xs-12" style="height: 180px">
                <img src="<%=path %>/img/hezuodanwei.png" width="100%" height="100%">
            </div>
        </div>
    </div>
    <div class="row myRow">
        <div class="col-xs-12">
            <div style="width: 220px" class="col-md-2">
            </div>
            <div style="width: 200px" class="col-md-1">
                <button type="button" style="height: 80px" class="btn btn-default btn-lg btn-block" onmousemove="over(this);" onmouseout="out(this);"><span style="font-size: 14px">山西职工医学院</span></button>
            </div>
            <div style="width: 200px" class="col-md-1">
                <button type="button" style="height: 80px" class="btn btn-default btn-lg btn-block" onmousemove="over(this);" onmouseout="out(this);"><span style="font-size: 14px">山西省科学技术厅</span></button>
            </div>
            <div style="width: 200px" class="col-md-1">
                <button type="button" style="height: 80px" class="btn btn-default btn-lg btn-block" onmousemove="over(this);" onmouseout="out(this);"><span style="font-size: 14px">晋中市委组织部</span></button>
            </div>
            <div style="width: 200px" class="col-md-1">
                <button type="button" style="height: 80px" class="btn btn-default btn-lg btn-block" onmousemove="over(this);" onmouseout="out(this);"><span style="font-size: 14px;text-align: left">山西省药品检定检验所</span></button>
            </div>
            <div style="width: 200px" class="col-md-1">
                <button type="button" style="height: 80px" class="btn btn-default btn-lg btn-block" onmousemove="over(this);" onmouseout="out(this);"><span style="font-size: 14px">太原卫星发射中心</span></button>
            </div>
        </div>
    </div>
    <div class="row myRow" style="height: 20px"></div>
    <div class="row myRow">
        <div class="col-xs-12">
            <div style="width: 220px" class="col-md-2">
            </div>
            <div style="width: 200px" class="col-md-1">
                <button type="button" style="height: 80px" class="btn btn-default btn-lg btn-block" onmousemove="over(this);" onmouseout="out(this);"><span style="font-size: 14px;text-align: center">太原市高新技术开发区</span></button>
            </div>
            <div style="width: 200px" class="col-md-1">
                <button type="button" style="height: 80px" class="btn btn-default btn-lg btn-block" onmousemove="over(this);" onmouseout="out(this);"><span style="font-size: 14px">太原市经济技术开发区</span></button>
            </div>
            <div style="width: 200px" class="col-md-1">
                <button type="button" style="height: 80px" class="btn btn-default btn-lg btn-block" onmousemove="over(this);" onmouseout="out(this);"><span style="font-size: 14px">太原不锈钢产业园区</span></button>
            </div>
            <div style="width: 200px" class="col-md-1">
                <button type="button" style="height: 80px" class="btn btn-default btn-lg btn-block" onmousemove="over(this);" onmouseout="out(this);"><span style="font-size: 14px;">太原市统计局</span></button>
            </div>
            <div style="width: 200px" class="col-md-1">
                <button type="button" style="height: 80px" class="btn btn-default btn-lg btn-block" onmousemove="over(this);" onmouseout="out(this);"><span style="font-size: 14px">劳动保障局</span></button>
            </div>
        </div>
    </div>
    <div class="row myRow" style="height: 20px"></div>
    <hr color="red" width="1400px" style="text-align: center"/>
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
    <hr color="#ff6666" width="1000px" style="text-align: center"/>
    <div class="row myRow" style="height: 20px;line-height: 20px;text-align: center">
        <div>
            <span>Copyright2019山西浩科伟业</span>
        </div>
    </div>
    <div class="row myRow" style="height: 20px">
        <div style="height: 50px;text-align: center;background-color: black">
            <span style="color: white;line-height: 50px">山西浩科伟业科技有限公司</span>
        </div>
    </div>

</body>
</html>
