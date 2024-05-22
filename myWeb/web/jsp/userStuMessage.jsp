<%@page import="dao.StudentDao" %>
<%@page import="java.util.*" %>
<%@ page import="bean.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户学生信息</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/homePage.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/error.css">
    <script src="${pageContext.request.contextPath}/js/homePage.js"></script>
    <script src="${pageContext.request.contextPath}/js/userMessageForm.js"></script>
    <script src="${pageContext.request.contextPath}/js/error.js"></script>
    <!-- jQuery文件。在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.net/jquery/3.2.1/jquery.min.js"></script>
    <!-- 新 Bootstrap4 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.staticfile.net/twitter-bootstrap/4.3.1/css/bootstrap.min.css">

    <!-- bootstrap.bundle.min.js 用于弹窗、提示、下拉菜单，包含了 popper.min.js -->
    <script src="https://cdn.staticfile.net/popper.js/1.15.0/umd/popper.min.js"></script>

    <!-- 最新的 Bootstrap4 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.net/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <style>
        /* 应用到所有<a>标签 */
        a {
            text-decoration: none; /* 移除下划线 */
            color: initial; /* 使用初始颜色，或者选择一个你想要的颜色 */
        }

        /* 当鼠标悬停在链接上时的样式 */
        a:hover {
            color: white; /* 保持颜色不变，或设置为你希望的颜色 */
            text-decoration: none; /* 确保没有下划线 */
            font-size: 18px;
        }

        .button-container {
            margin-left:47%; /* 例如，向右移动50px */
        }
    </style>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/modal-content.css">
</head>
<body>
<header>
    <h1>学生体质信息查询</h1>
</header>

<nav>
    <a href="javascript:void(0);" onclick="toggleNav()">〓</a>
    <a href="${pageContext.request.contextPath}/jsp/userHomePage.jsp">首页</a>
    <a href="${pageContext.request.contextPath}/jsp/userStuMessage.jsp">学生体质信息查询</a>
    <a href="${pageContext.request.contextPath}/jsp/userComment.jsp">评论与反馈</a>
    <a href="javascript:void(0);" onclick="confirmLogout()">退出</a>
</nav>

<div class="content">
        <%! int row; %>
        <%
      request.setCharacterEncoding("UTF-8");
      row = 1;
      StudentDao studentDAO = new StudentDao();
      List<Student> list = studentDAO.findAll();
      Iterator<Student> iter = list.iterator();
    %><p align="center" id="tishi">你要查询的学生体质数据表中共有 <font size="5" color="red"><%=list.size()%>
</font>人<p>
    <hr>
    <div class="button-container">
        <button type="button" class="btn btn-primary" style="margin-right: 20px; background-color: #31bdec;"
                data-toggle="modal" data-target="#selectModal">查询学生信息
        </button>
    </div>

    <!-- 查询学生信息模态框 -->
    <div class="modal fade" id="selectModal" tabindex="-1" role="dialog" aria-labelledby="selectModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="selectModalLabel">查询学生信息</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="<%=request.getContextPath()%>/jsp/querySelfMessage.jsp" method="post">
                        <div class="form-group">
                            <label for="selectSno">学号</label>
                            <input type="text" class="form-control" id="selectSno" name="sno">
                        </div>
                        <button type="submit">提交</button>
                        <button type="reset">取消</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
