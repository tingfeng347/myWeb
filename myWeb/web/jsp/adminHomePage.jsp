<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>管理员主页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/homePage.css">
    <script src="https://unpkg.com/sober/dist/sober.min.js"></script>
    <script src="../js/homePage.js"></script>
</head>
<body>

<header>
    <h1>欢迎来到学生体质管理系统管理员首页</h1>
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
    <s-carousel>
        <div><img src="../img/学习-wbdb.jpg"></div>
        <div><img src="../img/红墙.jpg"></div>
        <div><img src="../img/芯片.jpg"></div>
    </s-carousel>

</div>

<footer>
    <p id="footer" align="center"><b>power by 乔靖博 彭登亚 马涵轩 冷锦轩</b></p>
</footer>
</body>
</html>
