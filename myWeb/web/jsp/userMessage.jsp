<%@page import="dao.UserDao"%>
<%@page import="java.util.*"%>
<%@ page import="bean.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户信息</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/homePage.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/error.css">
    <script src="${pageContext.request.contextPath}/js/homePage.js"></script>
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
        table {
            width: 50%;
            margin-left: auto;
            margin-right: auto;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
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

<%String errorMessage = (String) request.getAttribute("error");
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
    <h1>用户信息</h1>
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
    <center>
        <%! int row; %>
        <%
            request.setCharacterEncoding("UTF-8");
            row = 1;
            UserDao UserDAO = new UserDao();
            List<User> list = UserDAO.findAll();
            Iterator<User> iter = list.iterator();
        %>你要查询的用户数据表中共有 <font size="5" color="red"><%=list.size()%></font>人
        <hr>
        <table border="2" width="50%"align="center">
            <tr  align="center">
                <td>记录条数</td>
                <td>账号</td>
                <td>密码</td>
            </tr>
            <%
                while (iter.hasNext()) {
                    User user = iter.next();
            %>
            <tr align="center">
                <td><%=row%></td>
                <td><%=user.getName()%></td>
                <td><%=user.getPassword()%></td>
            </tr>
            <%
                    ++row;
                }
            %>
        </table>
        <hr>
    </center>
    <div class="button-container">
        <button type="button" class="btn btn-primary" style="margin-right: 20px; background-color: #16b777;"
                data-toggle="modal" data-target="#addModal">添加用户信息
        </button>
        <button type="button" class="btn btn-primary" style="margin-right: 20px; background-color: #ff5722;"
                data-toggle="modal" data-target="#deleteModal">删除用户信息
        </button>
        <button type="button" class="btn btn-primary" style="margin-right: 20px;background-color: #ffb800;" data-toggle="modal"
                data-target="#updateModal">修改用户信息
        </button>
        <button type="button" class="btn btn-primary" style="background-color: #31bdec;" data-toggle="modal"
                data-target="#selectModal">查询用户信息
        </button>
    </div>

    <!-- 添加用户信息模态框 -->
    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addModalLabel">添加用户信息</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- 添加用户的表单代码 -->
                    <form action="<%=request.getContextPath()%>/addUserMessage" method="post">
                        <div class="form-group">
                            <label for="user_name">账号</label>
                            <input type="text" class="form-control" id="user_name" name="name">
                        </div>
                        <div class="form-group">
                            <label for="user_password">密码</label>
                            <input type="text" class="form-control" id="user_password" name="password">
                        </div>
                        <button type="submit">提交</button>
                        <button type="reset">取消</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- 删除用户信息模态框 -->
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteModalLabel">删除用户信息</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="<%=request.getContextPath()%>/deleteUserMessage" method="post">
                        <div class="form-group">
                            <label for="deleteUser">账号</label>
                            <input type="text" class="form-control" id="deleteUser" name="name">
                        </div>
                        <button type="submit">提交</button>
                        <button type="reset">取消</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- 修改用户信息模态框 -->
    <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="updateModalLabel">修改用户信息</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="<%=request.getContextPath()%>/jsp/updateUserMessage.jsp" method="post">
                        <div class="form-group">
                            <label for="updateUser">账号</label>
                            <input type="text" class="form-control" id="updateUser" name="name">
                        </div>
                        <button type="submit">提交</button>
                        <button type="reset">取消</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- 查询用户信息模态框 -->
    <div class="modal fade" id="selectModal" tabindex="-1" role="dialog" aria-labelledby="selectModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="selectModalLabel">查询用户信息</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="<%=request.getContextPath()%>/jsp/queryUserMessage.jsp" method="post">
                        <div class="form-group">
                            <label for="selectUser">账号</label>
                            <input type="text" class="form-control" id="selectUser" name="name">
                        </div>
                        <button type="submit">提交</button>
                        <button type="reset">取消</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>

<footer>
    <p id="footer"></p>
</footer>

</body>
<script>

    $("#signUp").click(function(){
        $("#login-box").addClass('right-panel-active');
    });

    $("#signIn").click(function(){
        $("#login-box").removeClass('right-panel-active');
    });

    $(".txtb input").on("focus",function(){
        $(this).addClass("focus");
    });

    $(".txtb input").on("blur",function(){
        if($(this).val() == '')
            $(this).removeClass("focus");
    });
</script>
</html>
