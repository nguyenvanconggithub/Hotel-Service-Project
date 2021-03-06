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
            int lastPage = 1;
            int range = 5;
            int middle = (int) Math.ceil((float) range / 2);
            int min = 1;
            int max = range;
            String pageRequest = req.getParameter("page");

            //if no pageRequest => load page 1
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
                        }else{
                            max = lastPage;
                            min = max - range + 1;
                        }

                    }
                }
            }

            ArrayList<HotelImage> list = HotelImageDAO.Instance().getShortHotelInfo(page, itemsPerPage);
            req.setAttribute("listShortHotelInfo", list);
            req.setAttribute("page", page);
            req.setAttribute("lastPage", lastPage);
            req.setAttribute("min", min);
            req.setAttribute("max", max);
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
