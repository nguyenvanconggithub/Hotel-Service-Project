package controller.web.manageHotelInfomation;

import connection.HotelDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/edit-hotel"})
public class EditHotel extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
                String HOTEL_MANAGER = "1";
        String role = (String) req.getSession().getAttribute("role");
        String ownUsername = (String) req.getSession().getAttribute("username");
        int idHotel = Integer.parseInt(req.getParameter("id"));
        boolean isOwnHotel = HotelDAO.Instance().hotelIsOwnByUsername(idHotel, ownUsername);

        if (role.equals(HOTEL_MANAGER) && isOwnHotel) {
            //redirect edit hotel
            RequestDispatcher rd = req.getRequestDispatcher("/web/");
            rd.forward(req, resp);
        }
    }
    
}
