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
        String soNguoi = req.getParameter("soNguoi");
        String soPhong = req.getParameter("soPhong");
        
        //add data search vào cookies
        Cookie cookieAddress = new Cookie("address", URLEncoder.encode(address));
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
        req.setAttribute("soNguoi", soNguoi);
        req.setAttribute("soPhong", soPhong);
        
        //get SearchHotel đã có người đặt nhưng đi rồi
        ArrayList<model.SearchHotel> searchHotels=SearchHotelDAO.Instance().searchHotelByAddressRoomLeftPeople(address,address, Integer.parseInt(soPhong),  Integer.parseInt(soNguoi), bdayCheckin, bdayCheckout);
        //get searchHotel các phòng chưa ai đặt
        ArrayList<model.SearchHotel> searchHotels1=SearchHotelDAO.Instance().searchHotelByAddressRoomLeftPeople2(address,address, Integer.parseInt(soPhong),  Integer.parseInt(soNguoi));
        
        for(int i=0;i<searchHotels1.size();i++){
            searchHotels.add(searchHotels1.get(i));
        }
        
        req.setAttribute("soKhachSan", searchHotels.size());
        
        int page;
        if(req.getParameter("page")==null){
            page=1;
        }else{
            page=Integer.parseInt(req.getParameter("page"));
            if(page > Math.ceil((float)searchHotels.size()/10)){
                page = (int)Math.ceil((float)searchHotels.size()/10);
            }
            if(page<=0){
                page=1;
            } 
        }
        
        System.out.println(page+"page");
        ArrayList<model.SearchHotel> searchHotels2=new ArrayList<>();
        for(int i=0;i<10;i++){
            if(searchHotels.size()> i+10*(page-1)){
                searchHotels2.add(searchHotels.get(i+10*(page-1)));
            }else{
                break;
            }
        }
        req.setAttribute("hotel", searchHotels2);
        req.setAttribute("page", page);
        
        //get cookies
//        Cookie[] cookies = req.getCookies();
//
//        if (cookies != null) {
//            for (Cookie cookie2 : cookies) {
//                if (cookie2.getName().equals("address")) {
////                    req.setAttribute("address", cookie2.getValue());
//                    System.out.println(cookie2.getValue());
//                }
//                if (cookie2.getName().equals("bdayCheckin")) {
////                    req.setAttribute("bdayCheckin", cookie2.getValue());
//                }
//                if (cookie2.getName().equals("bdayCheckout")) {
////                    req.setAttribute("bdayCheckout", cookie2.getValue());
//                }
//                if (cookie2.getName().equals("soNguoi")) {
////                    req.setAttribute("soNguoi", cookie2.getValue());
//                }
//                if (cookie2.getName().equals("soPhong")) {
////                    req.setAttribute("soPhong", cookie2.getValue());
//                }
//            }
//        }

        //re-direct to web/index.jsp
        RequestDispatcher rd = req.getRequestDispatcher("/web/list-hotel.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
