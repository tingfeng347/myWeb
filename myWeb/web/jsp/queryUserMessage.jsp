<%@page import="dao.UserDao" %>
<%@ page import="bean.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>查询用户信息</title>
  <script src="${pageContext.request.contextPath}/js/homePage.js"></script>
  <style>
    /* 将整个页面内容居中 */
    body {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh; /* 让页面垂直居中 */
      margin: 0;
      background-color: #f0f0f0; /* 设置背景色 */
    }

    /* 设置表单样式 */
    form {
      background-color: #ffffff; /* 设置表单背景色 */
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.2); /* 添加阴影效果 */
    }
  </style>
</head>
<body>
<%
  response.setContentType("text/html;charset=utf-8");
  request.setCharacterEncoding("UTF-8");
  String a = request.getParameter("name");
  session.setAttribute("temp1", a);
  User user = new User();
  user.setName(a);
  UserDao userDao = new UserDao();
  User user1 = userDao.findUser(user);
  if (user1 != null) {
    String name = user1.getName();
    String password = user1.getPassword();
%>



<form >
  <!-- 在form标签外包裹一个div,给它添加back-button类 -->
  <div class="back-button">
    <a href="userMessage.jsp">
      <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path fill-rule="evenodd" clip-rule="evenodd"
              d="M10 0C4.47715 0 0 4.47715 0 10C0 15.5228 4.47715 20 10 20C15.5228 20 20 15.5228 20 10C20 4.47715 15.5228 0 10 0ZM14.8493 14.8493C14.6522 15.0464 14.3477 15.0464 14.1507 14.8493L10 10.6986L5.84931 14.8493C5.65224 15.0464 5.34776 15.0464 5.15069 14.8493C4.95361 14.6522 4.95361 14.3478 5.15069 14.1507L9.30142 10L5.15069 5.84931C4.95361 5.65224 4.95361 5.34776 5.15069 5.15069C5.34776 4.95361 5.65224 4.95361 5.84931 5.15069L10 9.30142L14.1507 5.15069C14.3478 4.95361 14.6522 4.95361 14.8493 5.15069C15.0464 5.34776 15.0464 5.65224 14.8493 5.84931L10.6986 10L14.8493 14.1507Z"
              fill="black"/>
      </svg>
    </a>
  </div>
  <table border="0" width="200" height="250">
    <tr>
      <td>用户:</td>
      <td><input name="name" value="<%=name%>" style="width: 150px; height: 30px;"></td>
    </tr>
    <tr>
      <td>密码:</td>
      <td><input name="password" value="<%=password%>" style="width: 150px; height: 30px;"></td>
    </tr>
    <tr>

  </table>

</form>

<%
} else {
%>
没有找到用户信息！！
<a href="adminStuMessage.jsp">
  <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path fill-rule="evenodd" clip-rule="evenodd"
          d="M10 0C4.47715 0 0 4.47715 0 10C0 15.5228 4.47715 20 10 20C15.5228 20 20 15.5228 20 10C20 4.47715 15.5228 0 10 0ZM14.8493 14.8493C14.6522 15.0464 14.3477 15.0464 14.1507 14.8493L10 10.6986L5.84931 14.8493C5.65224 15.0464 5.34776 15.0464 5.15069 14.8493C4.95361 14.6522 4.95361 14.3478 5.15069 14.1507L9.30142 10L5.15069 5.84931C4.95361 5.65224 4.95361 5.34776 5.15069 5.15069C5.34776 4.95361 5.65224 4.95361 5.84931 5.15069L10 9.30142L14.1507 5.15069C14.3478 4.95361 14.6522 4.95361 14.8493 5.15069C15.0464 5.34776 15.0464 5.65224 14.8493 5.84931L10.6986 10L14.8493 14.1507Z"
          fill="black"/>
  </svg>
</a>

<%

  }
%>
</body>
</html>
