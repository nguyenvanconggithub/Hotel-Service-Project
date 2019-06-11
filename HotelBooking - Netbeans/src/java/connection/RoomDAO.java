package connection;

import java.awt.Robot;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Room;

public class RoomDAO {

    Connection con;
    String url = "jdbc:mysql://localhost:3306/hotel";
    String classDriver = "com.mysql.cj.jdbc.Driver";
    String username = "root";
    String password = "123456";
    static RoomDAO instance = null;

    public static RoomDAO Instance() {
        if (instance == null) {
            instance = new RoomDAO();
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

    public boolean updateRoom(Room room) {
        String query = "Update room SET roomname=?,idBed=?,idRoomType=?,quantity=?,people=?,acreage=?,cost=? where idRoom=?";
        try {
            OpenConnect();
            PreparedStatement preStmt = con.prepareStatement(query);//loi o day à loi gi the ?@@ no bao null

            preStmt.setString(1, room.getRoomName());
            preStmt.setInt(2, room.getBed().getIdBed());
            preStmt.setInt(3, room.getRoomType().getIdRoomType());
            preStmt.setInt(4, room.getQuantity());
            preStmt.setInt(5, room.getPeople());
            preStmt.setFloat(6, room.getAgcreage());
            preStmt.setInt(7, room.getCost());
            preStmt.setInt(8, room.getIdRoom());
            System.out.println("Run me room");
            preStmt.execute();
            CloseConnect();
            return true;

        } catch (SQLException ex) {
            System.out.println("updateRoom: -err ");
            ex.printStackTrace();
            return false;
        }

    }
    public void deleteRoomById(String id){
        String query = "UPDATE  room SET removed=1 WHERE idRoom='"+id+"'";
        try {
            OpenConnect();
            Statement st = con.createStatement();
            st.executeUpdate(query);
            CloseConnect();
        } catch (SQLException ex) {
            System.out.println("DeleteRoom: -err ");
            ex.printStackTrace();
        }
    }
    public static void main(String[] args) {
        System.out.println("Run me");
        //System.out.println(RoomDAO.Instance().updateRoom(r));
        RoomDAO.Instance().deleteRoomById("2");
    }

}
