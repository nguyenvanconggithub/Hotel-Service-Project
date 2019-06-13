package controller.web;

import connection.BookingDAO;
import connection.DetailBookingDAO;
import connection.HotelUltilitiesDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Booking;
import model.HotelUltilities;

@WebServlet(urlPatterns = {"/manage-order-user"})
public class ManageOrder extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getData(req, resp);
        RequestDispatcher rd = req.getRequestDispatcher("/web/manage-order-user.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    public void getData(HttpServletRequest req, HttpServletResponse resp) {
        
        int itemsPerPage = 4;
        int page = 1;
        int total=BookingDAO.Instance().countListHotelByIdUser("2");
        if(req.getParameter("page")!=null){
            page = Integer.parseInt(req.getParameter("page"));
                if(page <= 0){page = 1;}
                System.out.println("Item:" + Math.ceil((float)total/itemsPerPage));
                if(page > Math.ceil((float)total/itemsPerPage)){
                    page = (int)Math.ceil((float)total/itemsPerPage);
                }
        }
        
        
        ArrayList<Booking> listHotel = BookingDAO.Instance().getListHotelByIdUser("2", page, itemsPerPage);
        req.setAttribute("listHotel", listHotel);
        ArrayList<HotelUltilities> listUtilHotel = HotelUltilitiesDAO.Instance().getALLUtilByID();
        req.setAttribute("listUtil", listUtilHotel);
        ArrayList<Integer> listIDCancel = new ArrayList<>();
        ArrayList<Integer> listIdNotCancel = new ArrayList<>();
        for (Booking booking : listHotel) {
            if (DetailBookingDAO.Instance().getHotelCancelByID(booking.getUser().getIdUser(), booking.getHotel().getIdHotel()) == 0) {
                listIDCancel.add(booking.getHotel().getIdHotel());
            }
            else listIdNotCancel.add(booking.getHotel().getIdHotel());
                
        }       
        req.setAttribute("listCancel", listIDCancel);
         req.setAttribute("listNotCancel", listIdNotCancel);
    }
}
