package controller.web;

import connection.HotelImageDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.HotelImage;

@WebServlet(urlPatterns = "/home")
public class Home extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getServletPath().equals("/home")) {
            //get List Data Hotel
            ArrayList<HotelImage> list = HotelImageDAO.Instance().getShortHotelInfo();
            req.setAttribute("listShortHotelInfo", list);
            System.out.println(list.size());
            //re-direct to web/index.jsp
            RequestDispatcher rd = req.getRequestDispatcher("/web/index.jsp");
            rd.forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

}
