package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import model.Booking;
import model.DetailBooking;
import model.Room;


public class DetailBookingDAO {

    Connection con;
    String url = "jdbc:mysql://localhost:3306/hotel";
    String classDriver = "com.mysql.cj.jdbc.Driver";
    String username = "root";
    String password = "123456";
    static DetailBookingDAO instance = null;

    public static DetailBookingDAO Instance() {
        if (instance == null) {
            instance = new DetailBookingDAO();
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

    public ArrayList<DetailBooking> getAllListBooking(String userName, int page, int itemsPerPage) {
        ArrayList<DetailBooking> list = new ArrayList<>();
        try {
            OpenConnect();
            String query = "SELECT * FROM detailbooking JOIN booking ON detailbooking.idBooking=booking.idBooking\n"
                    + " JOIN hotel ON hotel.idHotel=booking.idHotel WHERE userName=?\n"
                    + " group by booking.idBooking order by  booking.idBooking DESC  LIMIT ?,?";
            PreparedStatement preStmt = con.prepareStatement(query);
            preStmt.setString(1, userName);
            preStmt.setInt(2, (page - 1) * itemsPerPage);
            preStmt.setInt(3, itemsPerPage);
            ResultSet rs = preStmt.executeQuery();
            while (rs.next()) {
                DetailBooking oneRecord = new DetailBooking();
                oneRecord.getBooking().setIdBooking(rs.getInt("idBooking"));
                oneRecord.getBooking().setStatusBooking(rs.getInt("statusBooking"));
                oneRecord.getBooking().setCheckIn(rs.getDate("checkIn"));
                oneRecord.getBooking().setCheckOut(rs.getDate("checkOut"));
                Timestamp timestamp = rs.getTimestamp("bookingTime");
                oneRecord.getBooking().setOrderTime(timestamp);
                oneRecord.getBooking().getHotel().setHotelName(rs.getString("hotelName"));
                oneRecord.setOwnRoomName(rs.getString("ownRoomName"));
                list.add(oneRecord);
            }
            preStmt.close();
            rs.close();
            CloseConnect();
            return list;
        } catch (Exception e) {
            System.out.println("getListHotelByIdUser err: ");
            e.printStackTrace();
        }
        return list;
    }

    public int getHotelCancelByID(int idUser, int idHotel) {
        int count = 1;
        try {
            OpenConnect();
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM detailbooking JOIN booking ON detailbooking.idBooking=booking.idBooking "
                    + "WHERE idUser='" + idUser + "' AND idHotel='" + idHotel + "' AND status !=0 ";
            ResultSet rs = stmt.executeQuery(query);
            if (rs.next() == false) {
                count = 0;
            }
            stmt.close();
            rs.close();
            CloseConnect();
            return count;
        } catch (Exception e) {
            System.out.println("getListHotelByIdUser err: ");
            e.printStackTrace();
        }
        return count;
    }

    public int getMoreAvailableRoomLeft(String checkin, String checkout, int idRoom) {
        int roomAvailable = 0;
        try {
            OpenConnect();
            String query = "SELECT SUM(bookingNumber) AS numberOfAvailabeRoom FROM detailbooking JOIN booking"
                    + " ON booking.idbooking = detailbooking.idbooking"
                    + " WHERE (? > checkOut OR ? < checkIn)"
                    + " AND idRoom = ? AND detailbooking.status = 1 GROUP BY idRoom";
            PreparedStatement preStmt = con.prepareStatement(query);
            preStmt.setString(1, checkin);
            preStmt.setString(2, checkout);
            preStmt.setInt(3, idRoom);
            ResultSet rs = preStmt.executeQuery();
            if (rs.next()) {
                roomAvailable = rs.getInt("numberOfAvailabeRoom");
            }
            preStmt.close();
            rs.close();
            CloseConnect();
            return roomAvailable;
        } catch (Exception e) {
            System.out.println("getMoreAvailableRoomLeft err: ");
            e.printStackTrace();
        }
        return roomAvailable;
    }

    public int getBookingNumberById(String idRoom, String idBooking) {
        int number = 0;
        try {
            OpenConnect();
            String query = "SELECT bookingNumber FROM detailbooking WHERE idRoom=? AND idBooking=?";
            PreparedStatement preStmt = con.prepareStatement(query);
            preStmt.setString(1, idRoom);
            ResultSet rs = preStmt.executeQuery();
            while (rs.next()) {
                number = rs.getInt("cost");
            }
            preStmt.close();
            rs.close();
            CloseConnect();
            return number;
        } catch (Exception e) {
            System.out.println("getBookingNumberById - error: ");
            e.printStackTrace();
        }
        return number;
    }

    public ArrayList<Room> getListRoomBooking(int idBooking) {
        ArrayList<Room> list = new ArrayList<>();
        try {
            OpenConnect();
            String query = "SELECT * FROM detailbooking WHERE idBooking=?";
            PreparedStatement preStmt = con.prepareStatement(query);
            preStmt.setInt(1, idBooking);
            ResultSet rs = preStmt.executeQuery();
            while (rs.next()) {
                Room oneRecord = new Room();
                oneRecord.setIdRoom(rs.getInt("idRoom"));
                oneRecord.setQuantity(rs.getInt("bookingNumber"));
                list.add(oneRecord);
            }
            preStmt.close();
            rs.close();
            CloseConnect();
            return list;
        } catch (Exception e) {
            System.out.println("getBookingNumberById - error: ");
            e.printStackTrace();
        }
        return list;
    }

    public boolean addNewDetailBooking(DetailBooking newDetailBooking) {
        boolean result = false;
        try {
            OpenConnect();
            String query = "INSERT INTO detailbooking (idRoom, idBooking, status, bookingNumber, ownRoomName)"
                    + " VALUES (?,?,?,?,?)";
            PreparedStatement preStmt = con.prepareStatement(query);
            preStmt.setInt(1, newDetailBooking.getRoom().getIdRoom());
            preStmt.setInt(2, newDetailBooking.getBooking().getIdBooking());
            preStmt.setInt(3, newDetailBooking.getStatus());
            preStmt.setInt(4, newDetailBooking.getBookingNumber());
            preStmt.setString(5, newDetailBooking.getOwnRoomName());
            result = preStmt.execute();

            preStmt.close();
            CloseConnect();
            return result;
        } catch (Exception e) {
            System.out.println("addNewDetailBooking err: ");
            e.printStackTrace();
        }
        return result;
    }

    public static void main(String[] args) {
        //System.out.println(DetailBookingDAO.Instance().getMoreAvailableRoomLeft("2019-06-21", "2019-06-30", 7));
        ArrayList<Room> list = DetailBookingDAO.Instance().getListRoomBooking(1);
        for (Room room : list) {
            System.out.println(room.getIdRoom() + " | " + room.getQuantity());
        }
    }
    
    //update khi hủy phòng hoặc đặt lại hoặc hủy tất cả
    public void updateStatus(int idBooking, int idRoom, String isCalcel) {
        int status;
        if (isCalcel.endsWith("cal")) {
            status=1;
        }else{
            status=0;
        }
        try {
            OpenConnect();
            String query;
            if(isCalcel.equals("all")){
                query= "update detailbooking set status =" + status + "  where idBooking=" + idBooking;
            }else{
                query = "update detailbooking set status =" + status + "  where idBooking=" + idBooking + " AND idRoom=" + idRoom + "";
            }
            PreparedStatement preStmt = con.prepareStatement(query);

            preStmt.execute();
            preStmt.close();
            CloseConnect();
        } catch (Exception e) {
            System.out.println("editHotel with err: ");
            e.printStackTrace();
        }
    }
    
     public ArrayList<DetailBooking> getListDetailBookingByIdBooking(int idBooking) {
        ArrayList<DetailBooking> list = new ArrayList<DetailBooking>();
        try {
            OpenConnect();
            Statement stmt = con.createStatement();
            String query = "select * from detailbooking where idBooking=" + idBooking;
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                DetailBooking oneRecord = new DetailBooking();
                Room room = RoomDAO.Instance().getRoomByIdRoom(rs.getInt("idRoom"));
                oneRecord.setRoom(room);
                Booking booking = BookingDAO.Instance().getBookingByIdBooking(rs.getInt("idBooking"));
                oneRecord.setBookingRoom(booking);
                oneRecord.setStatus(rs.getInt("status"));
                oneRecord.setBookingNumber(rs.getInt("bookingNumber"));
                oneRecord.setOwnRoomName(rs.getString("ownRoomName"));
                list.add(oneRecord);
            }
            stmt.close();
            rs.close();
            CloseConnect();
            return list;
        } catch (Exception e) {
            System.out.println("getListDetailBookingByIdBooking err: ");
            e.printStackTrace();
        }
        return list;
    }
}
