package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import model.HotelImage;

public class HotelImageDAO {

    Connection con;
    String url = "jdbc:mysql://localhost:3306/hotel";
    String classDriver = "com.mysql.cj.jdbc.Driver";
    String username = "root";
    String password = "123456";
    static HotelImageDAO instance = null;

    public static HotelImageDAO Instance() {
        if (instance == null) {
            instance = new HotelImageDAO();
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

    //shortHotelInfo includes 1 images, hotel name, rate, star, adress, idhotel
    public ArrayList<HotelImage> getShortHotelInfo() {
        ArrayList<HotelImage> list = new ArrayList<HotelImage>();
        try {
            OpenConnect();
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM hotelimage JOIN hotel ON hotelimage.idHotel = hotel.idHotel WHERE removed=0 ORDER BY hotelimage.idHotel";
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                HotelImage oneRecord = new HotelImage();
                oneRecord.setLinkImage(rs.getString("linkImage"));
                oneRecord.getHotel().setHotelName(rs.getString("hotelName"));
                oneRecord.getHotel().setRate(rs.getFloat("rate"));
                oneRecord.getHotel().setStar(rs.getInt("star"));
                oneRecord.getHotel().setAddress(rs.getString("address"));
                oneRecord.getHotel().setIdHotel(rs.getInt("idHotel"));

                list.add(oneRecord);
            }
            stmt.close();
            rs.close();
            CloseConnect();
            return list;
        } catch (Exception e) {
            System.out.println("getShortHotelInfo err: ");
            e.printStackTrace();
        }
        return list;
    }

    //shortHotelInfo includes 1 images, hotel name, rate, star, adress, idhotel
    public ArrayList<HotelImage> getShortHotelInfoByUsername(String username) {
        ArrayList<HotelImage> list = new ArrayList<HotelImage>();
        try {
            OpenConnect();
            String query = "SELECT * FROM hotelimage JOIN hotel ON hotelimage.idHotel = hotel.idHotel WHERE removed=0 AND userName = ? GROUP BY hotelimage.idHotel";
            PreparedStatement preStmt = con.prepareStatement(query);
            preStmt.setString(1, username);
            System.out.println(username);
            ResultSet rs = preStmt.executeQuery();

            while (rs.next()) {
                HotelImage oneRecord = new HotelImage();
                oneRecord.setLinkImage(rs.getString("linkImage"));
                oneRecord.getHotel().setHotelName(rs.getString("hotelName"));
                oneRecord.getHotel().setRate(rs.getFloat("rate"));
                oneRecord.getHotel().setStar(rs.getInt("star"));
                oneRecord.getHotel().setAddress(rs.getString("address"));
                oneRecord.getHotel().setIdHotel(rs.getInt("idHotel"));

                list.add(oneRecord);
            }
            System.out.println("DAO - size: " + list.size());
            preStmt.close();
            rs.close();
            CloseConnect();
            return list;
        } catch (Exception e) {
            System.out.println("getShortHotelInfoByUserName err: ");
            e.printStackTrace();
        }
        return list;
    }

    public int numberImageOfHotel(int idHotel) {
        int imageNumber = 0;
        try {
            OpenConnect();
            String query = "SELECT COUNT(*) AS TOTAL FROM hotelimage WHERE idHotel=" + idHotel + "";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            if (rs.next()) {
                imageNumber = rs.getInt("TOTAL");
            }
            rs.close();
            stmt.close();;
            CloseConnect();
            return imageNumber;

        } catch (Exception e) {
            System.out.println("Number Image Of Hotel with err: ");
            e.printStackTrace();
        }
        return imageNumber;
    }

    public boolean addNewHotelImage(String linkImage, int idHotel) {
        try {
            OpenConnect();
            String query = "INSERT INTO hotelimage(linkImage, idHotel) VALUES (?,?)";
            PreparedStatement preStmt = con.prepareStatement(query);

            preStmt.setString(1, linkImage);
            preStmt.setInt(2, idHotel);
            preStmt.execute();

            preStmt.close();
            CloseConnect();
            return true;
        } catch (Exception e) {
            System.out.println("addNewHotelImage - error: ");
            e.printStackTrace();
        }
        return false;
    }

}
