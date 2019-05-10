<%--
  Created by IntelliJ IDEA.
  User: HASEE
  Date: 2019/5/7
  Time: 19:19
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

    <title>浩科伟业管理系统</title>

    <!-- Bootstrap core CSS -->
    <script src="<%=path %>/js/jquery.min.js" type="text/javascript"></script>
    <link href="<%=path %>/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="<%=path %>/bootstrap/js/bootstrap.min.js"></script>

    <script src="<%=path %>/js/manage.js"></script>

    <script type="text/javascript" src="<%=path %>/js/jquery.bxslider.js"></script>
    <link href="<%=path %>/css/jquery.bxslider.css" rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="<%=path %>/css/iconfont.css">

    <%--首页图标--%>
    <link rel="Bookmark" type="image/x-icon" href="<%=path %>/img/top.ico"/>
    <link rel="icon" type="image/x-icon" href="<%=path %>/img/top.ico"/>
    <link rel="shortcut icon" type="image/x-icon" href="<%=path %>/img/top.ico"/>

    <script type="text/javascript">
        function post(URL, PARAMS) {
            var temp = document.createElement("form");
            temp.action = URL;
            temp.method = "post";
            temp.style.display = "none";
            for (var x in PARAMS) {
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
    <script type="text/javascript">
        function del() {
            var flag = window.confirm("确认删除吗?");
            return flag;
        }
        var msg = $("#msg").val();
        if (msg == true) {
            alert("删除成功");
        }
    </script>

    <style type="text/css">
        * {
            margin: 0 auto;
            padding: 0;
        }

        .imglist {
            list-style: none;
            width: 80px;
        }

        .imglist li {
            float: left;
            margin-top: 10px;
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
        <div class="row" style="height: 80px">
            <div class="col-xs-8 col-sm-6 col-xs-offset-3">
                <input class="btn btn-primary" type="button" style="width: 100px;height: 40px" value="删除选中用户"
                       onclick="delUsers()">
            </div>
        </div>
        <script type="text/javascript">
            function delUsers() {
                //1、获取所有被选定的留言的 id
                //A、为每一个复选框添加一个 value 属性，值是该留言的 id
                //B、使用 选择器获取
                var cs = $("input[type='checkbox']:checked");

                //优化:
                if (cs.length == 0) {
                    return;
                }

                if (!window.confirm("确定删除吗")) {
                    return;
                }

                //C、使用 JQ 将复选框的 value值组织成一个格式化字符串
                var ids = cs.serialize();//样式: pid=xx&pid=XX...
                //2、提交到服务器的一个Servlet
                location.href = "${pageContext.request.contextPath}/background/delUsers?" + ids;
            }
        </script>
        <%--</div>--%>
    </div>
    <div class="col-xs-10 col-md-10">
        <div style="overflow: auto; width: 1200px;">
            <%--<div style="overflow: auto; width: 100%;">--%>
            <table style="text-align: center;" class="table table-striped table-bordered" align="center">
                <%--<tr>--%>
                <%--<th align="right">--%>
                <%--&lt;%&ndash;<input type="button" value="保存" onclick="toSave()"/>&ndash;%&gt;--%>
                <%--<input class="btn btn-primary btn-xs" type="button" value="删除留言" onclick="delMsgs()"/>--%>
                <%--</th>--%>
                <%--</tr>--%>
                <tr>
                    <td width="1%"><b>选择</b></td>
                    <td width="2%"><b>id</b></td>
                    <td width="3%"><b>用户名</b></td>
                    <td width="2%"><b>密码</b></td>
                    <td width="6%"><b>等级</b></td>

                    <td><b>操作</b></td>
                </tr>

                <c:forEach var="uList" items="${pb.uList}">
                    <tr>
                        <td><input class="checkbox" type="checkbox" name="id" value="${uList.uId }"/></td>
                        <td>${uList.uId }</td>
                        <td>${uList.uName }</td>
                        <td>${uList.uPsw }</td>
                        <td>
                            <select class="form-control" name="ruler">
                                <option value="0" ${uList.ruler == '0' ? 'selected' : ''}>管理员</option>
                                <option value="1" ${uList.ruler == '1' ? 'selected' : ''}>普通用戶</option>
                            </select>
                        </td>

                        <td width="5%">
                            <a href="${pageContext.request.contextPath}/background/delUser?uId=${uList.uId}"
                               onclick="return del()">删除此用户</a>
                        </td>

                    </tr>
                </c:forEach>

                <table class="table table-striped table-bordered" align="center">
                    <tr align="center">
                        <td>
                            <a <c:if
                                    test="${pb.pageNum > 1 }"> href="${pageContext.request.contextPath }/findUser?userPage=${pb.pageNum - 1}"</c:if>>上一页</a>

                            <c:forEach var="current" begin="1" end="${pb.pages }">
                                <a href="${pageContext.request.contextPath }/findUser?userPage=${current}">${current }</a>
                            </c:forEach>

                            <a <c:if
                                    test="${pb.pageNum < pb.pages }"> href="${pageContext.request.contextPath }/findUser?userPage=${pb.pageNum + 1}"</c:if>>下一页</a>

                        </td>
                    </tr>
                    <%--记录数，总条数--%>
                    <tr>
                        <td align="right">
                            <font size="2" color="red">共 ${pb.totalRecord }
                                条记录，每页显示 ${pb.rows }条，共 ${pb.pages }页，当前页从第 ${pb.startIndex + 1} 条记录开始</font>
                        </td>
                    </tr>
                </table>
            </table>
        </div>
        <%--</div>--%>
    </div>
</div>
</body>
</html>
