<%@page import="dao.StudentDao" %>
<%@page import="java.util.*" %>
<%@ page import="bean.Student" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>管理员管理学生信息</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/homePage.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/error.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/comment.css">

    <script src="${pageContext.request.contextPath}/js/homePage.js"></script>
    <script src="${pageContext.request.contextPath}/js/userMessageForm.js"></script>
    <script src="${pageContext.request.contextPath}/js/error.js"></script>
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
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

    </style>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/modal-content.css">
</head>
<body>

<%
    String errorMessage = (String) request.getAttribute("error");
    if (errorMessage != null) {
%>
<div id="errorPopup" class="error-popup">
    <%= errorMessage %>
</div>
<%
        // 清除请求属性，确保错误信息只显示一次
        request.removeAttribute("errorMessage");
    }
%>

<header>
    <h1>学生体质信息</h1>
</header>

<nav>
    <a href="javascript:void(0);" onclick="toggleNav()">〓</a>
    <a href="${pageContext.request.contextPath}/jsp/adminHomePage.jsp">首页</a>
    <a href="${pageContext.request.contextPath}/jsp/adminStuMessage.jsp">学生体质信息</a>
    <a href="${pageContext.request.contextPath}/jsp/userMessage.jsp">用户信息</a>
    <a href="${pageContext.request.contextPath}/jsp/adminMessage.jsp">管理员信息</a>
    <a class="" href="https://console.leancloud.cn/" target="_blank" rel="noreferrer">评论与反馈信息</a>
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
</font>人
    <p>

    <hr>
    <table border="2" width="50%" align="center">
        <tr align="center">
            <td>记录条数</td>
            <td>学号</td>
            <td>姓名</td>
            <td>年龄</td>
            <td>性别</td>
            <td>身高(cm)</td>
            <td>体重(kg)</td>
            <td>肺活量(ml)</td>
            <td>体前屈(cm)</td>
        </tr>
        <%
            while (iter.hasNext()) {
                Student stu = iter.next();
        %>
        <tr align="center">
            <td><%=row%>
            </td>
            <td><%=stu.getSno()%>
            </td>
            <td><%=stu.getName()%>
            </td>
            <td><%=stu.getAge()%>
            </td>
            <td><%=stu.getSex()%>
            </td>
            <td><%=stu.getHeight()%>
            </td>
            <td><%=stu.getWeight()%>
            </td>
            <td><%=stu.getFhl()%>
            </td>
            <td><%=stu.getTqq()%>
            </td>
        </tr>
        <%
                ++row;
            }
        %>
    </table>
    <hr>
    <div class="button-container">
        <button type="button" class="btn btn-primary" style="margin-right: 20px; background-color: #16b777;"
                data-toggle="modal" data-target="#addModal">添加学生信息
        </button>
        <button type="button" class="btn btn-primary" style="margin-right: 20px; background-color: #ff5722;"
                data-toggle="modal" data-target="#deleteModal">删除学生信息
        </button>
        <button type="button" class="btn btn-primary" style="margin-right: 20px;background-color: #ffb800;"
                data-toggle="modal"
                data-target="#updateModal">修改学生信息
        </button>
        <button type="button" class="btn btn-primary" style="margin-right: 20px; background-color: #31bdec;"
                data-toggle="modal" data-target="#selectModal">查询学生信息
        </button>
    </div>


    <!-- 添加学生信息模态框 -->
    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addModalLabel">添加学生信息</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- 添加学生的表单代码 -->
                    <form action="<%=request.getContextPath()%>/addStudentMessage" method="post">
                        <div class="form-group">
                            <label for="sno">学号</label>
                            <input type="text" class="form-control" id="sno" name="sno">
                        </div>
                        <div class="form-group">
                            <label for="name">姓名</label>
                            <input type="text" class="form-control" id="name" name="name">
                        </div>
                        <div class="form-group">
                            <label for="age">年龄</label>
                            <input type="text" class="form-control" id="age" name="age">
                        </div>
                        <div class="form-group">
                            <label for="sex">性别</label>
                            <input type="text" class="form-control" id="sex" name="sex">
                        </div>
                        <div class="form-group">
                            <label for="height">身高</label>
                            <input type="text" class="form-control" id="height" name="height">
                        </div>
                        <div class="form-group">
                            <label for="weight">体重</label>
                            <input type="text" class="form-control" id="weight" name="weight">
                        </div>
                        <div class="form-group">
                            <label for="fhl">肺活量</label>
                            <input type="text" class="form-control" id="fhl" name="fhl">
                        </div>
                        <div class="form-group">
                            <label for="tqq">体前屈</label>
                            <input type="text" class="form-control" id="tqq" name="tqq">
                        </div>
                        <button type="submit">提交</button>
                        <button type="reset">取消</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- 删除学生信息模态框 -->
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel"
         aria-hidden="true" >
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteModalLabel">删除学生信息</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="<%=request.getContextPath()%>/deleteStudentMessage" method="post">
                        <div class="form-group">
                            <label for="deleteSno">学号</label>
                            <input type="text" class="form-control" id="deleteSno" name="sno">
                        </div>
                        <div class="form-group">
                            <label for="deleteName">姓名</label>
                            <input type="text" class="form-control" id="deleteName" name="name">
                        </div>
                        <button type="submit">提交</button>
                        <button type="reset">取消</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- 修改学生信息模态框 -->
    <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel"
         aria-hidden="true"
    >
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="updateModalLabel">修改学生信息</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="<%=request.getContextPath()%>/jsp/updateStuMessage.jsp" method="post">
                        <div class="form-group">
                            <label for="updateSno">学号</label>
                            <input type="text" class="form-control" id="updateSno" name="sno">
                        </div>
                        <button type="submit">提交</button>
                        <button type="reset">取消</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- 查询学生信息模态框 -->
    <div class="modal fade" id="selectModal" tabindex="-1" role="dialog" aria-labelledby="selectModalLabel"
         aria-hidden="true" >
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="selectModalLabel">查询学生信息</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="<%=request.getContextPath()%>/jsp/queryStuMessage.jsp" method="post">
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

<script>

    $("#signUp").click(function () {
        $("#login-box").addClass('right-panel-active');
    });

    $("#signIn").click(function () {
        $("#login-box").removeClass('right-panel-active');
    });

    $(".txtb input").on("focus", function () {
        $(this).addClass("focus");
    });

    $(".txtb input").on("blur", function () {
        if ($(this).val() == '')
            $(this).removeClass("focus");
    });
</script>
</html>
