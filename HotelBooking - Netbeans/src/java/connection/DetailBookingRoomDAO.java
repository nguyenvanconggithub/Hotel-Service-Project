package connection;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;
@WebServlet(urlPatterns = {"/detail-booking"})
public class DetailBookingRoomDAO extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp); //To change body of generated methods, choose Tools | Templates.
    }
    public void getData(HttpServletRequest req,HttpServletResponse resp){
        String idHotel = req.getParameter("id");
        Hotel HotelInfor = HotelDAO.Instance().getShortHotelInfoByID(idHotel);
       // HotelUltilities listHotelUtil= HotelUltilitiesDAO.Instance().listIDUtilitiesOfIDHotel(idHotel);
       // HotelImage listHotelImg= HotelImageDAO.Instance().getShortHotelInfoByID(idHotel);
    }
}
