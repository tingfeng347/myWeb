package servlet;

import bean.Student;
import dao.StudentDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;



@WebServlet(description = "检查用户登录信息",urlPatterns = "/updateStudentMessage")
public class updateStudentMessage extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //解决乱码
        resp.setContentType("text/html;charset=utf-8");
        req.setCharacterEncoding("UTF-8");

        String sno=req.getParameter("sno");
        String name=req.getParameter("name");
        int age= Integer.parseInt(req.getParameter("age"));
        String sex=req.getParameter("sex");
        double height= Double.parseDouble(req.getParameter("height"));
        double weight= Double.parseDouble(req.getParameter("weight"));
        int fhl= Integer.parseInt(req.getParameter("fhl"));
        double tqq= Double.parseDouble(req.getParameter("tqq"));
        String temp1 = (String) req.getSession().getAttribute("temp1");
        Student student=new Student();
        student.setSno(temp1);
        student.setName(name);
        student.setAge(age);
        student.setSex(sex);
        student.setHeight(height);
        student.setWeight(weight);
        student.setFhl(fhl);
        student.setTqq(tqq);
        StudentDao studentDao=new StudentDao();
        Boolean stuUpStatus = studentDao.updateStudent(student);
        if (stuUpStatus) {
            RequestDispatcher dispatcher = req.getRequestDispatcher("/jsp/adminStuMessage.jsp");
            dispatcher.forward(req, resp);
        } else if(stuUpStatus==false){
            req.setAttribute("error", "学生信息更新失败");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/jsp/adminStuMessage.jsp");
            dispatcher.forward(req, resp);
        }
    }

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
