package connection;

import java.awt.Robot;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
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

    public void deleteRoomById(String id) {
        String query = "UPDATE  room SET removed=1 WHERE idRoom='" + id + "'";
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

    public boolean addNewRoom(Room room) {

        try {
            OpenConnect();
            String query = "INSERT INTO room (roomName, idHotel, idBed, idRoomType, acreage, cost, people,quantity,roomLeft,removed)"
                    + "VALUES (?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement preStmt = con.prepareStatement(query);

            preStmt.setString(1, room.getRoomName());
            preStmt.setInt(2, room.getHotel().getIdHotel());
            preStmt.setInt(3, room.getBed().getIdBed());
            preStmt.setInt(4, room.getRoomType().getIdRoomType());
            preStmt.setFloat(5, room.getAgcreage());
            preStmt.setInt(6, room.getCost());
            preStmt.setInt(7, room.getPeople());
            preStmt.setInt(8, room.getQuantity());
            preStmt.setInt(9, room.getRoomLeft());
            preStmt.setBoolean(10, room.isRemoved());

            preStmt.execute();
            CloseConnect();
            return true;
        } catch (Exception e) {
            System.out.println("addNewRoom with err: ");
            e.printStackTrace();
        }
        return false;
    }

    public int newestIDRoomOfIDHotel(String idHotel) {
        int newID;
        try {
            OpenConnect();
            String query = "SELECT idRoom FROM room WHERE idRoom = (SELECT MAX(idRoom) FROM room) AND idHotel=?";
            PreparedStatement preStmt = con.prepareStatement(query);
            preStmt.setString(1, idHotel);
            ResultSet rs = preStmt.executeQuery();
            if (rs.next()) {
                newID = rs.getInt("idRoom");
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

    public ArrayList<Room> getRoomsByIdHotel(String idHotel) {
        ArrayList<Room> listRoom = new ArrayList<>();
        try {
            OpenConnect();
            String query = "SELECT * FROM room WHERE idHotel=? AND removed=0";
            PreparedStatement preStmt = con.prepareStatement(query);
            preStmt.setString(1, idHotel);
            ResultSet rs = preStmt.executeQuery();
            while (rs.next()) {
                Room room = new Room();
                room.setIdRoom(rs.getInt("idRoom"));
                room.setRoomName(rs.getString("roomName"));
                room.getHotel().setIdHotel(rs.getInt("idHotel"));
                room.getBed().setIdBed(rs.getInt("idBed"));
                room.getRoomType().setIdRoomType(rs.getInt("idRoomType"));
                room.setAgcreage(rs.getFloat("acreage"));
                room.setCost(rs.getInt("cost"));
                room.setPeople(rs.getInt("people"));
                room.setQuantity(rs.getInt("quantity"));
                room.setRoomLeft(rs.getInt("roomLeft"));

                listRoom.add(room);
            }

            preStmt.close();
            rs.close();
            CloseConnect();
            return listRoom;
        } catch (Exception e) {
            System.out.println("NewestIDHotelOfUsername - error: ");
            e.printStackTrace();
        }
        return null;
    }

    public int getCostById(int idRoom) {
        int cost = 0;
        try {
            OpenConnect();
            String query = "SELECT cost FROM room WHERE idRoom=?";
            PreparedStatement preStmt = con.prepareStatement(query);
            preStmt.setInt(1, idRoom);
            ResultSet rs = preStmt.executeQuery();
            while (rs.next()) {
                cost = rs.getInt("cost");
            }
            preStmt.close();
            rs.close();
            CloseConnect();
            return cost;
        } catch (Exception e) {
            System.out.println("getCostById - error: ");
            e.printStackTrace();
        }
        return cost;
    }
}
