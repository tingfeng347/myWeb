
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户评论与反馈</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/homePage.css">
    <script src="${pageContext.request.contextPath}/js/homePage.js"></script>
    <script src='//unpkg.com/valine/dist/Valine.min.js'></script>
    <style>
        #vcomments{
            width: 50%;
            margin: 0 auto;
        }
    </style>
</head>
<body>
<header>
    <h1>欢迎评论和反馈问题</h1>
</header>

<nav>
    <a href="javascript:void(0);" onclick="toggleNav()">〓</a>
    <a href="${pageContext.request.contextPath}/jsp/userHomePage.jsp">首页</a>
    <a href="${pageContext.request.contextPath}/jsp/userStuMessage.jsp">学生体质信息查询</a>
    <a href="${pageContext.request.contextPath}/jsp/userComment.jsp">评论与反馈</a>
    <a href="javascript:void(0);" onclick="confirmLogout()">退出</a>
</nav>

<div class="content">

    <div id="vcomments"></div>
    <script>
        new Valine({
            el: '#vcomments',
            appId: '0ZJx08DOfYwCUMn3SJM8bG2t-gzGzoHsz',
            appKey: 'I8QVvXbYYnCcdRQGEIEpbR4a',
            placeholder: "有什么问题欢迎评论区留言",
        })
    </script>
</div>

<footer>
    <p id="footer" align="center"><b>power by 乔靖博 彭登亚 马涵轩 冷锦轩</b></p>
</footer>

</body>

</html>
