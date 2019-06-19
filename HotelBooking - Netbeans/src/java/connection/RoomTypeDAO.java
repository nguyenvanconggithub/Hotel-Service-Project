package connection;

import java.awt.Robot;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import model.RoomImage;
import model.RoomType;

public class RoomTypeDAO {

    Connection con;
    String url = "jdbc:mysql://localhost:3306/hotel";
    String classDriver = "com.mysql.cj.jdbc.Driver";
    String username = "root";
    String password = "123456";
    static RoomTypeDAO instance = null;

    public static RoomTypeDAO Instance() {
        if (instance == null) {
            instance = new RoomTypeDAO();
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

    public ArrayList<RoomType> getListRoomType() {
        ArrayList<RoomType> list = new ArrayList<RoomType>();
        try {
            OpenConnect();
            Statement stmt = con.createStatement();
            String query = "select * from roomtype ";
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                RoomType oneRecord = new RoomType();
                oneRecord.setIdRoomType(rs.getInt("idRoomType"));
                oneRecord.setRoomTypeName(rs.getString("roomTypeName"));
                list.add(oneRecord);
            }
            stmt.close();
            rs.close();
            CloseConnect();
            return list;
        } catch (Exception e) {
            System.out.println("getShortRoomInfor err: ");
            e.printStackTrace();
        }
        return list;
    }

    public String getRoomTypeNameByID(int idRoomType) {
        String typeName = "";
        try {
            OpenConnect();
            String query = "SELECT roomTypeName FROM roomtype WHERE idRoomType = ?";
            PreparedStatement preStmt = con.prepareStatement(query);
            preStmt.setInt(1, idRoomType);
            ResultSet rs = preStmt.executeQuery();
            if (rs.next()) {
                typeName = rs.getString("roomTypeName");
                preStmt.close();
                rs.close();
                CloseConnect();
                return typeName;
            }

        } catch (Exception e) {
            System.out.println("getRoomTypeNameByID with err: ");
            e.printStackTrace();
        }
        return "";
    }

    public RoomType getOneRoomTypeByIdRoomType(int idRoomtype){
        RoomType roomType=new RoomType();
        try {
            OpenConnect();
            String query = "select * from roomtype where idRoomType="+idRoomtype;
            PreparedStatement preStmt = con.prepareStatement(query);
            ResultSet rs = preStmt.executeQuery();
            if (rs.next()) {
                roomType.setIdRoomType(rs.getInt("idRoomType"));
                roomType.setRoomTypeName(rs.getString("roomTypeName"));
            }
            preStmt.close();
            rs.close();
            CloseConnect();
        } catch (Exception e) {
            System.out.println("getOneRoomTypeByIdRoomType - error: ");
            e.printStackTrace();
        }
        return roomType;
    }
}
