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
            int totalItem = HotelImageDAO.Instance().numberOfHotel();
            System.out.println(totalItem + "Totol");
            int itemsPerPage = 10;
            int page = 1;
            String pageRequest = req.getParameter("page");
            if(pageRequest != null){
                page = Integer.parseInt(pageRequest);
                if(page <= 0){page = 1;}
                System.out.println("Item:" + Math.ceil((float)totalItem/itemsPerPage));
                if(page > Math.ceil((float)totalItem/itemsPerPage)){
                    page = (int)Math.ceil((float)totalItem/itemsPerPage);
                }
            }
            
            ArrayList<HotelImage> list = HotelImageDAO.Instance().getShortHotelInfo(page,itemsPerPage);
            req.setAttribute("listShortHotelInfo", list);
            req.setAttribute("page", page);
            
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
