package servlet;

import bean.User;
import dao.UserDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(description = "检查用户登录信息",urlPatterns = "/UserLogin")
public class UserLogin extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //解决乱码
        resp.setContentType("text/html;charset=utf-8");
        req.setCharacterEncoding("UTF-8");

        PrintWriter out= resp.getWriter();
        String name=req.getParameter("username");
        String password=req.getParameter("password");
        User user=new User(name,password);
        UserDao userDao=new UserDao();
        int userExists = userDao.checkIfHaveUser(user);
        if (userExists==0) {
            req.setAttribute("error", "用户不存在");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/jsp/index.jsp");
            dispatcher.forward(req, resp);
        } else if(userExists==1){
            int passwordCorrect = userDao.checkUserPswd(user);
            if (passwordCorrect==1) {
                resp.sendRedirect("jsp/userHomePage.jsp");
            } else if (passwordCorrect==0) {
                req.setAttribute("error", "用户密码错误");
                RequestDispatcher dispatcher = req.getRequestDispatcher("/jsp/index.jsp");
                dispatcher.forward(req, resp);
            }else if(userExists==-1){
                req.setAttribute("error", "数据库访问异常");
                RequestDispatcher dispatcher = req.getRequestDispatcher("/jsp/index.jsp");
                dispatcher.forward(req, resp);
            }
        }else if(userExists==-1){
            req.setAttribute("error", "数据库访问异常");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/jsp/index.jsp");
            dispatcher.forward(req, resp);
        }

    }

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
