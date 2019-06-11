package connection;

import java.awt.Robot;
import java.sql.Connection;
import java.sql.DriverManager;
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
    String password = "1234";
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
       public ArrayList<RoomType> getListRoomType(){
            ArrayList<RoomType> list = new ArrayList<RoomType>();
        try {
            OpenConnect();
            Statement stmt = con.createStatement();
            String query = "select * from roomtype ";
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                   RoomType oneRecord= new RoomType();
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
       public static void main(String[] args) {
        ArrayList<RoomType> list= RoomTypeDAO.Instance().getListRoomType();
           System.out.println(list.get(0).getIdRoomType());
    }
}
