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



@WebServlet(description = "检查用户登录信息",urlPatterns = "/addUserMessage")
public class addUserMessage extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //解决乱码
        resp.setContentType("text/html;charset=utf-8");
        req.setCharacterEncoding("UTF-8");
        PrintWriter out= resp.getWriter();
        try {
            String name = req.getParameter("name");
            String password = req.getParameter("password");

            // 检查 name 是否为空
            if (name == null || name.trim().isEmpty()) {
                req.setAttribute("error", "用户名不能为空");
                RequestDispatcher dispatcher = req.getRequestDispatcher("/jsp/userMessage.jsp");
                dispatcher.forward(req, resp);
                return;
            }
            // 检查 password 是否为空
            if (password == null || password.trim().isEmpty()) {
                req.setAttribute("error", "密码不能为空");
                RequestDispatcher dispatcher = req.getRequestDispatcher("/jsp/userMessage.jsp");
                dispatcher.forward(req, resp);
                return;
            }
            User user = new User();
            user.setName(name);
            user.setPassword(password);
            UserDao userDao = new UserDao();
            Boolean userAddStatus = userDao.addUser(user);
            if (userAddStatus) {
                RequestDispatcher dispatcher = req.getRequestDispatcher("/jsp/userMessage.jsp");
                dispatcher.forward(req, resp);
            } else {
                req.setAttribute("error", "增加用户失败");
                RequestDispatcher dispatcher = req.getRequestDispatcher("/jsp/userMessage.jsp");
                dispatcher.forward(req, resp);
            }
        } catch (Exception e) {
            req.setAttribute("error", "增加用户时出现错误");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/jsp/userMessage.jsp");
            dispatcher.forward(req, resp);
        }
    }

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
