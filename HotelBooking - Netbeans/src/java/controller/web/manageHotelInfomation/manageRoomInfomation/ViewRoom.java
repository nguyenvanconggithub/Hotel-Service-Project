package controller.web.manageHotelInfomation.manageRoomInfomation;

import connection.*;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;

@WebServlet(urlPatterns = {"/manage-hotel-room"})
public class ViewRoom extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        {
                getData(req, resp);
                RequestDispatcher rd = req.getRequestDispatcher("/web/manage-hotel-room.jsp");
                rd.forward(req, resp);
            
        }
    }

    public void getData(HttpServletRequest req, HttpServletResponse resp) {
        //show full username's hotel

        String username = (String) req.getSession().getAttribute("username");
        String idHotel = req.getParameter("id");
        Hotel HotelInfor = HotelDAO.Instance().getShortHotelInfoByID(idHotel);
        ArrayList<HotelImage> listImages = HotelImageDAO.Instance().getShortHotelInfoByID(idHotel);
        ArrayList<RoomImage> listRoom = RoomImageDAO.Instance().getShortRoomInforv2(idHotel);
        req.setAttribute("listRoom", listRoom);
        req.setAttribute("hotel", HotelInfor);
        req.setAttribute("listImg", listImages);
        System.out.println(listRoom.size());
        // redirect to view username's hotel
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    public static void main(String[] args) {
        //ArrayList<RoomImage> listRoom= RoomImageDAO.Instance().getShortRoomInfor();
        // System.out.println(listRoom.get(0).getRoom().getQuantity());
        ArrayList<RoomImage> listImages = RoomImageDAO.Instance().getShortRoomInforv2("1");
        System.out.println(listImages.size());
    }

}
