package controller.web.manageHotelInfomation.manageRoomInfomation;

import connection.HotelDAO;
import connection.HotelImageDAO;
import connection.RoomDAO;
import connection.RoomImageDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Hotel;
import model.HotelImage;
import model.RoomImage;

@WebServlet(urlPatterns = {"/delete-room"})
public class RemoveRoom extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idDel = req.getParameter("idDel");
        String idHotel = RoomDAO.Instance().getIDHotelbyIdRoom(idDel);
        String username = (String) req.getSession().getAttribute("username");
        boolean isOwnHotel = HotelDAO.Instance().hotelIsOwnByUsername(Integer.parseInt(idHotel), username);
        if (isOwnHotel) {
            boolean check = false;

            try {
                RoomDAO.Instance().deleteRoomById(idDel);
                check = true;
            } catch (Exception e) {
                check = false;
            }

            getData(req, resp);
            System.out.println("hi");

            String mes;
            req.setAttribute("addSuccess", check);
            if (check == true) {
                mes = "Đã xóa phòng thành công";
            } else {
                mes = "Xóa phòng thất bại";
            }
            req.setAttribute("message", mes);

            RequestDispatcher rd = req.getRequestDispatcher("/web/manage-hotel-room.jsp");
            rd.forward(req, resp);
        }

    }

    public void getData(HttpServletRequest req, HttpServletResponse resp) {
        //show full username's hotel
        String username = (String) req.getSession().getAttribute("username");
        String idHotel = req.getParameter("idHotel");
        Hotel HotelInfor = HotelDAO.Instance().getShortHotelInfoByID(idHotel);
        ArrayList<HotelImage> listImages = HotelImageDAO.Instance().getShortHotelInfoByID(idHotel);
        ArrayList<RoomImage> listRoom = RoomImageDAO.Instance().getShortRoomInfor(idHotel);
        req.setAttribute("listRoom", listRoom);
        req.setAttribute("hotel", HotelInfor);
        req.setAttribute("listImg", listImages);
        System.out.println(listImages.size());
        // redirect to view username's hotel
    }

}
