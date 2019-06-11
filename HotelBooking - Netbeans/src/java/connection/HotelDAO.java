package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Hotel;

public class HotelDAO {

    Connection con;
    String url = "jdbc:mysql://localhost:3306/hotel";
    String classDriver = "com.mysql.cj.jdbc.Driver";
    String username = "root";
    String password = "123456";
    private static HotelDAO instance = null;

    public static HotelDAO Instance() {
        if (instance == null) {
            instance = new HotelDAO();
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

    public boolean hotelIsOwnByUsername(int idHotel, String username) {
        try {
            OpenConnect();
            String query = "SELECT * FROM hotel WHERE idHotel = ? AND userName = ?";
            PreparedStatement preStmt = con.prepareStatement(query);

            preStmt.setInt(1, idHotel);
            preStmt.setString(2, username);
            ResultSet rs = preStmt.executeQuery();
            if (rs.next()) {
                preStmt.close();
                rs.close();
                CloseConnect();
                return true;
            }
            preStmt.close();
            rs.close();
            CloseConnect();
        } catch (Exception e) {
            System.out.println("Already Exists Username - error: ");
            e.printStackTrace();
        }
        return false;
    }

    public boolean addNewHotel(Hotel hotel) {

        try {
            OpenConnect();
            String query = "INSERT INTO hotel (hotelName, star, address, userName, rate, removed, SDT)"
                    + "VALUES (?,?,?,?,?,?,?)";
            PreparedStatement preStmt = con.prepareStatement(query);
            preStmt.setString(1, hotel.getHotelName());
            preStmt.setInt(2, hotel.getStar());
            preStmt.setString(3, hotel.getAddress());
            preStmt.setString(4, hotel.getAccount().getUserName());
            preStmt.setFloat(5, 0);
            preStmt.setInt(6, 0);
            preStmt.setString(7, hotel.getSDT());

            preStmt.execute();
            preStmt.close();
            CloseConnect();
            return true;
        } catch (Exception e) {
            System.out.println("addNewHotel with err: ");
            e.printStackTrace();
        }
        return false;
    }

    public boolean editHotel(Hotel hotel, int idHotel) {

        try {
            OpenConnect();
            String query = "UPDATE hotel"
                    + " SET hotelName= ?, star = ?, address = ?, SDT = ? WHERE idhotel = ?";
            PreparedStatement preStmt = con.prepareStatement(query);
            preStmt.setString(1, hotel.getHotelName());
            preStmt.setInt(2, hotel.getStar());
            preStmt.setString(3, hotel.getAddress());
            preStmt.setString(4, hotel.getSDT());
            preStmt.setInt(5, idHotel);

            preStmt.execute();
            preStmt.close();
            CloseConnect();
            return true;
        } catch (Exception e) {
            System.out.println("editHotel with err: ");
            e.printStackTrace();
        }
        return false;
    }

    public boolean removeHotelByID(int idHotel) {
        try {
            OpenConnect();
            String query = "UPDATE hotel"
                    + " SET removed=1 WHERE idhotel = ?";
            PreparedStatement preStmt = con.prepareStatement(query);
            preStmt.setInt(1, idHotel);

            preStmt.execute();
            preStmt.close();
            CloseConnect();
            return true;
        } catch (Exception e) {
            System.out.println("removeHotelByID with err: ");
            e.printStackTrace();
        }
        return false;
    }

    public int newestIDHotelOfUsername(String username) {
        int newID;
        try {
            OpenConnect();
            String query = "SELECT idHotel FROM hotel WHERE idHotel = (SELECT MAX(idHotel) FROM hotel) AND userName=?";
            PreparedStatement preStmt = con.prepareStatement(query);
            preStmt.setString(1, username);
            ResultSet rs = preStmt.executeQuery();
            if (rs.next()) {
                newID = rs.getInt("idHotel");
                preStmt.close();
                rs.close();
                CloseConnect();
                return newID;
            }
            preStmt.close();
            rs.close();
            CloseConnect();
        } catch (Exception e) {
            System.out.println("NewestIDHotelOfUsername - error: ");
            e.printStackTrace();
        }
        return 0;
    }

    public Hotel getHotelByID(int idHotel) {
        Hotel hotel = new Hotel();
        try {
            OpenConnect();
            String query = "SELECT * FROM hotel WHERE idHotel=?";
            PreparedStatement preStmt = con.prepareStatement(query);
            preStmt.setInt(1, idHotel);
            ResultSet rs = preStmt.executeQuery();
            if (rs.next()) {
                hotel.setIdHotel(idHotel);
                hotel.setHotelName(rs.getString("hotelName"));
                hotel.setStar(rs.getInt("star"));
                hotel.setAddress(rs.getString("address"));
                hotel.getAccount().setUserName(rs.getString("userName"));
                hotel.setRate(rs.getFloat("rate"));
                hotel.setSDT(rs.getString("SDT"));
                preStmt.close();
                rs.close();
                CloseConnect();
                return hotel;
            }
            preStmt.close();
            rs.close();
            CloseConnect();
        } catch (Exception e) {
            System.out.println("Get Hotel By ID - error: ");
            e.printStackTrace();
        }
        return null;
    }
     public Hotel getShortHotelInfoByID(String id) {
        Hotel oneRecord = new Hotel();
        try {
            OpenConnect();
            String query = "SELECT * FROM hotel WHERE removed=0 AND idHotel = ?";
            PreparedStatement preStmt = con.prepareStatement(query);
            preStmt.setString(1, id);
            System.out.println(id);
            ResultSet rs = preStmt.executeQuery();
            
            while (rs.next()) {
                oneRecord.setHotelName(rs.getString("hotelName"));
                oneRecord.setRate(rs.getFloat("rate"));
                oneRecord.setStar(rs.getInt("star"));
                oneRecord.setAddress(rs.getString("address"));
                oneRecord.setIdHotel(rs.getInt("idHotel"));

            }
            preStmt.close();
            rs.close();
            CloseConnect();
            return oneRecord;
        } catch (Exception e) {
            System.out.println("getShortHotelInfoByID err: ");
            e.printStackTrace();
        }
        return oneRecord;
    }
}
