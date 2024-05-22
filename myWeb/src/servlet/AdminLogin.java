package servlet;

import bean.Admin;
import dao.AdminDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(description = "检查管理员登录信息",urlPatterns = "/AdminLogin")
public class AdminLogin extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //解决乱码
        resp.setContentType("text/html;charset=utf-8");
        req.setCharacterEncoding("UTF-8");

        PrintWriter out= resp.getWriter();
        String name=req.getParameter("username");
        String password=req.getParameter("password");
        Admin admin=new Admin(name,password);
        AdminDao adminDao=new AdminDao();
        int adminExists = adminDao.checkIfHaveAdmin(admin);
        if (adminExists==0) {
            req.setAttribute("error", "管理员不存在");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/jsp/adminLogin.jsp");
            dispatcher.forward(req, resp);
        } else if(adminExists==1){
            int passwordCorrect = adminDao.checkAdminPswd(admin);
            if (passwordCorrect==1) {
               resp.sendRedirect("jsp/adminHomePage.jsp");
            } else if (passwordCorrect==0) {
                req.setAttribute("error", "管理员密码错误");
                RequestDispatcher dispatcher = req.getRequestDispatcher("/jsp/adminLogin.jsp");
                dispatcher.forward(req, resp);
            }else if(adminExists==-1){
                req.setAttribute("error", "数据库访问异常");
                RequestDispatcher dispatcher = req.getRequestDispatcher("/jsp/adminLogin.jsp");
                dispatcher.forward(req, resp);
            }
        }else if(adminExists==-1){
            req.setAttribute("error", "数据库访问异常");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/jsp/adminLogin.jsp");
            dispatcher.forward(req, resp);
        }

    }

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
