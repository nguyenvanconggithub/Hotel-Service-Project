package controller.web;

import connection.BedDAO;
import connection.BookingDAO;
import connection.DetailBookingDAO;
import connection.HotelDAO;
import connection.HotelImageDAO;
import connection.HotelUltilitiesDAO;
import connection.RoomDAO;
import connection.RoomImageDAO;
import connection.RoomTypeDAO;
import connection.RoomUltilitiesDAO;
import connection.UserDAO;
import java.io.IOException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DetailBooking;
import model.Hotel;
import model.HotelImage;
import model.Room;
import model.RoomImage;
import model.User;

@WebServlet(urlPatterns = {"/book-hotel"})
public class OrderHotel extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String loginStatus = "";
        if (req.getSession().getAttribute("loginStatus") != null) {
            loginStatus = (String) req.getSession().getAttribute("loginStatus");
        }
        //auto fill in user Info form if logined
        if (loginStatus.equals("logined")) {
            String username = (String) req.getSession().getAttribute("username");
            User userInfo = UserDAO.Instance().getUserInfoByUsername(username);
            req.setAttribute("userInfo", userInfo);
        }
        //get Hotel Info by ID
        if (req.getParameter("idHotel") != null && req.getParameterValues("idRoom") != null && req.getParameterValues("roomOrder") != null) {
            String idHotel = req.getParameter("idHotel");
            String[] listIDRoom = req.getParameterValues("idRoom");
            String[] listRoomOrder = req.getParameterValues("roomOrder");
            //getCookie about user's searching
            String bdayCheckin = "";
            String bdayCheckout = "";

            for (Cookie cookie : req.getCookies()) {
                if (cookie.getName().equals("bdayCheckin")) {
                    bdayCheckin = URLDecoder.decode(cookie.getValue(), "UTF-8");
                }
                if (cookie.getName().equals("bdayCheckout")) {
                    bdayCheckout = URLDecoder.decode(cookie.getValue(), "UTF-8");
                }
            }
            LocalDate checkIn = LocalDate.parse(bdayCheckin, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
            LocalDate checkOut = LocalDate.parse(bdayCheckout, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
            Period period = Period.between(checkIn, checkOut);

            //get Hotel Info (HotelImageDAO) (full image, name, rate, star, utilities)
            Hotel hotelInfo = HotelDAO.Instance().getHotelByID(Integer.parseInt(idHotel));
            ArrayList<HotelImage> hotelImages = HotelImageDAO.Instance().getShortHotelInfoByID(idHotel);
            ArrayList<String> hotelUtilities = HotelUltilitiesDAO.Instance().listUtilitiesNameOfIDHotel(Integer.parseInt(idHotel));
            //req.setAttribute() hotel info
            req.setAttribute("listHotelImages", hotelImages);
            req.setAttribute("hotelUtilities", hotelUtilities);
            req.setAttribute("hotelInfo", hotelInfo);

            req.setAttribute("bdayCheckin", bdayCheckin);
            req.setAttribute("bdayCheckout", bdayCheckout);
            req.setAttribute("periodDay", period.getDays());
            //get ArrayList Room by List ID
            //Get Info displayRoom
            ArrayList<Room> listRoom = new ArrayList<Room>();
            ArrayList<ArrayList<RoomImage>> listFullRoomImages = new ArrayList<ArrayList<RoomImage>>();
            ArrayList<ArrayList<String>> listFullRoomUltilities = new ArrayList<ArrayList<String>>();
            ArrayList<String> listRoomBed = new ArrayList<String>();
            ArrayList<String> listRoomTypeName = new ArrayList<String>();

            //FOREACH room in list
            for (String idRoom : listIDRoom) {
                //getFullRoomImagebyIdRoom
                Room room = RoomDAO.Instance().getRoomInfoByIDRoom(Integer.parseInt(idRoom));
                listRoom.add(room);
                ArrayList<RoomImage> listRoomImages = RoomImageDAO.Instance().getListImg(String.valueOf(idRoom));
                listFullRoomImages.add(listRoomImages);
                //getListRoomUtilities
                ArrayList<String> listRoomUltilities = RoomUltilitiesDAO.Instance().getListUtilityNameByIDRoom(Integer.parseInt(idRoom));
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
            req.setAttribute("numberOrder", listRoomOrder);
            //dispatcher forward book-hotel.jsp
            RequestDispatcher rd = req.getRequestDispatcher("/web/book-hotel.jsp");
            rd.forward(req, resp);

        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idUser = -1;
        req.setCharacterEncoding("UTF-8");
        String idHotel = "";
        String checkin = "";
        String checkout = "";
        String orderTime = "";
        String note = "";
        String[] listIDRoom, listBookingNumber, listGuestName;
        //if logined
        if (req.getSession().getAttribute("username") != null) {
            //get idUser by username
            String username = (String) req.getSession().getAttribute("username");
            idUser = UserDAO.Instance().getUserInfoByUsername(username).getIdUser();
        } else { //if NOT logined
            //get name, phone, email

            String name = req.getParameter("fullname");
            String phone = req.getParameter("phone");
            String email = req.getParameter("email");
            //make new user by name, phone, email
            UserDAO.Instance().addNewUser(name, email, phone, "guestBooking"); //guestBooking is username for Guest not login
            //get newest idUser by name, phone, email
            idUser = UserDAO.Instance().getNewestIDUserBy(name, phone, email);
        }
        //get list IDRoom, list bookingNumber
        listIDRoom = req.getParameterValues("idRoom");
        listBookingNumber = req.getParameterValues("orderNumber");
        listGuestName = req.getParameterValues("guestName");
        //get idHotel, checkin, checkout, orderTime, note
        idHotel = RoomDAO.Instance().getIDHotelbyIdRoom(listIDRoom[0]);
        for (Cookie cookie : req.getCookies()) {
            if (cookie.getName().equals("bdayCheckin")) {
                checkin = cookie.getValue();
            }
            if (cookie.getName().equals("bdayCheckout")) {
                checkout = cookie.getValue();
            }
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        orderTime = sdf.format(new Date());
        note = req.getParameter("note");
        //Store in Table Booking
        BookingDAO.Instance().addNewBooking(String.valueOf(idUser), checkin, checkout, orderTime, note, idHotel);
        //get idBooking
        int idBooking = BookingDAO.Instance().newestIDBookingBy(String.valueOf(idUser));
        //get list guestName
        //if mainGuest is on -> full list guest name = name by iduser
        //else get list guestName from Parameter
        int count = 0;
        for (String idRoom : listIDRoom) {
            //check if idRoomOwnByIdHotel
            if (RoomDAO.Instance().isRoomBelongHotel(idRoom, idHotel)) {
                //add new DetailBooking
                DetailBooking detailBooking = new DetailBooking();
                detailBooking.getBooking().setIdBooking(idBooking);
                detailBooking.getRoom().setIdRoom(Integer.parseInt(idRoom));
                detailBooking.setBookingNumber(Integer.parseInt(listBookingNumber[count]));
                detailBooking.setStatus(1);
                if (req.getParameter("isMainGuest") != null) {
                    detailBooking.setOwnRoomName(req.getParameter("fullname"));
                } else {
                    detailBooking.setOwnRoomName(listGuestName[count]);
                }

                DetailBookingDAO.Instance().addNewDetailBooking(detailBooking);
                RoomDAO.Instance().updateRoomLeft(Integer.parseInt(idRoom), detailBooking.getBookingNumber(), 0);
            } else {
                return;
            }
            count++;
        }
        //redirect to detail screen
        String redirectURL = "detail-booking?idBooking=" + idBooking;
        resp.sendRedirect(redirectURL);
    }
}
