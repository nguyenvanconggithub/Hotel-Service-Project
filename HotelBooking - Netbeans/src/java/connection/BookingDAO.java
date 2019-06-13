package connection;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import model.Bed;
import model.Booking;

public class BookingDAO {

    Connection con;
    String url = "jdbc:mysql://localhost:3306/hotel";
    String classDriver = "com.mysql.cj.jdbc.Driver";
    String username = "root";
    String password = "123456";
    static BookingDAO instance = null;

    public static BookingDAO Instance() {
        if (instance == null) {
            instance = new BookingDAO();
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

    public ArrayList<Booking> getListHotelByIdUser(String idUser, int page, int itemsPerPage) {
        ArrayList<Booking> list = new ArrayList<>();
        try {
            OpenConnect();
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM booking JOIN hotel ON booking.idHotel=hotel.idHotel WHERE idUser='" + idUser + "'"
                    + "ORDER BY idBooking  LIMIT "+ ((page - 1) * itemsPerPage)+","+itemsPerPage+" ";
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                Booking oneRecord = new Booking();
                oneRecord.getUser().setIdUser(rs.getInt("idUser"));
                oneRecord.setIdBooking(rs.getInt("idBooking"));
                Timestamp timestamp = rs.getTimestamp("bookingTime");
                oneRecord.setOrderTime(timestamp);
                oneRecord.setCheckIn(rs.getDate("checkIn"));
                oneRecord.setCheckOut(rs.getDate("checkOut"));
                oneRecord.getHotel().setIdHotel(rs.getInt("idHotel"));
                oneRecord.getHotel().setHotelName(rs.getString("hotelName"));
                oneRecord.getHotel().setAddress(rs.getString("address"));
                oneRecord.getHotel().setSDT(rs.getString("SDT"));
                oneRecord.getHotel().setStar(rs.getInt("star"));
                oneRecord.getHotel().setRate(rs.getFloat("rate"));
                list.add(oneRecord);
            }
            stmt.close();
            rs.close();
            CloseConnect();
            return list;
        } catch (Exception e) {
            System.out.println("getListHotelByIdUser err: ");
            e.printStackTrace();
        }
        return list;
    }
    public int countListHotelByIdUser(String idUser) {
        int count=0;
        try {
            OpenConnect();
            Statement stmt = con.createStatement();
            String query = "SELECT count(idBooking) FROM booking JOIN hotel ON booking.idHotel=hotel.idHotel WHERE idUser='" + idUser + "'"
                    + "ORDER BY idBooking ";
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                count=rs.getInt(1);
            }
            stmt.close();
            rs.close();
            CloseConnect();
            return count;
        } catch (Exception e) {
            System.out.println("getListHotelByIdUser err: ");
            e.printStackTrace();
        }
        return count;
    }

    public static void main(String[] args) {
        //ArrayList<Booking> list = BookingDAO.Instance().getListHotelByIdUser("2",0,4);
        //System.out.println(list.size());
        System.out.println(BookingDAO.Instance().countListHotelByIdUser("2"));
    }
}
