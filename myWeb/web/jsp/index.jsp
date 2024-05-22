<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>用户登录页面</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/userLogin.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/error.css">
  <script src="${pageContext.request.contextPath}/js/error.js"></script>
  <!-- jQuery文件 -->
  <script src="https://cdn.staticfile.net/jquery/3.2.1/jquery.min.js"></script>


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
  <div class="form-container sign-up-container">
    <form action="<%=request.getContextPath()%>/addUser" method="post">
      <h1>注册</h1>
      <div class="txtb">
        <input type="text" name="username">
        <span data-placeholder="账号" id="data-placeholder"></span>
      </div>
      <div class="txtb">
        <input type="password" name="password">
        <span data-placeholder="密码" ></span>
      </div>

      <button type="submit">注册</button>
    </form>
  </div>
  <div class="form-container sign-in-container">
    <form action="<%=request.getContextPath()%>/UserLogin" method="post">
      <h1>登录</h1>
      <div class="txtb">
        <input type="text" name="username">
        <span data-placeholder="账号" ></span>
      </div>
      <div class="txtb">
        <input type="password" name="password">
        <span data-placeholder="密码" ></span>
      </div>
      <a href="<%=request.getContextPath()%>/jsp/adminLogin.jsp">管理员登录</a>
      <button type="submit">登录</button>
    </form>
  </div>

  <div class="overlay-container">
    <div class="overlay">
      <div class="overlay-panel overlay-left">
        <h1>已有账号？</h1>
        <p>请使用您的账号进行登录</p>
        <button class="ghost" id="signIn" type="button">登录</button>
      </div>
      <div class="overlay-panel overlay-right">
        <h1>没有账号?</h1>
        <p>点击下方按钮进行注册吧！</p>
        <button class="ghost" id="signUp" type="button">注册</button>
      </div>
    </div>
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
