package controller.admin;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;
import connection.*;
import java.util.ArrayList;

@WebServlet(urlPatterns = "/manage-account")
public class ManageAccount extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getData(req, resp);
         if (req.getParameter("status") != null && req.getParameter("userName") != null) {
            int stt = Integer.valueOf((req.getParameter("status")));
            String useName = req.getParameter("userName");
            AccountDAO.Instance().updateAccount(useName, stt);

        }
        RequestDispatcher rd = req.getRequestDispatcher("/admin/manage-account.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); //To change body of generated methods, choose Tools | Templates.
    }

    public void getData(HttpServletRequest req, HttpServletResponse resp) {
        //phân trang
        int itemsPerPage = 20;
        int page = 1;
        int totalItem = UserDAO.Instance().countAccount();
        int lastPage = 1;
        int range = 5;
        int middle = (int) Math.ceil((float) range / 2);
        int min = 1;
        int max = range;
        String pageRequest = req.getParameter("page");
        if (pageRequest == null) {
            lastPage = (int) Math.ceil((float) totalItem / itemsPerPage);
            if (lastPage <= range) {
                min = 1;
                page = 1;
                max = lastPage;
            }
            if (lastPage > range) {
                min = 1;
                page = 1;
                max = range;
            }

        } else { // if user request a page
            page = Integer.parseInt(pageRequest);
            lastPage = (int) Math.ceil((float) totalItem / itemsPerPage);
            if (page <= 0) {
                page = 1;
            }
            if (page > lastPage) {
                page = lastPage;
            }
            if (lastPage <= range) {
                min = 1;
                max = lastPage;
            } else {
                if (page >= middle + 1) {
                    if (page + middle - 1 <= lastPage) {
                        min = page - middle + 1;
                        max = page + middle - 1;
                    } else {
                        max = lastPage;
                        min = max - range + 1;
                    }

                }
            }
        }
        req.setAttribute("page", page);
        req.setAttribute("lastPage", lastPage);
        req.setAttribute("min", min);
        req.setAttribute("max", max);
        System.out.println("min: " + min + "| max: " + max);
        //end phân trang
        ArrayList<User> listAcc = UserDAO.Instance().getAllUser(page, itemsPerPage);
        req.setAttribute("listAcc", listAcc);
       
    }
}
