package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import model.*;

public class DetailBookingDAO {

    Connection con;
    String url = "jdbc:mysql://localhost:3306/hotel";
    String classDriver = "com.mysql.cj.jdbc.Driver";
    String username = "root";
    String password = "123456";
    static DetailBookingDAO instance = null;

    public static DetailBookingDAO Instance() {
        if (instance == null) {
            instance = new DetailBookingDAO();
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

    public int getHotelCancelByID(int idUser, int idHotel) {
        int count = 1;
        try {
            OpenConnect();
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM detailbooking JOIN booking ON detailbooking.idBooking=booking.idBooking "
                    + "WHERE idUser='" + idUser + "' AND idHotel='" + idHotel + "' AND status !=0 ";
            ResultSet rs = stmt.executeQuery(query);
            if (rs.next() == false) {
                count = 0;
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

    public int getMoreAvailableRoomLeft(String checkin, String checkout, int idRoom) {
        int roomAvailable = 0;
        try {
            OpenConnect();
            String query = "SELECT SUM(bookingNumber) AS numberOfAvailabeRoom FROM detailbooking JOIN booking"
                    + " ON booking.idbooking = detailbooking.idbooking"
                    + " WHERE (? > checkOut OR ? < checkIn)"
                    + " AND idRoom = ? AND detailbooking.status = 1 GROUP BY idRoom";
            PreparedStatement preStmt = con.prepareStatement(query);
            preStmt.setString(1, checkin);
            preStmt.setString(2, checkout);
            preStmt.setInt(3, idRoom);
            ResultSet rs = preStmt.executeQuery();
            if (rs.next()) {
                roomAvailable = rs.getInt("numberOfAvailabeRoom");
            }
            preStmt.close();
            rs.close();
            CloseConnect();
            return roomAvailable;
        } catch (Exception e) {
            System.out.println("getMoreAvailableRoomLeft err: ");
            e.printStackTrace();
        }
        return roomAvailable;
    }

    public static void main(String[] args) {
        System.out.println(DetailBookingDAO.Instance().getMoreAvailableRoomLeft("2019-06-21", "2019-06-30", 7));
    }
}
