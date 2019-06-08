package controller.web;

import connection.AccountDAO;
import connection.UserDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/register")
public class Register extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("/web/register.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        int StatusActive = 1;
        String username = req.getParameter("tenTaiKhoan");
        String pass = req.getParameter("matKhau");
        String name = req.getParameter("hoTen");
        String email = req.getParameter("email");
        String SDT = req.getParameter("SDT");
        String role = req.getParameter("role");
        if(role.equals("Đăng Ký làm Chủ Khách Sạn"))
            role = "1";
        if(role.equals("Đăng Ký làm Người Dùng"))
            role = "2";
        if(AccountDAO.Instance().alreadyExistsUsername(username)){
            req.setAttribute("message",0);
            System.out.println("Already have this account");
        }
        else{
            AccountDAO.Instance().addNewAccount(username, pass, role, StatusActive);
            UserDAO.Instance().addNewUser(name, email, SDT, username);
            req.setAttribute("message",1);
            System.out.println("Success Register");
        }
        RequestDispatcher rd = req.getRequestDispatcher("/web/register.jsp");
        rd.forward(req, resp);
    }
}
