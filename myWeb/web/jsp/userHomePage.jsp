
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>用户主页</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/homePage.css">
  <link rel="stylesheet" href="../css/accordion.css" />
  <script src="${pageContext.request.contextPath}/js/homePage.js"></script>
</head>
<body>
<header>
  <h1>欢迎来到学生体质管理系统用户首页</h1>
</header>

<nav>
  <a href="javascript:void(0);" onclick="toggleNav()">〓</a>
  <a href="${pageContext.request.contextPath}/jsp/userHomePage.jsp" >首页</a>
  <a href="${pageContext.request.contextPath}/jsp/userStuMessage.jsp">学生体质信息查询</a>
  <a href="${pageContext.request.contextPath}/jsp/userComment.jsp">评论与反馈</a>
  <a href="javascript:void(0);" onclick="confirmLogout()">退出</a>
</nav>

<div class="content">
  <div class="wrapper">
    <div class="container">
      <input type="radio" name="slide" id="c1" checked />
      <label for="c1" class="card" onmouseover="selectCard('c1')">
        <div class="row">
          <div class="icon">1</div>
          <div class="description">
            <h4>《清平调·其一》</h4>
            <p>云想衣裳花想容，春风拂槛露华浓。</p>
          </div>
        </div>
      </label>
      <!-- 需要放几张图片,这个结构就重复几次 -->
      <input type="radio" name="slide" id="c2" />
      <label for="c2" class="card" onmouseover="selectCard('c2')">
        <div class="row">
          <div class="icon">2</div>
          <div class="description">
            <h4>《游赤石进帆海》</h4>
            <p>首夏犹清和,芳草亦未歇。</p>
          </div>
        </div>
      </label>
      <input type="radio" name="slide" id="c3" />
      <label for="c3" class="card" onmouseover="selectCard('c3')">
        <div class="row">
          <div class="icon">3</div>
          <div class="description">
            <h4>《秋风辞》</h4>
            <p>秋风起兮白云飞,草木黄落兮雁南归。</p>
          </div>
        </div>
      </label>
      <input type="radio" name="slide" id="c4" />
      <label for="c4" class="card" onmouseover="selectCard('c4')">
        <div class="row">
          <div class="icon">4</div>
          <div class="description">
            <h4>《江雪》</h4>
            <p>千山鸟飞绝,万径人踪灭。</p>
          </div>
        </div>
      </label>
    </div>
  </div>

</div>

<footer>
  <p id="footer" align="center"><b>power by 乔靖博 彭登亚 马涵轩 冷锦轩</b></p>
</footer>

</body>

<script>
  let selectTimeout = null;

  function delaySelectCard(id) {
    selectTimeout = setTimeout(() => {
      selectCard(id);
    }, 0);
  }

  function clearSelectTimeout() {
    if (selectTimeout) {
      clearTimeout(selectTimeout);
      selectTimeout = null;
    }
  }

  function selectCard(id) {
    const radioButton = document.getElementById(id);
    radioButton.checked = true;
  }
</script>
</html>
