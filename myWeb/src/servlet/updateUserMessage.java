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



@WebServlet(description = "检查用户登录信息",urlPatterns = "/updateUserMessage")
public class updateUserMessage extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //解决乱码
        resp.setContentType("text/html;charset=utf-8");
        req.setCharacterEncoding("UTF-8");
        String name=req.getParameter("name");
        String password=req.getParameter("password");
        User user=new User();
        user.setName(name);
        user.setPassword(password);
        UserDao UserDao=new UserDao();
        Boolean userUpStatus = UserDao.updateUser(user);
        if (userUpStatus) {
            RequestDispatcher dispatcher = req.getRequestDispatcher("/jsp/userMessage.jsp");
            dispatcher.forward(req, resp);
        } else if(userUpStatus==false){
            req.setAttribute("error", "用户更新失败");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/jsp/userMessage.jsp");
            dispatcher.forward(req, resp);
        }
    }

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
