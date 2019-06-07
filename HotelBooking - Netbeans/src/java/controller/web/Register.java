package controller.web;

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
        resp.setCharacterEncoding("UTF-8");
        String username = req.getParameter("tenTaiKhoan");
        String pass = req.getParameter("matKhau");
        String name = req.getParameter("hoTen");
        String email = req.getParameter("email");
        String SDT = req.getParameter("SDT");
        String role = req.getParameter("role");
        
        System.out.println(username + " | " + pass + " | " + name + " | " + email + " | " + SDT + " | " + role);
        RequestDispatcher rd = req.getRequestDispatcher("/web/register.jsp");
        rd.forward(req, resp);
    }
    

}
