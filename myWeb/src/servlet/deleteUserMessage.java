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



@WebServlet(description = "检查用户登录信息",urlPatterns = "/deleteUserMessage")
public class deleteUserMessage extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //解决乱码
        resp.setContentType("text/html;charset=utf-8");
        req.setCharacterEncoding("UTF-8");
        PrintWriter out= resp.getWriter();
        String name=req.getParameter("name");
        User user=new User();//注意自动生成的双参的构造方法不完整
        user.setName(name);
        UserDao userDao=new UserDao();
        Boolean userAddStatus = userDao.deleteUser(user);
        if (userAddStatus) {
            RequestDispatcher dispatcher = req.getRequestDispatcher("/jsp/userMessage.jsp");
            dispatcher.forward(req, resp);
        } else if(userAddStatus==false){
            req.setAttribute("error", "用户删除失败");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/jsp/userMessage.jsp");
            dispatcher.forward(req, resp);
        }
    }

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
