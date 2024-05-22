<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>管理员登录页面</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminLogin.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/error.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" charset="utf-8"></script>
  <script src="${pageContext.request.contextPath}/js/homePage.js"></script>
  <script src="${pageContext.request.contextPath}/js/error.js"></script>

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

<div><p id="title">欢迎使用学生体质管理系统</p></div>
<div class="container" id="login-box">
  <div class="form-container sign-in-container">
    <form action="<%=request.getContextPath()%>/AdminLogin" method="post">
      <h1>登录</h1>
      <div class="txtb">
        <input type="text" name="username">
        <span data-placeholder="账号" ></span>
      </div>
      <div class="txtb">
        <input type="password" name="password">
        <span data-placeholder="密码" ></span>
      </div>
      <a href="<%=request.getContextPath()%>/jsp/index.jsp">用户登录</a>
      <button type="submit">登录</button>
    </form>
  </div>
</div>
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
