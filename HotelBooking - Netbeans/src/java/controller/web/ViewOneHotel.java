package controller.web;

import connection.BedDAO;
import connection.DetailBookingDAO;
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
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
//import javax.security.auth.message.callback.PrivateKeyCallback;
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
            boolean searched = false;

            for (Cookie cookie : req.getCookies()) {
                if (cookie.getName().equals("address")) {
                    address = URLDecoder.decode(cookie.getValue(), "UTF-8");
                    searched = true;
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

            //get Hotel Info (HotelImageDAO) (full image, name, rate, star, utilities)
            Hotel hotelInfo = HotelDAO.Instance().getHotelByID(Integer.parseInt(idHotel));
            ArrayList<HotelImage> hotelImages = HotelImageDAO.Instance().getShortHotelInfoByID(idHotel);
            ArrayList<String> hotelUtilities = HotelUltilitiesDAO.Instance().listUtilitiesNameOfIDHotel(Integer.parseInt(idHotel));
            //req.setAttribute() hotel info
            req.setAttribute("listHotelImages", hotelImages);
            req.setAttribute("hotelUtilities", hotelUtilities);
            req.setAttribute("hotelInfo", hotelInfo);

            if (searched) {
                LocalDate checkIn = LocalDate.parse(bdayCheckin, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                LocalDate checkOut = LocalDate.parse(bdayCheckout, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                Period period = Period.between(checkIn, checkOut);
                req.setAttribute("periodDay", period.getDays());
                //setAttribute user's searching 
                req.setAttribute("address", address);
                req.setAttribute("bdayCheckin", bdayCheckin);
                req.setAttribute("bdayCheckout", bdayCheckout);
                req.setAttribute("guests", guests);
                req.setAttribute("rooms", rooms);

                //get all idRoom by idHotel
                ArrayList<Room> listRoom = RoomDAO.Instance().getRoomsByIdHotel(idHotel);
                //FOREACH IDROOM to plus more RoomLeft by Criteria(checkin,checkout)
                for (Room room : listRoom) {
                    room.setRoomLeft(room.getRoomLeft()
                            + DetailBookingDAO.Instance().getMoreAvailableRoomLeft(bdayCheckin, bdayCheckout, room.getIdRoom()));
                    if (room.getRoomLeft() > room.getQuantity()) {
                        room.setRoomLeft(room.getQuantity());
                    }
                }

                //Check roomLeft > 0 then ADD TO DisplayRoomList
                ArrayList<Room> displayRoom = new ArrayList<>();
                for (Room room : listRoom) {
                    if (room.getRoomLeft() > 0) {
                        displayRoom.add(room);
                    }
                }
                //FOREACH calc SUM ROOMS and PEOPLES
                int sumRoomsLeft = 0;
                int sumPeoples = 0;
                for (Room room : displayRoom) {
                    sumRoomsLeft += room.getRoomLeft();
                    sumPeoples += room.getPeople() * room.getRoomLeft();
                }

                if (sumRoomsLeft >= Integer.parseInt(rooms) && sumPeoples >= Integer.parseInt(guests)) {

                    //Get Info displayRoom
                    ArrayList<ArrayList<RoomImage>> listFullRoomImages = new ArrayList<ArrayList<RoomImage>>();
                    ArrayList<ArrayList<String>> listFullRoomUltilities = new ArrayList<ArrayList<String>>();
                    ArrayList<String> listRoomBed = new ArrayList<String>();
                    ArrayList<String> listRoomTypeName = new ArrayList<String>();
                    //FOREACH room in list
                    for (Room room : displayRoom) {
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
                    req.setAttribute("listRoom", displayRoom);
                    req.setAttribute("listFullRoomImages", listFullRoomImages);
                    req.setAttribute("listFullRoomUltilities", listFullRoomUltilities);
                    req.setAttribute("listRoomBed", listRoomBed);
                    req.setAttribute("listRoomTypeName", listRoomTypeName);
                    //set search status to jsp
                    req.setAttribute("searched", searched);
                } else {
                    req.setAttribute("noRoomMessage", "(Không có phòng nào phù hợp lệnh tìm kiếm !)");
                }
            } else { //Not Yet Search
                //set Address/Hotel search Bar with hotelName
                req.setAttribute("address", hotelInfo.getHotelName());
                req.setAttribute("guests", 1);
                req.setAttribute("rooms", 1);
                //get Full Room && info
                ArrayList<Room> listRoom = RoomDAO.Instance().getRoomsByIdHotel(idHotel);
                ArrayList<ArrayList<RoomImage>> listFullRoomImages = new ArrayList<ArrayList<RoomImage>>();
                ArrayList<ArrayList<String>> listFullRoomUltilities = new ArrayList<ArrayList<String>>();
                ArrayList<String> listRoomBed = new ArrayList<String>();
                ArrayList<String> listRoomTypeName = new ArrayList<String>();
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
                //set req.Attb room && info
                req.setAttribute("listRoom", listRoom);
                req.setAttribute("listFullRoomImages", listFullRoomImages);
                req.setAttribute("listFullRoomUltilities", listFullRoomUltilities);
                req.setAttribute("listRoomBed", listRoomBed);
                req.setAttribute("listRoomTypeName", listRoomTypeName);
                //set search status to jsp
                req.setAttribute("searched", searched);
            }
            //dispatcher forward one-hotel.jsp
            RequestDispatcher rd = req.getRequestDispatcher("/web/one-hotel.jsp");
            rd.forward(req, resp);
        }

    }

}
