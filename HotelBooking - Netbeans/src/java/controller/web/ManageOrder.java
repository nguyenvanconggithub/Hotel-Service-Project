package controller.web;

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

@WebServlet(urlPatterns = {"/manage-order-user", "/manage-order-hotel-manager"})
public class ManageOrder extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getServletPath().equals("/manage-order-user")) {
            getDataUser(req, resp);
            RequestDispatcher rd = req.getRequestDispatcher("/web/manage-order-user.jsp");
            rd.forward(req, resp);
        }
        if (req.getServletPath().equals("/manage-order-hotel-manager")) {
            getDataManager(req, resp);
            RequestDispatcher rd = req.getRequestDispatcher("/web/manage-order-hotel-manager.jsp");
            rd.forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    public void getDataUser(HttpServletRequest req, HttpServletResponse resp) {

        String username = (String) req.getSession().getAttribute("username");
        System.out.println(username);
        int idUser = UserDAO.Instance().getIdUserByUserName(username);
        System.out.println(idUser);
        //phân trang
        int itemsPerPage = 5;
        int page = 1;
        int totalItem = BookingDAO.Instance().countListHotelByIdUser(idUser);
        int lastPage = 1;
        int range = 5;
        int middle = (int) Math.ceil((float) range / 2);
        int min = 1;
        int max = range;
        String pageRequest = req.getParameter("page");
        if (pageRequest == null) {
            lastPage = (int) Math.ceil((float) totalItem / itemsPerPage);
            if (lastPage <= range) {
                min = 1;
                page = 1;
                max = lastPage;
            }
            if (lastPage > range) {
                min = 1;
                page = 1;
                max = range;
            }

        } else { // if user request a page
            page = Integer.parseInt(pageRequest);
            lastPage = (int) Math.ceil((float) totalItem / itemsPerPage);
            if (page <= 0) {
                page = 1;
            }
            if (page > lastPage) {
                page = lastPage;
            }
            if (lastPage <= range) {
                min = 1;
                max = lastPage;
            } else {
                if (page >= middle + 1) {
                    if (page + middle - 1 <= lastPage) {
                        min = page - middle + 1;
                        max = page + middle - 1;
                    } else {
                        max = lastPage;
                        min = max - range + 1;
                    }

                }
            }
        }
        req.setAttribute("page", page);
        req.setAttribute("lastPage", lastPage);
        req.setAttribute("min", min);
        req.setAttribute("max", max);
        System.out.println("min: " + min + "| max: " + max);
        //end phân trang
        ArrayList<Booking> listHotel = BookingDAO.Instance().getListHotelByIdUser(idUser, page, itemsPerPage);
        req.setAttribute("listHotel", listHotel);
        ArrayList<HotelUltilities> listUtilHotel = HotelUltilitiesDAO.Instance().getALLUtilByID();
        req.setAttribute("listUtil", listUtilHotel);
        //lấy giá hotel  //lấy ảnh //list cancle and notCancle
        ArrayList<Integer> listIDCancel = new ArrayList<>();
        ArrayList<Integer> listIdNotCancel = new ArrayList<>();
        ArrayList<HotelImage> listImg = new ArrayList<>();
        ArrayList<Room> listCost = new ArrayList<>();
        for (Booking booking : listHotel) {
            HotelImage hotelImage = HotelImageDAO.Instance().getHotelImageByID(booking.getHotel().getIdHotel());
            listImg.add(hotelImage);
            Room oneRecord = new Room();
            ArrayList<Room> listRooms = DetailBookingDAO.Instance().getListRoomBooking(booking.getIdBooking());
            int countDate = BookingDAO.Instance().getDateById(booking.getIdBooking());
            int totalCostRoom = 0;
            for (Room room : listRooms) {
                totalCostRoom += (RoomDAO.Instance().getCostById(room.getIdRoom())*room.getQuantity());

            }

            totalCostRoom = totalCostRoom * countDate;
            oneRecord.setIdRoom(booking.getIdBooking());
            oneRecord.setCost(totalCostRoom);
            listCost.add(oneRecord);

            if (DetailBookingDAO.Instance().getHotelCancelByID(booking.getUser().getIdUser(), booking.getHotel().getIdHotel()) == 0) {
                listIDCancel.add(booking.getHotel().getIdHotel());
            } else {
                listIdNotCancel.add(booking.getHotel().getIdHotel());
            }
        }
        req.setAttribute("listCost", listCost);
        req.setAttribute("listImg", listImg);
        req.setAttribute("listCancel", listIDCancel);
        req.setAttribute("listNotCancel", listIdNotCancel);
    }

    public void getDataManager(HttpServletRequest req, HttpServletResponse resp) {
        String username = (String) req.getSession().getAttribute("username");
        //phân trang
        int itemsPerPage = 10;
        int page = 1;
        int totalItem = BookingDAO.Instance().countBooking(username);
        System.out.println(totalItem);
        int lastPage = 1;
        int range = 5;
        int middle = (int) Math.ceil((float) range / 2);
        int min = 1;
        int max = range;
        String pageRequest = req.getParameter("page");
        if (pageRequest == null) {
            lastPage = (int) Math.ceil((float) totalItem / itemsPerPage);
            if (lastPage <= range) {
                min = 1;
                page = 1;
                max = lastPage;
            }
            if (lastPage > range) {
                min = 1;
                page = 1;
                max = range;
            }

        } else { // if user request a page
            page = Integer.parseInt(pageRequest);
            lastPage = (int) Math.ceil((float) totalItem / itemsPerPage);
            if (page <= 0) {
                page = 1;
            }
            if (page > lastPage) {
                page = lastPage;
            }
            if (lastPage <= range) {
                min = 1;
                max = lastPage;
            } else {
                if (page >= middle + 1) {
                    if (page + middle - 1 <= lastPage) {
                        min = page - middle + 1;
                        max = page + middle - 1;
                    } else {
                        max = lastPage;
                        min = max - range + 1;
                    }

                }
            }
        }
        req.setAttribute("page", page);
        req.setAttribute("lastPage", lastPage);
        req.setAttribute("min", min);
        req.setAttribute("max", max);
        System.out.println("min: " + min + "| max: " + max);
        //end phân trang
        ArrayList<Room> listCost = new ArrayList<>();
        ArrayList<DetailBooking> listManager = DetailBookingDAO.Instance().getAllListBooking(username,page, itemsPerPage);
        for (DetailBooking booking : listManager) {
            Room oneRecord = new Room();
            ArrayList<Room> listRooms = DetailBookingDAO.Instance().getListRoomBooking(booking.getBooking().getIdBooking());
            int countDate = BookingDAO.Instance().getDateById(booking.getBooking().getIdBooking());
            int totalCostRoom = 0;
            for (Room room : listRooms) {
                totalCostRoom += (RoomDAO.Instance().getCostById(room.getIdRoom())*room.getQuantity());
            }

            totalCostRoom = totalCostRoom * countDate;
            oneRecord.setIdRoom(booking.getBooking().getIdBooking());
            oneRecord.setCost(totalCostRoom);
            listCost.add(oneRecord);
        }
        req.setAttribute("listBooking", listManager);
        req.setAttribute("listCost", listCost);
    }

    public static void main(String[] args) {
        ArrayList<Booking> listHotel = BookingDAO.Instance().getListHotelByIdUser(2, 1, 4);
        ArrayList<HotelImage> listImg = new ArrayList<>();
        ArrayList<Room> listCost = new ArrayList<>();
        for (Booking booking : listHotel) {
            HotelImage hotelImage = HotelImageDAO.Instance().getHotelImageByID(booking.getHotel().getIdHotel());
            listImg.add(hotelImage);
            Room oneRecord = new Room();
            ArrayList<Room> listRooms = DetailBookingDAO.Instance().getListRoomBooking(booking.getIdBooking());
            int countDate = BookingDAO.Instance().getDateById(booking.getIdBooking());
            int totalCostRoom = 0;
            for (Room room : listRooms) {
                totalCostRoom += (RoomDAO.Instance().getCostById(room.getIdRoom())*room.getQuantity());

            }

            totalCostRoom = totalCostRoom * countDate;
            oneRecord.setIdRoom(booking.getIdBooking());
            oneRecord.setCost(totalCostRoom);
            listCost.add(oneRecord);
            System.out.println(totalCostRoom+ " | " +countDate+" | "+booking.getIdBooking());

        }

    }
}
