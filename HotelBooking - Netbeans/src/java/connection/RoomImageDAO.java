package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import model.RoomImage;

public class RoomImageDAO {
Connection con;
    String url = "jdbc:mysql://localhost:3306/hotel";
    String classDriver = "com.mysql.cj.jdbc.Driver";
    String username = "root";
    String password = "123456";
    static RoomImageDAO instance = null;

    public static RoomImageDAO Instance() {
        if (instance == null) {
            instance = new RoomImageDAO();
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
       public ArrayList<RoomImage> getShortRoomInfor(String id){
            ArrayList<RoomImage> list = new ArrayList<RoomImage>();
        try {
            OpenConnect();
            Statement stmt = con.createStatement();
            String query = "select * from roomimage join room on roomimage.idRoom=room.idRoom join roomtype on room.idRoomType=roomtype.idRoomType where removed=0 AND idHotel='"+id+"'  ";
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                RoomImage oneRecord = new RoomImage();
                oneRecord.setLinkImage(rs.getString("linkImage"));
                oneRecord.getRoom().setRoomName(rs.getString("roomName"));
                oneRecord.getRoom().setRoomLeft(rs.getInt("roomLeft"));
                oneRecord.getRoom().setPeople(rs.getInt("people"));
                oneRecord.getRoom().setQuantity(rs.getInt("quantity"));
                oneRecord.getRoom().setIdRoom(rs.getInt("idRoom"));
                oneRecord.getRoom().getRoomType().setRoomTypeName(rs.getString("roomTypeName"));
                oneRecord.getRoom().setCost(rs.getInt("cost"));
                oneRecord.getRoom().setAgcreage(rs.getFloat("acreage"));
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
       public static void main(String[] args) {
        ArrayList<RoomImage> list=RoomImageDAO.Instance().getShortRoomInfor("1");
           System.out.println(list.get(0).getRoom().getCost());
    }
}
