/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.HotelImage;
import model.SearchHotel;

/**
 *
 * @author onglu
 */
public class SearchHotelDAO {

    Connection con;
    String url = "jdbc:mysql://localhost:3306/hotel";
    String classDriver = "com.mysql.cj.jdbc.Driver";
    String username = "root";
    String password = "1234";
    static SearchHotelDAO instance = null;

    public static SearchHotelDAO Instance() {
        if (instance == null) {
            instance = new SearchHotelDAO();
        }
        return instance;
    }

    private void OpenConnect() {
        try {
            Class.forName(classDriver);
            con = DriverManager.getConnection(url, username, password);
        } catch (Exception e) {
            System.out.println("OpenConnect - Connect Fail with err: ");
            e.printStackTrace();
        }
    }

    private void CloseConnect() {
        try {
            con.close();
        } catch (Exception e) {
            System.out.println("CloseConnect - Close Fail with err: ");
            e.printStackTrace();
        }
    }

    public ArrayList<SearchHotel> searchHotelByAddressRoomLeftPeople(String address, int roomleft, int people, String checkin, String checkout) {
        ArrayList<SearchHotel> list = new ArrayList<SearchHotel>();
        String xuLyLikeHotelName = "";
        String xuLyLikeAddress = "";
        String a[] = address.split(" ");

        for (int i = 0; i < a.length; i++) {
            xuLyLikeHotelName += " hotelname like '%" + a[i] + "%' OR";
            xuLyLikeAddress += " address like '%" + a[i] + "%' OR";
        }

        xuLyLikeAddress = xuLyLikeAddress.substring(0, xuLyLikeAddress.length() - 2);
        xuLyLikeHotelName = xuLyLikeHotelName.substring(0, xuLyLikeHotelName.length() - 2);
        
        try {
            OpenConnect();
            System.out.println("in " + checkin + " out " + checkout);
            String query = "SELECT * FROM hotel JOIN room ON hotel.idHotel = room.idHotel JOIN hotelimage ON hotel.idHotel=hotelimage.idHotel \n" +
            "WHERE match (hotelName) against('"+address+"') OR match (address) against('"+address+"')\n" +
            "GROUP BY hotel.idHotel\n" +
            "HAVING\n" +
            "\n" +
            "(SELECT SUM(roomLeft) From room where room.idHotel=hotel.idHotel)\n" +
            "+(select sum(bookingnumber) from detailbooking join room on detailbooking.idRoom=room.idRoom join booking on detailbooking.idBooking=booking.idBooking where room.idHotel=hotel.idHotel \n" +
            "AND status=1 \n" +
            "AND checkIn NOT between '"+checkin+"' AND '"+checkout+"'\n" +
            "AND checkout NOT between '"+checkin+"' AND '"+checkout+"')>="+roomleft+"\n" +
            "\n" +
            "AND ((SELECT SUM(roomLeft)*people From room where room.idHotel=hotel.idHotel)\n" +
            "+(select sum(bookingnumber)*people from detailbooking join room on detailbooking.idRoom=room.idRoom join booking on detailbooking.idBooking=booking.idBooking where room.idHotel=hotel.idHotel \n" +
            "AND status=1 \n" +
            "AND checkIn NOT between '"+checkin+"' AND '"+checkout+"'\n" +
            "AND checkout NOT between '"+checkin+"' AND '"+checkout+"')) >="+people+"\n" +
            "AND hotel.removed=0\n" +
            "\n" +
            "UNION\n" +
            "\n" +
            "SELECT * FROM hotel JOIN room ON hotel.idHotel = room.idHotel JOIN hotelimage ON hotel.idHotel=hotelimage.idHotel \n" +
            "WHERE "+xuLyLikeHotelName+"\n" +
            "OR "+xuLyLikeAddress+"\n" +
            "GROUP BY hotel.idHotel\n" +
            "HAVING\n" +
            "\n" +
            "(SELECT SUM(roomLeft) From room where room.idHotel=hotel.idHotel)\n" +
            "+(select sum(bookingnumber) from detailbooking join room on detailbooking.idRoom=room.idRoom join booking on detailbooking.idBooking=booking.idBooking where room.idHotel=hotel.idHotel \n" +
            "AND status=1 \n" +
            "AND checkIn NOT between '"+checkin+"' AND '"+checkout+"'\n" +
            "AND checkout NOT between '"+checkin+"' AND '"+checkout+"')>="+roomleft+"\n" +
            "\n" +
            "AND ((SELECT SUM(roomLeft)*people From room where room.idHotel=hotel.idHotel)\n" +
            "+(select sum(bookingnumber)*people from detailbooking join room on detailbooking.idRoom=room.idRoom join booking on detailbooking.idBooking=booking.idBooking where room.idHotel=hotel.idHotel \n" +
            "AND status=1 \n" +
            "AND checkIn NOT between '"+checkin+"' AND '"+checkout+"'\n" +
            "AND checkout NOT between '"+checkin+"' AND '"+checkout+"')) >="+people+"\n" +
            "AND hotel.removed=0";

            PreparedStatement preStmt = con.prepareStatement(query);
            ResultSet rs = preStmt.executeQuery();

            while (rs.next()) {
                SearchHotel oneRecord = new SearchHotel();

                HotelImage hotelImage = new HotelImage();

                hotelImage.setLinkImage(rs.getString("linkImage"));
                hotelImage.getHotel().setHotelName(rs.getString("hotelName"));
                hotelImage.getHotel().setRate(rs.getFloat("rate"));
                hotelImage.getHotel().setStar(rs.getInt("star"));
                hotelImage.getHotel().setAddress(rs.getString("address"));
                hotelImage.getHotel().setIdHotel(rs.getInt("idHotel"));

                oneRecord.setHotelImage(hotelImage);

                oneRecord.setUtilitieses(UltilitiesDAO.Instance().getListUtilitiesByIdHotel(rs.getInt("idHotel")));

                list.add(oneRecord);
            }
            System.out.println("DAO - size: " + list.size());
            preStmt.close();
            rs.close();
            CloseConnect();
            return list;
        } catch (Exception e) {
            System.out.println("searchHotelByAddressRoomLeftPeople err: ");
            e.printStackTrace();
        }
        return list;
    }

