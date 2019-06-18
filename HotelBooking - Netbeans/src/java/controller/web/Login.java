package controller.web;

import connection.AccountDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/login", "/logout"})
public class Login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        if (req.getServletPath().equals("/logout")) {
            req.getSession().invalidate();
        }
        RequestDispatcher rd = req.getRequestDispatcher("/web/login.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String username = req.getParameter("tenDangNhap");
        String password = req.getParameter("matKhau");
        String remember = req.getParameter("remember");

        req.setAttribute("wrongAccount", 1);
        if (AccountDAO.Instance().validLogin(username, password)) {
            req.getSession().setAttribute("username", username);
            req.getSession().setAttribute("role", AccountDAO.Instance().getRoleOfUser(username));
            req.getSession().setAttribute("loginStatus", "logined");
            req.getSession().setMaxInactiveInterval(-1);

            resp.sendRedirect("home");
        } else {
            req.setAttribute("wrongAccount", 1);
            RequestDispatcher rd = req.getRequestDispatcher("/web/login.jsp");
            rd.forward(req, resp);
        }

    }
}
