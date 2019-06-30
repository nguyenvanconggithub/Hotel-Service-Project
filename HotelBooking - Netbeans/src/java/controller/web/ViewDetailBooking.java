package controller.web;

import connection.AccountDAO;
import connection.BookingDAO;
import connection.DetailBookingDAO;
import connection.HotelImageDAO;
import connection.RoomImageDAO;
import connection.RoomUltilitiesDAO;
import connection.UltilitiesDAO;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.concurrent.TimeUnit;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Booking;
import model.DetailBooking;
import model.Hotel;
import model.HotelImage;
import model.RoomImage;
import model.ShowRoom;
import model.Utilities;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author onglu
 */
@WebServlet(urlPatterns = "/order-detail")
public class ViewDetailBooking extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idBooking = req.getParameter("idBooking");
//        idBooking = "1";

        Booking booking = BookingDAO.Instance().getBookingByIdBooking(Integer.parseInt(idBooking));
        ArrayList<DetailBooking> detailBookingRooms = DetailBookingDAO.Instance().getListDetailBookingByIdBooking(booking.getIdBooking());

        String work = req.getParameter("is");
        String idRoom = req.getParameter("idroom");
        if (idRoom != null) {
            int roomnuber = 0;
            ArrayList<DetailBooking> detailBookings=new ArrayList<>();
            if (!work.equals("all")) {
                roomnuber = DetailBookingDAO.Instance().getOneDeaitlBooking(Integer.parseInt(idBooking), Integer.parseInt(idRoom)).getBookingNumber();
            } else {
                 for(int i=0;i<detailBookingRooms.size();i++){
                     if(detailBookingRooms.get(i).getStatus()==1){
                         detailBookings.add(detailBookingRooms.get(i));
                     }
                 }
            }
            DetailBookingDAO.Instance().updateStatus(Integer.parseInt(idBooking), Integer.parseInt(idRoom), roomnuber,detailBookings, work);
        }

        //load lại khi hủy
        detailBookingRooms = DetailBookingDAO.Instance().getListDetailBookingByIdBooking(booking.getIdBooking());
        
        int roomNumber = 0;
        int maxPeople = 0;
        int cost = 0;
        int totalCost=0;
        for (int i = 0; i < detailBookingRooms.size(); i++) {
            roomNumber += detailBookingRooms.get(i).getBookingNumber();
            maxPeople += detailBookingRooms.get(i).getRoom().getPeople();
        }

        //get hotelImage
        ArrayList<HotelImage> hotelImages = HotelImageDAO.Instance().getShortHotelInfoByID(String.valueOf(booking.getHotel().getIdHotel()));

        //get tiện ich khách sạn
        ArrayList<Utilities> utilitieses = UltilitiesDAO.Instance().getListUtilitiesByIdHotel(booking.getHotel().getIdHotel());

        long time = booking.getCheckOut().getTime() - booking.getCheckIn().getTime();
        int ngay = (int) TimeUnit.MILLISECONDS.toDays(time);

        ArrayList<ShowRoom> showRooms = new ArrayList<>();
        for (int i = 0; i < detailBookingRooms.size(); i++) {
            ShowRoom showRoom = new ShowRoom();
            showRoom.setRoomImages(RoomImageDAO.Instance().getListImg(String.valueOf(detailBookingRooms.get(i).getRoom().getIdRoom())));
            showRoom.setRoomUltilities(RoomUltilitiesDAO.Instance().getListUtilityRoomByIDRoom(detailBookingRooms.get(i).getRoom().getIdRoom()));
            showRoom.setRoomType(detailBookingRooms.get(i).getRoom().getRoomType());
            showRoom.setDetailBookingRoom(detailBookingRooms.get(i));
            showRoom.setGia(ngay * showRoom.getDetailBookingRoom().getBookingNumber() * showRoom.getRoomImages().get(0).getRoom().getCost());
            showRoom.setHotelMangerAccount(AccountDAO.Instance().getAccountByIdRoom(detailBookingRooms.get(i).getRoom().getIdRoom()));
            showRooms.add(showRoom);
            
            totalCost+= showRoom.getGia();
            if (showRoom.getDetailBookingRoom().getStatus() != 0) {
                cost += showRoom.getGia();
            }
        }

        Account account = AccountDAO.Instance().getAccountByIdBooking(Integer.parseInt(idBooking));
        int emtyRoom;
        if(cost==0){
            emtyRoom=1;
            cost=totalCost;
        }else{
            emtyRoom=0;
        }
        

        req.setAttribute("booking", booking);
        req.setAttribute("roomNumber", roomNumber);
        req.setAttribute("maxPeople", maxPeople);
        req.setAttribute("cost", cost);
        req.setAttribute("hotel", booking.getHotel());
        req.setAttribute("hotelimage", hotelImages);
        req.setAttribute("ultiHotel", utilitieses);
        req.setAttribute("showRooms", showRooms);
        req.setAttribute("account", account);
        req.setAttribute("emtyRoom", emtyRoom);

        RequestDispatcher rd = req.getRequestDispatcher("/web/order-detail.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
