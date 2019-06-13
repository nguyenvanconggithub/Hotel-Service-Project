package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.HotelUltilities;

public class HotelUltilitiesDAO {

    Connection con;
    String url = "jdbc:mysql://localhost:3306/hotel";
    String classDriver = "com.mysql.cj.jdbc.Driver";
    String username = "root";
    String password = "123456";
    private static HotelUltilitiesDAO instance = null;

    public static HotelUltilitiesDAO Instance() {
        if (instance == null) {
            instance = new HotelUltilitiesDAO();
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

    public boolean addHotelUtilities(int idUtilities, int idHotel) {
        try {
            OpenConnect();
            String query = "INSERT INTO hotelutilities VALUES (?,?)";
            PreparedStatement preStmt = con.prepareStatement(query);

            preStmt.setInt(1, idUtilities);
            preStmt.setInt(2, idHotel);
            preStmt.execute();

            preStmt.close();
            CloseConnect();
            return true;
        } catch (Exception e) {
            System.out.println("addHotelUtilities - error: ");
            e.printStackTrace();

        }
        return false;
    }

    public ArrayList<Integer> listIDUtilitiesOfIDHotel(int idHotel) {
        ArrayList<Integer> lstID = new ArrayList<>();
        try {
            OpenConnect();
            String query = "SELECT idutility FROM hotel.hotelutilities WHERE idhotel = ?";
            PreparedStatement preStmt = con.prepareStatement(query);

            preStmt.setInt(1, idHotel);
            ResultSet rs = preStmt.executeQuery();
            while (rs.next()) {
                lstID.add(rs.getInt("idutility"));
            }
            preStmt.close();
            CloseConnect();
            return lstID;
        } catch (Exception e) {
            System.out.println("listIDUtilitiesOfIDHotel - error: ");
            e.printStackTrace();

        }
        return null;
    }

    public ArrayList<HotelUltilities> getListUtilByID(String idHotel) {
        ArrayList<HotelUltilities> list = new ArrayList<>();
        try {
            OpenConnect();
            String query = "SELECT * FROM hotelutilities JOIN utilities ON hotelutilities.idUtility=utilities.idUtility WHERE idhotel = ?";
            PreparedStatement preStmt = con.prepareStatement(query);

            preStmt.setString(1, idHotel);
            ResultSet rs = preStmt.executeQuery();
            while (rs.next()) {
                HotelUltilities oneRecord = new HotelUltilities();
                oneRecord.getHotel().setIdHotel(rs.getInt("idHotel"));
                oneRecord.getUtility().setUtilityName(rs.getString("utilityName"));
                list.add(oneRecord);
            }
            preStmt.close();
            CloseConnect();
            return list;
        } catch (Exception e) {
            System.out.println("getListUtility - error: ");
            e.printStackTrace();

        }
        return null;
    }

    public ArrayList<String> listUtilitiesNameOfIDHotel(int idHotel) {
        ArrayList<String> lstName = new ArrayList<>();
        try {
            OpenConnect();
            String query = "SELECT utilityName FROM hotel.hotelutilities JOIN hotel.utilities ON hotelutilities.idutility = utilities.idUtility WHERE idhotel=?";
            PreparedStatement preStmt = con.prepareStatement(query);

            preStmt.setInt(1, idHotel);
            ResultSet rs = preStmt.executeQuery();
            while (rs.next()) {
                lstName.add(rs.getString("utilityName"));
            }
            preStmt.close();
            CloseConnect();
            return lstName;
        } catch (Exception e) {
            System.out.println("listUtilitiesNameOfIDHotel - error: ");
            e.printStackTrace();

        }
        return null;
    }

     public ArrayList<HotelUltilities> getALLUtilByID() {
        ArrayList<HotelUltilities> list = new ArrayList<>();
        try {
            OpenConnect();
            String query = "SELECT * FROM hotelutilities JOIN utilities ON hotelutilities.idUtility=utilities.idUtility";
            PreparedStatement preStmt = con.prepareStatement(query);
            ResultSet rs = preStmt.executeQuery();
            while (rs.next()) {
                HotelUltilities oneRecord= new HotelUltilities();
                oneRecord.getHotel().setIdHotel(rs.getInt("idHotel"));
                oneRecord.getUtility().setUtilityName(rs.getString("utilityName"));
                list.add(oneRecord);
            }
            preStmt.close();
            CloseConnect();
            return list;
        } catch (Exception e) {
            System.out.println("getListUtility - error: ");
            e.printStackTrace();

        }
        return null;
    }
    public boolean removeAllOldUltilOfIdHotel(int idHotel) {
        try {
            OpenConnect();
            String query = "DELETE hotelutilities FROM hotelutilities WHERE idhotel = ?";
            PreparedStatement preStmt = con.prepareStatement(query);

            preStmt.setInt(1, idHotel);
            preStmt.execute();

            preStmt.close();
            CloseConnect();
            return true;
        } catch (Exception e) {
            System.out.println("removeAllOldUltilOfIdHotel - error: ");
            e.printStackTrace();

        }
        return false;
    }
}
