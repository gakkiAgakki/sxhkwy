<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: HASEE
  Date: 2019/5/5
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
    String date= format.format(new Date());
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
    <link rel="stylesheet" href="<%=path%>/kindeditor/themes/default/default.css" />
    <link rel="stylesheet" href="<%=path%>/kindeditor/plugins/code/prettify.css" />
    <script charset="utf-8" src="<%=path%>/kindeditor/kindeditor-all.js"></script>
    <script charset="utf-8" src="<%=path%>/kindeditor/lang/zh-CN.js"></script>
    <script charset="utf-8" src="<%=path%>/kindeditor/plugins/code/prettify.js"></script>

    <script type="text/javascript">
        function post(URL, PARAMS)
        {
            var temp = document.createElement("form");
            temp.action = URL;
            temp.method = "post";
            temp.style.display = "none";
            for (var x in PARAMS)
            {
                var opt = document.createElement("textarea");
                opt.name = x;
                opt.value = PARAMS[x];
                //alert(opt.name);
                temp.appendChild(opt);
            }
            document.body.appendChild(temp);
            temp.submit();
            document.getElementById("rollback").submit();
            return temp;
        }
    </script>

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
    <script type="text/javascript">
        <%--富文本编辑器--%>
        KindEditor.ready(function(K) {
            var editor1 = K.create('#editor_id', {
                cssPath : '<%=path%>/kindeditor/plugins/code/prettify.css',
                uploadJson : '<%=path%>/kindeditor/jsp/upload_json.jsp',
                fileManagerJson : '<%=path%>/kindeditor/jsp/file_manager_json.jsp',
                allowFileManager : true,
                afterCreate : function() {
                    var self = this;
                    K.ctrl(document, 13, function() {
                        self.sync();
                        document.forms['example'].submit();
                    });
                    K.ctrl(self.edit.doc, 13, function() {
                        self.sync();
                        document.forms['example'].submit();
                    });
                },
                afterBlur: function(){this.sync();}
            });
            prettyPrint();
        });
    </script>
