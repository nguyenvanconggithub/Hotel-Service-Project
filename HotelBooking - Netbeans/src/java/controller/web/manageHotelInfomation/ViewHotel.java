package controller.web.manageHotelInfomation;

import connection.HotelDAO;
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

@WebServlet(urlPatterns = {"/manage-hotel-infomation"})
public class ViewHotel extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String HOTEL_MANAGER = "1";
        
        if(req.getSession().getAttribute("role").equals(HOTEL_MANAGER)){
            //show full username's hotel
            String username = (String)req.getSession().getAttribute("username");
            ArrayList<HotelImage> listOwnHotel = HotelImageDAO.Instance().getShortHotelInfoByUsername(username);
            req.setAttribute("list", listOwnHotel);
            System.out.println(listOwnHotel.size());
            //redirect to view username's hotel
            RequestDispatcher rd = req.getRequestDispatcher("/web/manage-hotel-infomation.jsp");
            rd.forward(req, resp);
        }

    }

}
