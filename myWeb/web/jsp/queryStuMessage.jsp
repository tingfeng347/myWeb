<%@page import="dao.StudentDao"%>
<%@ page import="bean.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>查询学生信息</title>
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
  String a = request.getParameter("sno");
  session.setAttribute("temp1", a);
  Student student = new Student();
  student.setSno(a);
  StudentDao studentDao = new StudentDao();
  Student stu = studentDao.findStudent(student);
  if (stu != null) {
    String sno = stu.getSno();
    String name = stu.getName();
    int age = stu.getAge();
    String sex = stu.getSex();
    double weight = stu.getWeight();
    double height = stu.getHeight();
    int fhl=stu.getFhl();
    double tqq=stu.getTqq();
%>
<form>
  <div style="position: relative;padding-left: 220px">
    <a href="adminStuMessage.jsp" >
      <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path fill-rule="evenodd" clip-rule="evenodd" d="M10 0C4.47715 0 0 4.47715 0 10C0 15.5228 4.47715 20 10 20C15.5228 20 20 15.5228 20 10C20 4.47715 15.5228 0 10 0ZM14.8493 14.8493C14.6522 15.0464 14.3477 15.0464 14.1507 14.8493L10 10.6986L5.84931 14.8493C5.65224 15.0464 5.34776 15.0464 5.15069 14.8493C4.95361 14.6522 4.95361 14.3478 5.15069 14.1507L9.30142 10L5.15069 5.84931C4.95361 5.65224 4.95361 5.34776 5.15069 5.15069C5.34776 4.95361 5.65224 4.95361 5.84931 5.15069L10 9.30142L14.1507 5.15069C14.3478 4.95361 14.6522 4.95361 14.8493 5.15069C15.0464 5.34776 15.0464 5.65224 14.8493 5.84931L10.6986 10L14.8493 14.1507Z" fill="black"/>
      </svg>
    </a>
  </div>
  <table border="0" width="238" height="252">
    <tr>
      <td>学号:</td>
      <td><input name="sno" value=<%=sno%>></td>
    </tr>
    <tr>
      <td>姓名:</td>
      <td><input name="name" value=<%=name%>></td>
    </tr>
    <tr>
      <td>年龄:</td>
      <td><input name="age" value=<%=age%>></td>
    </tr>
    <tr>
      <td>性别:</td>
      <td><input name="sex" value=<%=sex%>></td>
    </tr>
    <tr>
      <td>身高:</td>
      <td><input name="height" value=<%=height%>></td>
    </tr>
    <tr>
      <td>体重:</td>
      <td><input name="weight" value=<%=weight%>></td>
    </tr>
    <tr>
      <td>肺活量:</td>
      <td><input name="fhl" value=<%=fhl%>></td>
    </tr>
    <tr>
      <td>体前屈:</td>
      <td><input name="tqq" value=<%=tqq%>></td>
    </tr>


  </table>
</form>

<%
} else {
%>
没有找到学生体质信息记录！！
<a href="adminStuMessage.jsp" >
  <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path fill-rule="evenodd" clip-rule="evenodd" d="M10 0C4.47715 0 0 4.47715 0 10C0 15.5228 4.47715 20 10 20C15.5228 20 20 15.5228 20 10C20 4.47715 15.5228 0 10 0ZM14.8493 14.8493C14.6522 15.0464 14.3477 15.0464 14.1507 14.8493L10 10.6986L5.84931 14.8493C5.65224 15.0464 5.34776 15.0464 5.15069 14.8493C4.95361 14.6522 4.95361 14.3478 5.15069 14.1507L9.30142 10L5.15069 5.84931C4.95361 5.65224 4.95361 5.34776 5.15069 5.15069C5.34776 4.95361 5.65224 4.95361 5.84931 5.15069L10 9.30142L14.1507 5.15069C14.3478 4.95361 14.6522 4.95361 14.8493 5.15069C15.0464 5.34776 15.0464 5.65224 14.8493 5.84931L10.6986 10L14.8493 14.1507Z" fill="black"/>
  </svg>
</a>
<%

  }
%>
</body>
</html>