</head>
<body>
<div class="dingbu" style="width: 1519px;height: 200px;background-size: 100%">
    <img src="<%=path%>/img/big-img.png" width="100%" height="100%">
    <div style="position: absolute;z-indent:2;right:20px;top:50px;width: 180px;height: 40px"><font size="4"
    color="white">欢迎您:${user.uName}</font>
    </div>
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
        <%--</div>--%>
    </div>
    <div class="col-xs-10 col-md-10">
        <form class="form-signin" id="modifyInformation" action="/background/modifyInfById.action" method="post" enctype="multipart/form-data">
            <%--<h2 class="form-signin-heading">留言板</h2>--%>
            <%--<table style="text-align: center" width="100%"  class="table table-striped table-bordered">--%>
                <%--<tr>--%>
                    <%--<td style="width: 150px">标题</td>--%>
                    <div class="row">
                        <input type="hidden" name="iId" value="${information.iId}">
                    <%--<td>--%>
                        <label for="iTitle" style="line-height: 40px;width: 70px" class="col-sm-1">标题:</label>
                        <div class="col-sm-11">
                        <input style="width: 500px;height: 40px" id="iTitle" type="text" name="iTitle" class="form-control" value="${information.iTitle}" placeholder="标题" required autofocus>
                        </div>
                    <%--</td>--%>
                    <%--<td>时间</td>--%>
                    </div>
                    <%--<td>--%>
                    <div class="row">
                        <label for="iDate" style="line-height: 40px;width: 70px" class="col-sm-1">时间:</label>
                        <div class="col-sm-10">
                        <input style="width: 500px;height: 40px" id="iDate" type="text" name="iDate" value="${information.iDate}" class="form-control" placeholder="时间" required autofocus>
                        </div>
                    </div>
                    <%--</td>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                    <%--<td>分类</td>--%>
                    <%--<td>--%>
                <div class="row">
                        <label for="iCategory" style="line-height: 40px;width: 70px" class="col-sm-1">分类:</label>
                        <%--level的下拉框--%>
                    <div class="col-sm-11">
                        <select style="width: 300px" id="iCategory" name="iCategory" class="form-control">
                            <option value="业务方向" ${information.iCategory == '业务方向' ? 'selected' : ''}>业务方向</option>
                            <option value="项目案例" ${information.iCategory == '项目案例' ? 'selected' : ''}>项目案例</option>
                            <option value="最新资讯" ${information.iCategory == '最新资讯' ? 'selected' : ''}>最新资讯</option>
                            <option value="项目立项" ${information.iCategory == '项目立项' ? 'selected' : ''}>项目立项</option>
                            <option value="需求分析" ${information.iCategory == '需求分析' ? 'selected' : ''}>需求分析</option>
                            <option value="软件设计" ${information.iCategory == '软件设计' ? 'selected' : ''}>软件设计</option>
                            <option value="程序编码" ${information.iCategory == '程序编码' ? 'selected' : ''}>程序编码</option>
                            <option value="软件测试" ${information.iCategory == '软件测试' ? 'selected' : ''}>软件测试</option>
                            <option value="发布上市" ${information.iCategory == '发布上市' ? 'selected' : ''}>发布上市</option>
                            <option value="软件开发" ${information.iCategory == '软件开发' ? 'selected' : ''}>软件开发</option>
                            <option value="物联网开发" ${information.iCategory == '物联网开发' ? 'selected' : ''}>物联网开发</option>
                            <option value="系统集成" ${information.iCategory == '系统集成' ? 'selected' : ''}>系统集成</option>
                            <option value="人才培育" ${information.iCategory == '人才培育' ? 'selected' : ''}>人才培育</option>
                            <option value="公司简介" ${information.iCategory == '公司简介' ? 'selected' : ''}>公司简介</option>
                            <option value="最新资讯" ${information.iCategory == '最新资讯' ? 'selected' : ''}>最新资讯</option>
                            <option value="资质证书" ${information.iCategory == '资质证书' ? 'selected' : ''}>资质证书</option>
                            <option value="核心优势" ${information.iCategory == '核心优势' ? 'selected' : ''}>核心优势</option>
                            <option value="联系我们" ${information.iCategory == '联系我们' ? 'selected' : ''}>联系我们</option>
                        </select>
                    </div>
                        <%--<script type="text/javascript">--%>
                            <%--form.iCategory.value = document.getElementById("iCategory").value;--%>
                        <%--</script>--%>
                </div>
                    <%--</td>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                    <%--<form name="example" method="post" action="demo.jsp">--%>
                        <textarea id="editor_id" name="iBody" cols="100" rows="8" style="width:1000px;height:700px;float: left;display: none">${information.iBody}<%=htmlspecialchars(htmlData)%></textarea>

                    <div class="row">
                        <label for="fileUpload" style="line-height: 40px;width: 70px" class="col-sm-1">附件:</label>

                        <c:if test="${empty information.iadjunctName}">
                            <div class="col-sm-11">
                                <input style="width: 300px;height: 40px" id="fileUpload" type="file" name="fileUpload" value="上传附件" class="form-control" placeholder="附件" autofocus>
                            </div>
                        </c:if>

                        <script type="text/javascript">
                            function deleteFile() {
                                var iId = $("#deleteIId").val();
                                var iadjunctName = $("#deleteIadjunctName").val();
                                post('/background/deleteFile.action',{iId:iId,iadjunctName:iadjunctName});
//                                $.ajax({
//                                    url: "/background/deleteFile.action", //处理页面的路径
//                                    data: {iId:iId,iadjunctName:iadjunctName}, //要提交的数据是一个JSON
//                                    async:false,
//                                    type: "POST", //提交方式
//                                    dataType: "json", //返回数据的类型
//                                    //TEXT字符串 JSON返回JSON XML返回XML
//                                    success: function () { //回调函数 ,成功时返回的数据存在形参data里
//                                        window.location.reload();
//                                    }
//                                })
                            }
                        </script>

                        <c:if test="${not empty information.iadjunctName}">
                            <div class="col-sm-11">
                                <a href="/background/downLoadFile.action?downFileName=${information.iadjunctName}">${information.iadjunctName}</a>
                                <input type="hidden" id="deleteIId" value="${information.iId}">
                                <input type="hidden" id="deleteIadjunctName" value="${information.iadjunctName}">
                                <input type="button" value="删除附件" onclick="deleteFile()">
                                <input style="display: none" type="file" name="fileUpload" value="上传附件">
                            </div>
                        </c:if>

                    </div>
                    <%--</td>--%>
                <%--</tr>--%>
            <%--</table>--%>
        </form>
        <script type="text/javascript">
            function modifyInformation() {

                var title = document.getElementById("iTitle").value;
                if (title == null || title == '') {
                    alert("标题不能为空！");
                    return false;
                }
                var date = document.getElementById("iDate").value;
                if (date == null || date == '') {
                    alert("日期不能为空！");
                    return false;
                }
                var editor_id = document.getElementById("editor_id").value;
                if (editor_id == null || editor_id == '') {
                    alert("内容不能为空！");
                    return false;
                }

                document.getElementById("modifyInformation").submit();
            }
        </script>
        <input type="submit" style="height: 40px;width: 100px" class="btn btn-info" onclick="return modifyInformation()" value="修改资讯">

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