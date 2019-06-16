package controller.web;

import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import connection.HotelImageDAO;
import connection.SearchHotelDAO;
import java.io.IOException;
import java.net.CookieStore;
import java.net.URLEncoder;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.Optional;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.HotelImage;

@WebServlet(urlPatterns = "/search")
public class SearchHotel extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String address = req.getParameter("address");
        String bdayCheckin = req.getParameter("bdayCheckin");
        String bdayCheckout = req.getParameter("bdayCheckout");
        String soNguoi = req.getParameter("guests");
        String soPhong = req.getParameter("rooms");
        
        //add data search vào cookies
        Cookie cookieAddress = new Cookie("address", URLEncoder.encode(address,"UTF-8"));
        resp.addCookie(cookieAddress);

        Cookie cookieBdayCheckin = new Cookie("bdayCheckin", bdayCheckin);
        resp.addCookie(cookieBdayCheckin);

        Cookie cookieBdayCheckout = new Cookie("bdayCheckout", bdayCheckout);
        resp.addCookie(cookieBdayCheckout);

        Cookie cookieSoNguoi = new Cookie("guests", soNguoi);
        resp.addCookie(cookieSoNguoi);

        Cookie cookieSoPhong = new Cookie("rooms", soPhong);
        resp.addCookie(cookieSoPhong);

        //truyền cookies đến mọi trang sau projectname/
        cookieAddress.setPath("/");
        cookieBdayCheckin.setPath("/");
        cookieBdayCheckout.setPath("/");
        cookieSoNguoi.setPath("/");
        cookieSoPhong.setPath("/");

        //gửi sang bên kia data search mới
        req.setAttribute("address", address);
        req.setAttribute("bdayCheckin", bdayCheckin);
        req.setAttribute("bdayCheckout", bdayCheckout);
        req.setAttribute("guests", soNguoi);
        req.setAttribute("rooms", soPhong);
        
        //get SearchHotel đã có người đặt nhưng đi rồi
        ArrayList<model.SearchHotel> searchHotels=SearchHotelDAO.Instance().searchHotelByAddressRoomLeftPeople(address, Integer.parseInt(soPhong),  Integer.parseInt(soNguoi), bdayCheckin, bdayCheckout);
        //get searchHotel các phòng chưa ai đặt
        ArrayList<model.SearchHotel> searchHotels1=SearchHotelDAO.Instance().searchHotelByAddressRoomLeftPeople2(address, Integer.parseInt(soPhong),  Integer.parseInt(soNguoi));
        
        for(int i=0;i<searchHotels1.size();i++){
            searchHotels.add(searchHotels1.get(i));
        }
        
        req.setAttribute("hotelnumber", searchHotels.size());
        
        //get List Data Hotel
            int totalItem = HotelImageDAO.Instance().numberOfHotel();
            System.out.println(totalItem + "Totol");
            int itemsPerPage = 10;
            int page = 1;
            int lastPage = 1;
            int range = 5;
            int middle = (int) Math.ceil((float) range / 2);
            int min = 1;
            int max = range;
            String pageRequest = req.getParameter("page");

            //if no pageRequest => load page 1
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
                        }else{
                            max = lastPage;
                            min = max - range + 1;
                        }

                    }
                }
            }
            
        ArrayList<model.SearchHotel> searchHotels2=new ArrayList<>();
        for(int i=0;i<10;i++){
            if(searchHotels.size()> i+10*(page-1)){
                searchHotels2.add(searchHotels.get(i+10*(page-1)));
            }else{
                break;
            }
        }
        //hết phân trang
        req.setAttribute("hotel", searchHotels2);
        req.setAttribute("page", page);
        req.setAttribute("lastPage", lastPage);
        req.setAttribute("min", min);
        req.setAttribute("max", max);
            
        //re-direct to web/index.jsp
        RequestDispatcher rd = req.getRequestDispatcher("/web/list-hotel.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
