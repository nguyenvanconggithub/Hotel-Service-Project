package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.HotelImage;
import model.RoomImage;

public class RoomImageDAO {

    Connection con;
    String url = "jdbc:mysql://127.0.0.1:3306/hotel";
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

    public ArrayList<RoomImage> getShortRoomInfor(String idH, String idR) {
        ArrayList<RoomImage> list = new ArrayList<RoomImage>();
        try {
            OpenConnect();
            Statement stmt = con.createStatement();
            String query = "select * from roomimage join room on roomimage.idRoom=room.idRoom join roomtype on room.idRoomType=roomtype.idRoomType where removed=0 \n"
                    + "AND idHotel='" + idH + "' AND room.idRoom='" + idR + "'";
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

    public ArrayList<RoomImage> getShortRoomInforv2(String id) {
        ArrayList<RoomImage> list = new ArrayList<RoomImage>();
        try {
            OpenConnect();
            Statement stmt = con.createStatement();
            String query = "select * from roomimage join room on roomimage.idRoom=room.idRoom join roomtype on room.idRoomType=roomtype.idRoomType where removed=0 \n"
                    + "AND idHotel='" + id + "' GROUP BY room.idRoom";
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
        System.out.println(RoomImageDAO.Instance().getListImg("8").get(0).getIdRoomImage());
    }

    public int numberImageOfRoom() {
        int imageNumber = 0;
        try {
            OpenConnect();
            String query = "SELECT MAX(idRoomImage) AS TOTAL FROM roomimage";
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

    public boolean addNewRoomImage(String linkImage, int idRoom) {
        try {
            OpenConnect();
            String query = "INSERT INTO roomimage(linkImage, idRoom) VALUES (?,?)";
            PreparedStatement preStmt = con.prepareStatement(query);

            preStmt.setString(1, linkImage);
            preStmt.setInt(2, idRoom);
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

    public ArrayList<RoomImage> getListImg(String id) {
        ArrayList<RoomImage> list = new ArrayList<>();
        OpenConnect();
        try {

            String sql = "SELECT * FROM roomimage WHERE idRoom='" + id + "'";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                RoomImage oneRecord = new RoomImage();
                oneRecord.setIdRoomImage(rs.getInt("idRoomImage"));
                oneRecord.setLinkImage(rs.getString("linkImage"));
                oneRecord.setRoom(RoomDAO.Instance().getRoomByIdRoom(rs.getInt("idRoom")));
                list.add(oneRecord);
            }
            System.out.println("DAO - size: " + list.size());
            con.close();
            rs.close();
            CloseConnect();
            return list;

        } catch (Exception e) {
            System.out.println("GetListRoom- Err");
            e.printStackTrace();
        }

        return list;
    }

    public RoomImage getFullInforRoom(String id) {
        String sql = " select * from roomimage join room on roomimage.idRoom=room.idRoom join \n"
                + " roomtype on room.idRoomType=roomtype.idRoomType join\n"
                + " bed on bed.idBed=room.idBed where removed=0 AND room.idRoom='" + id + "'";
        OpenConnect();
        RoomImage oneRecord = oneRecord = new RoomImage();;
        Statement st;
        try {
            st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                oneRecord.setLinkImage(rs.getString("linkImage"));
                oneRecord.getRoom().setIdRoom(rs.getInt("idRoom"));
                oneRecord.getRoom().getBed().setBedName(rs.getString("bedName"));
                oneRecord.getRoom().setCost(rs.getInt("cost"));
                oneRecord.getRoom().setRoomLeft(rs.getInt("roomLeft"));
                oneRecord.getRoom().setPeople(rs.getInt("people"));
                oneRecord.getRoom().setAgcreage(rs.getFloat("acreage"));
            }

        } catch (SQLException ex) {
            System.out.println("getFullRoom - err");
            ex.printStackTrace();
        }
        return oneRecord;
    }

    public String getLinkRoomImageBy(String ID) {
        String link = "";
        try {
            OpenConnect();
            String query = "SELECT linkImage FROM roomimage  WHERE idRoomImage = ?";
            PreparedStatement preStmt = con.prepareStatement(query);
            preStmt.setString(1, ID);
            ResultSet rs = preStmt.executeQuery();

            if (rs.next()) {
                link = rs.getString("linkImage");
            }
            preStmt.close();
            rs.close();
            CloseConnect();
            return link;
        } catch (Exception e) {
            System.out.println("getLinkRoomImageBy err: ");
            e.printStackTrace();
        }
        return link;
    }

    public boolean removeRoomImageID(String removeID) {
        boolean result = false;
        try {
            OpenConnect();
            String query = "DELETE FROM roomimage WHERE idRoomImage = ?";
            PreparedStatement preStmt = con.prepareStatement(query);
            preStmt.setString(1, removeID);

            result = preStmt.execute();
            preStmt.close();
            CloseConnect();
            return result;
        } catch (Exception e) {
            System.out.println("removeRoomImageID err: ");
            e.printStackTrace();
        }
        return result;
    }
}
