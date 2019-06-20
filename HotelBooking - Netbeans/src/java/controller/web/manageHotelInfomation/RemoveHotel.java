package controller.web.manageHotelInfomation;

import connection.HotelDAO;
import connection.HotelImageDAO;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.HotelImage;

@WebServlet(urlPatterns = {"/remove-hotel"})
public class RemoveHotel extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String HOTEL_MANAGER = "1";
        if (req.getParameter("id") != null) {
            int idHotel = Integer.parseInt(req.getParameter("id"));
            String username = (String) req.getSession().getAttribute("username");
            String role = (String) req.getSession().getAttribute("role");

            if (role.equals(HOTEL_MANAGER) && HotelDAO.Instance().hotelIsOwnByUsername(idHotel, username)) {

                boolean removeSuccess = false;
                removeSuccess = HotelDAO.Instance().removeHotelByID(idHotel);

                req.setAttribute("removeResult", removeSuccess);
                if (removeSuccess == true) {
                    req.setAttribute("message", "Xóa Thành Công !");
                } else {
                    req.setAttribute("message", "Xóa lỗi, Contact us at footer");
                }
                ArrayList<HotelImage> listOwnHotel = HotelImageDAO.Instance().getShortHotelInfoByUsername(username);
                req.setAttribute("list", listOwnHotel);
                System.out.println(listOwnHotel.size());
                //redirect to view username's hotel
                RequestDispatcher rd = req.getRequestDispatcher("/web/manage-hotel-infomation.jsp");
                rd.forward(req, resp);
            }
        }
    }

}
