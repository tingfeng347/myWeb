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



@WebServlet(description = "检查用户登录信息",urlPatterns = "/addStudentMessage")
public class addStudentMessage extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //解决乱码
        resp.setContentType("text/html;charset=utf-8");
        req.setCharacterEncoding("UTF-8");
        PrintWriter out= resp.getWriter();
        try {
            String sno = req.getParameter("sno");
            String name = req.getParameter("name");
            int age = Integer.parseInt(req.getParameter("age"));
            String sex = req.getParameter("sex");
            double height = Double.parseDouble(req.getParameter("height"));
            double weight = Double.parseDouble(req.getParameter("weight"));
            int fhl = Integer.parseInt(req.getParameter("fhl"));
            double tqq = Double.parseDouble(req.getParameter("tqq"));

            // 检查每个字段是否为空
            if (sno == null || sno.trim().isEmpty() ||
                    name == null || name.trim().isEmpty() ||
                    req.getParameter("age") == null || req.getParameter("age").trim().isEmpty() ||
                    sex == null || sex.trim().isEmpty() ||
                    req.getParameter("height") == null || req.getParameter("height").trim().isEmpty() ||
                    req.getParameter("weight") == null || req.getParameter("weight").trim().isEmpty() ||
                    req.getParameter("fhl") == null || req.getParameter("fhl").trim().isEmpty() ||
                    req.getParameter("tqq") == null || req.getParameter("tqq").trim().isEmpty()) {
                req.setAttribute("error", "输入的表单项有空值,请检查");
                RequestDispatcher dispatcher = req.getRequestDispatcher("/jsp/adminStuMessage.jsp");
                dispatcher.forward(req, resp);
                return;
            }

            Student student = new Student(sno, name, age, sex, height, weight, fhl, tqq);
            StudentDao studentDao = new StudentDao();
            Boolean stuAddStatus = studentDao.addStudent(student);

            if (stuAddStatus) {
                RequestDispatcher dispatcher = req.getRequestDispatcher("/jsp/adminStuMessage.jsp");
                dispatcher.forward(req, resp);
            } else {
                req.setAttribute("error", "增加学生信息失败");
                RequestDispatcher dispatcher = req.getRequestDispatcher("/jsp/adminStuMessage.jsp");
                dispatcher.forward(req, resp);
            }
        } catch (NumberFormatException e) {
            req.setAttribute("error", "输入的表单项格式不正确,请检查");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/jsp/adminStuMessage.jsp");
            dispatcher.forward(req, resp);
        } catch (Exception e) {
            req.setAttribute("error", "增加学生信息时出现错误");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/jsp/adminStuMessage.jsp");
            dispatcher.forward(req, resp);
        }
    }

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
