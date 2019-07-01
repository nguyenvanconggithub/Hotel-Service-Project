package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.RoomUltilities;
import model.Utilities;

public class RoomUltilitiesDAO {

    Connection con;
    String url = "jdbc:mysql://127.0.0.1:3306/hotel";
    String classDriver = "com.mysql.cj.jdbc.Driver";
    String username = "root";
    String password = "123456";
    static RoomUltilitiesDAO instance = null;

    public static RoomUltilitiesDAO Instance() {
        if (instance == null) {
            instance = new RoomUltilitiesDAO();
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

    public ArrayList<RoomUltilities> getListRoomUtility(String id) {
        ArrayList<RoomUltilities> list = new ArrayList<RoomUltilities>();
        try {
            OpenConnect();
            Statement stmt = con.createStatement();
            String query = "select * from roomutilities where idRoom='" + id + "' ";
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                RoomUltilities oneRecord = new RoomUltilities();
                oneRecord.getRoom().setIdRoom(rs.getInt("idRoom"));
                oneRecord.getUtility().setIdUtility(rs.getInt("idUtility"));
                list.add(oneRecord);
            }
            stmt.close();
            rs.close();
            CloseConnect();
            return list;
        } catch (Exception e) {
            System.out.println("getUtilityInfor err: ");
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<String> getListUtilityNameByIDRoom(int idRoom) {
        ArrayList<String> list = new ArrayList<String>();
        try {
            OpenConnect();
             String query = "SELECT utilityName FROM hotel.roomutilities JOIN utilities ON roomutilities.idUtility = utilities.idUtility WHERE idRoom=?";
            PreparedStatement preStmt = con.prepareStatement(query);
            preStmt.setInt(1, idRoom);
            ResultSet rs = preStmt.executeQuery();
            while (rs.next()) {
                list.add(rs.getString("utilityName"));
            }
            preStmt.close();
            rs.close();
            CloseConnect();
            return list;
        } catch (Exception e) {
            System.out.println("getListUtilityNameByIDRoom err: ");
            e.printStackTrace();
        }
        return list;
    }

    public boolean addRoomUtilities(int idUtilities, int idRoom) {
        try {
            OpenConnect();
            String query = "INSERT INTO roomutilities VALUES (?,?)";
            PreparedStatement preStmt = con.prepareStatement(query);
            preStmt.setInt(1, idUtilities);
            preStmt.setInt(2, idRoom);
            preStmt.execute();
            preStmt.close();
            CloseConnect();
            return true;
        } catch (Exception e) {
            System.out.println("addRoomUtilities - error: ");
            e.printStackTrace();
        }
        return false;
    }

    public void deleteRoomUtilities(int idRoom) {
        try {
            OpenConnect();
            String sql = "DELETE FROM roomutilities WHERE idRoom='" + idRoom + "' ";
            Statement statement;
            statement = con.createStatement();
            statement.executeUpdate(sql);
        } catch (SQLException e) {
            System.out.println("DeleteRoomUtilities - error: ");
            e.printStackTrace();
        }

    }
    
        public ArrayList<Utilities> getListUtilityRoomByIDRoom(int idRoom) {
        ArrayList<Utilities> list = new ArrayList<Utilities>();
        try {
            OpenConnect();
             String query = "SELECT * FROM roomutilities JOIN utilities ON roomutilities.idUtility = utilities.idUtility WHERE idRoom=?";
            PreparedStatement preStmt = con.prepareStatement(query);
            preStmt.setInt(1, idRoom);
            ResultSet rs = preStmt.executeQuery();
            while (rs.next()) {
                Utilities utilities=new Utilities();
                utilities.setIdUtility(rs.getInt("idUtility"));
                utilities.setUtilityName(rs.getString("utilityName"));
                list.add(utilities);
            }
            preStmt.close();
            rs.close();
            CloseConnect();
        } catch (Exception e) {
            System.out.println("getListUtilityNameByIDRoom err: ");
            e.printStackTrace();
        }
        return list;
    }
}
