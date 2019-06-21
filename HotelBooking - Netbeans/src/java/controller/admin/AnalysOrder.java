package controller.admin;

import connection.BookingDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Booking;

@WebServlet(urlPatterns = "/analys-order")
public class AnalysOrder extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String ADMIN_ROLE = "0";
        String role = (String) req.getSession().getAttribute("role");
        if (role.equals(ADMIN_ROLE)) {
            sendDataForPC(req, resp);
            sendDataForMobile(req, resp);
            RequestDispatcher rd = req.getRequestDispatcher("/admin/analys-order.jsp");
            rd.forward(req, resp);
        }

    }

    private void sendDataForMobile(HttpServletRequest req, HttpServletResponse resp) {
        int totalItem = BookingDAO.Instance().totalBooking();
        System.out.println(totalItem + "Totol");
        int itemsPerPage = 10;
        int page = 1;
        int lastPageM = 1;
        int range = 5;
        int middle = (int) Math.ceil((float) range / 2);
        int minM = 1;
        int maxM = range;
        String pageRequest = req.getParameter("page");

        //if no pageRequest => load page 1
        if (pageRequest == null) {
            lastPageM = (int) Math.ceil((float) totalItem / itemsPerPage);
            if (lastPageM <= range) {
                minM = 1;
                page = 1;
                maxM = lastPageM;
            }
            if (lastPageM > range) {
                minM = 1;
                page = 1;
                maxM = range;
            }

        } else { // if user request a page
            page = Integer.parseInt(pageRequest);
            lastPageM = (int) Math.ceil((float) totalItem / itemsPerPage);
            if (page <= 0) {
                page = 1;
            }
            if (page > lastPageM) {
                page = lastPageM;
            }
            if (lastPageM <= range) {
                minM = 1;
                maxM = lastPageM;
            } else {
                if (page >= middle + 1) {
                    if (page + middle - 1 <= lastPageM) {
                        minM = page - middle + 1;
                        maxM = page + middle - 1;
                    } else {
                        maxM = lastPageM;
                        minM = maxM - range + 1;
                    }

                }
            }
        }
        ArrayList<Booking> fullBookingInfoM = BookingDAO.Instance().getFullBookingInfo(page, itemsPerPage);
        ArrayList<Integer> fullBookingCostM = new ArrayList<>();
        for (Booking booking : fullBookingInfoM) {
            fullBookingCostM.add(BookingDAO.Instance().totalCostByIdBooking(booking.getIdBooking()));
        }
        req.setAttribute("fullBookingInfoM", fullBookingInfoM);
        req.setAttribute("fullBookingCostM", fullBookingCostM);
        req.setAttribute("pageM", page);
        req.setAttribute("lastPageM", lastPageM);
        req.setAttribute("minM", minM);
        req.setAttribute("maxM", maxM);
    }

    private void sendDataForPC(HttpServletRequest req, HttpServletResponse resp) {
        int totalItem = BookingDAO.Instance().totalBooking();
        System.out.println(totalItem + "Totol");
        int itemsPerPage = 20;
        int page = 1;
        int lastPagePC = 1;
        int range = 5;
        int middle = (int) Math.ceil((float) range / 2);
        int minPC = 1;
        int maxPC = range;
        String pageRequest = req.getParameter("page");

        //if no pageRequest => load page 1
        if (pageRequest == null) {
            lastPagePC = (int) Math.ceil((float) totalItem / itemsPerPage);
            if (lastPagePC <= range) {
                minPC = 1;
                page = 1;
                maxPC = lastPagePC;
            }
            if (lastPagePC > range) {
                minPC = 1;
                page = 1;
                maxPC = range;
            }

        } else { // if user request a page
            page = Integer.parseInt(pageRequest);
            lastPagePC = (int) Math.ceil((float) totalItem / itemsPerPage);
            if (page <= 0) {
                page = 1;
            }
            if (page > lastPagePC) {
                page = lastPagePC;
            }
            if (lastPagePC <= range) {
                minPC = 1;
                maxPC = lastPagePC;
            } else {
                if (page >= middle + 1) {
                    if (page + middle - 1 <= lastPagePC) {
                        minPC = page - middle + 1;
                        maxPC = page + middle - 1;
                    } else {
                        maxPC = lastPagePC;
                        minPC = maxPC - range + 1;
                    }

                }
            }
        }
        ArrayList<Booking> fullBookingInfoPC = BookingDAO.Instance().getFullBookingInfo(page, itemsPerPage);
        ArrayList<Integer> fullBookingCostPC = new ArrayList<>();
        for (Booking booking : fullBookingInfoPC) {
            fullBookingCostPC.add(BookingDAO.Instance().totalCostByIdBooking(booking.getIdBooking()));
        }
        req.setAttribute("fullBookingInfoPC", fullBookingInfoPC);
        req.setAttribute("fullBookingCostPC", fullBookingCostPC);
        req.setAttribute("pagePC", page);
        req.setAttribute("lastPagePC", lastPagePC);
        req.setAttribute("minPC", minPC);
        req.setAttribute("maxPC", maxPC);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); //To change body of generated methods, choose Tools | Templates.
    }

}
