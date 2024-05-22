<%@page import="dao.AdminDao"%>
<%@page import="java.util.*"%>
<%@ page import="bean.Admin" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>管理员信息</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/homePage.css">
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
  <h1>管理员信息</h1>
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
      AdminDao AdminDAO = new AdminDao();
      List<Admin> list = AdminDAO.findAll();
      Iterator<Admin> iter = list.iterator();
    %>你要查询的管理员数据表中共有 <font size="5" color="red"><%=list.size()%></font>人
    <hr>
    <table border="2" width="50%"align="center">
      <tr  align="center">
        <td>记录条数</td>
        <td>账号</td>
      </tr>
      <%
        while (iter.hasNext()) {
          Admin admin = iter.next();
      %>
      <tr align="center">
        <td><%=row%></td>
        <td><%=admin.getName()%></td>
      </tr>
      <%
          ++row;
        }
      %>

    </table>
    <hr>
  </center>

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