    //seach khách sạn có phòng chưa ai đặt
    public ArrayList<SearchHotel> searchHotelByAddressRoomLeftPeople2(String address, int roomleft, int people) {
        ArrayList<SearchHotel> list = new ArrayList<SearchHotel>();
        String xuLyLikeHotelName = "";
        String xuLyLikeAddress = "";
        String a[] = address.split(" ");

        for (int i = 0; i < a.length; i++) {
            xuLyLikeHotelName += " hotelname like '%" + a[i] + "%' OR";
            xuLyLikeAddress += " address like '%" + a[i] + "%' OR";
        }

        xuLyLikeAddress = xuLyLikeAddress.substring(0, xuLyLikeAddress.length() - 2);
        xuLyLikeHotelName = xuLyLikeHotelName.substring(0, xuLyLikeHotelName.length() - 2);

        try {
            OpenConnect();

            String query = "SELECT * FROM hotel JOIN room ON hotel.idHotel = room.idHotel JOIN hotelimage ON hotel.idHotel=hotelimage.idHotel \n"
                    + "WHERE match (hotelname) against('" + address + "') OR match (address) against('" + address + "') \n"
                    + "GROUP BY hotel.idHotel\n"
                    + "Having NOT EXISTS (SELECT * from detailbooking where detailbooking.idRoom=room.idRoom AND status=1)\n"
                    + "AND (SELECT SUM(roomLeft) From room where room.idHotel=hotel.idHotel)>=" + roomleft + "\n"
                    + "AND (SELECT SUM(people*roomLeft) From room where room.idHotel=hotel.idHotel)>=" + people + "\n"
                    + "AND hotel.removed=0\n"
                    + "UNION\n"
                    + "SELECT * FROM hotel JOIN room ON hotel.idHotel = room.idHotel JOIN hotelimage ON hotel.idHotel=hotelimage.idHotel \n"
                    + "WHERE " + xuLyLikeHotelName + "\n"
                    + "OR " + xuLyLikeAddress + "\n"
                    + "GROUP BY hotel.idHotel\n"
                    + "Having NOT EXISTS (SELECT * from detailbooking where detailbooking.idRoom=room.idRoom AND status=1)\n"
                    + "AND (SELECT SUM(roomLeft) From room where room.idHotel=hotel.idHotel)>=" + roomleft + "\n"
                    + "AND (SELECT SUM(people*roomLeft) From room where room.idHotel=hotel.idHotel)>=" + people + "\n"
                    + "AND hotel.removed=0";

            PreparedStatement preStmt = con.prepareStatement(query);
            ResultSet rs = preStmt.executeQuery();
            while (rs.next()) {
                SearchHotel oneRecord = new SearchHotel();

                HotelImage hotelImage = new HotelImage();

                hotelImage.setLinkImage(rs.getString("linkImage"));
                hotelImage.getHotel().setHotelName(rs.getString("hotelName"));
                hotelImage.getHotel().setRate(rs.getFloat("rate"));
                hotelImage.getHotel().setStar(rs.getInt("star"));
                hotelImage.getHotel().setAddress(rs.getString("address"));
                hotelImage.getHotel().setIdHotel(rs.getInt("idHotel"));

                oneRecord.setHotelImage(hotelImage);

                oneRecord.setUtilitieses(UltilitiesDAO.Instance().getListUtilitiesByIdHotel(rs.getInt("idHotel")));

                list.add(oneRecord);
            }
            System.out.println("DAO - size: " + list.size());
            preStmt.close();
            rs.close();
            CloseConnect();
            return list;
        } catch (Exception e) {
            System.out.println("searchHotelByAddressRoomLeftPeople 2err: ");
            e.printStackTrace();
        }
        return list;
    }
}
