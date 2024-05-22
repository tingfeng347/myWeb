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
import java.io.PrintWriter;



@WebServlet(description = "检查用户登录信息",urlPatterns = "/deleteStudentMessage")
public class deleteStudentMessage extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //解决乱码
        resp.setContentType("text/html;charset=utf-8");
        req.setCharacterEncoding("UTF-8");
        PrintWriter out= resp.getWriter();
        String sno=req.getParameter("sno");
        String name= req.getParameter("name");
        Student student=new Student();//注意自动生成的双参的构造方法不完整
        student.setSno(sno);
        student.setName(name);
        StudentDao studentDao=new StudentDao();
        Boolean stuAddStatus = studentDao.deleteStudent(student);
        if (stuAddStatus) {
            RequestDispatcher dispatcher = req.getRequestDispatcher("/jsp/adminStuMessage.jsp");
            dispatcher.forward(req, resp);
        } else if(stuAddStatus==false){
            req.setAttribute("error", "学生信息删除失败");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/jsp/adminStuMessage.jsp");
            dispatcher.forward(req, resp);
        }
    }

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
