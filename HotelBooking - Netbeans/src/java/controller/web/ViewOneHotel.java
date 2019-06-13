package controller.web;

import connection.BedDAO;
import connection.HotelDAO;
import connection.HotelImageDAO;
import connection.HotelUltilitiesDAO;
import connection.RoomDAO;
import connection.RoomImageDAO;
import connection.RoomTypeDAO;
import connection.RoomUltilitiesDAO;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import javax.security.auth.message.callback.PrivateKeyCallback;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Bed;
import model.Hotel;
import model.HotelImage;
import model.Room;
import model.RoomImage;
import model.RoomUltilities;

@WebServlet(urlPatterns = {"/ViewOneHotel"})
public class ViewOneHotel extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //check id not null
        if (req.getParameter("id") != null) {
            String idHotel = req.getParameter("id");
            //getCookie about user's searching
            String address = "";
            String bdayCheckin = "";
            String bdayCheckout = "";
            String guests = "1";
            String rooms = "1";
            
            for (Cookie cookie : req.getCookies()) {
                if (cookie.getName().equals("address")) {
                    address = URLDecoder.decode(cookie.getValue(), "UTF-8");
                }
                if (cookie.getName().equals("bdayCheckin")) {
                    bdayCheckin = URLDecoder.decode(cookie.getValue(), "UTF-8");
                }
                if (cookie.getName().equals("bdayCheckout")) {
                    bdayCheckout = URLDecoder.decode(cookie.getValue(), "UTF-8");
                }
                if (cookie.getName().equals("guests")) {
                    guests = URLDecoder.decode(cookie.getValue(), "UTF-8");
                }
                if (cookie.getName().equals("rooms")) {
                    rooms = URLDecoder.decode(cookie.getValue(), "UTF-8");
                }
            }
            //setAttribute user's searching 
            req.setAttribute("address", address);
            req.setAttribute("bdayCheckin", bdayCheckin);
            req.setAttribute("bdayCheckout", bdayCheckout);
            req.setAttribute("guests", guests);
            req.setAttribute("rooms", rooms);
            
            //get Hotel Info (HotelImageDAO) (full image, name, rate, star, utilities)
            Hotel hotelInfo = HotelDAO.Instance().getHotelByID(Integer.parseInt(idHotel));
            ArrayList<HotelImage> hotelImages = HotelImageDAO.Instance().getShortHotelInfoByID(idHotel);
            ArrayList<String> hotelUtilities = HotelUltilitiesDAO.Instance().listUtilitiesNameOfIDHotel(Integer.parseInt(idHotel));
            //req.setAttribute() hotel info
            req.setAttribute("listHotelImages", hotelImages);
            req.setAttribute("hotelUtilities", hotelUtilities);
            req.setAttribute("hotelInfo", hotelInfo);
            //get list room full info by idHotel
            ArrayList<Room> listRoom = RoomDAO.Instance().getRoomsByIdHotel(idHotel);
            ArrayList<ArrayList<RoomImage>> listFullRoomImages = new ArrayList<ArrayList<RoomImage>>();
            ArrayList<ArrayList<String>> listFullRoomUltilities = new ArrayList<ArrayList<String>>();
            ArrayList<String> listRoomBed = new ArrayList<String>();
            ArrayList<String> listRoomTypeName = new ArrayList<String>();
            //FOREACH room in list
            for (Room room : listRoom) {
                //getIdRoom
                int idRoom = room.getIdRoom();
                //getFullRoomImagebyIdRoom
                ArrayList<RoomImage> listRoomImages = RoomImageDAO.Instance().getListImg(String.valueOf(idRoom));
                listFullRoomImages.add(listRoomImages);
                //getListRoomUtilities
                ArrayList<String> listRoomUltilities = RoomUltilitiesDAO.Instance().getListUtilityNameByIDRoom(idRoom);
                listFullRoomUltilities.add(listRoomUltilities);
                //getRoomTypeName
                String roomType = RoomTypeDAO.Instance().getRoomTypeNameByID(room.getRoomType().getIdRoomType());
                listRoomTypeName.add(roomType);
                //getBedNamebyIDBed
                String bedName = BedDAO.Instance().getBedNameByID(room.getBed().getIdBed());
                listRoomBed.add(bedName);
            }
            //END FOREACH
            //req.setAttribute() RoomInfo
            req.setAttribute("listRoom", listRoom);
            req.setAttribute("listFullRoomImages", listFullRoomImages);
            req.setAttribute("listFullRoomUltilities", listFullRoomUltilities);
            req.setAttribute("listRoomBed", listRoomBed);
            req.setAttribute("listRoomTypeName", listRoomTypeName);
            //dispatcher forward one-hotel.jsp
            RequestDispatcher rd = req.getRequestDispatcher("/web/one-hotel.jsp");
            rd.forward(req, resp);
        }

    }

}
