package connection;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import model.Bed;
import model.Booking;
import model.Hotel;
import model.User;

public class BookingDAO {

    Connection con;
    String url = "jdbc:mysql://127.0.0.1:3306/hotel";
    String classDriver = "com.mysql.cj.jdbc.Driver";
    String username = "root";
    String password = "123456";
    static BookingDAO instance = null;

    public static BookingDAO Instance() {
        if (instance == null) {
            instance = new BookingDAO();
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

    public ArrayList<Booking> getListHotelByIdUser(int idUser, int page, int itemsPerPage) {
        ArrayList<Booking> list = new ArrayList<>();
        try {
            OpenConnect();
            String query = "SELECT * FROM booking JOIN hotel ON booking.idHotel=hotel.idHotel \n"
                    + " WHERE idUser=? order by idBooking DESC limit ?,?";
            PreparedStatement preStmt = con.prepareStatement(query);
            preStmt.setInt(1, idUser);
            preStmt.setInt(2, (page - 1) * itemsPerPage);
            preStmt.setInt(3, itemsPerPage);
            ResultSet rs = preStmt.executeQuery();
            while (rs.next()) {
                Booking oneRecord = new Booking();
                oneRecord.getUser().setIdUser(rs.getInt("idUser"));
                oneRecord.setIdBooking(rs.getInt("idBooking"));
                Timestamp timestamp = rs.getTimestamp("bookingTime");
                oneRecord.setOrderTime(timestamp);
                oneRecord.setCheckIn(rs.getDate("checkIn"));
                oneRecord.setCheckOut(rs.getDate("checkOut"));
                oneRecord.getHotel().setIdHotel(rs.getInt("idHotel"));
                oneRecord.getHotel().setHotelName(rs.getString("hotelName"));
                oneRecord.getHotel().setAddress(rs.getString("address"));
                oneRecord.getHotel().setSDT(rs.getString("SDT"));
                oneRecord.getHotel().setStar(rs.getInt("star"));
                oneRecord.getHotel().setRate(rs.getFloat("rate"));
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

    public int countBooking(String userName) {
        int count = 0;
        try {
            OpenConnect();
            String query = "SELECT count(idBooking) FROM booking JOIN hotel ON booking.idHotel=hotel.idHotel WHERE userName=? ";
            PreparedStatement preStmt = con.prepareStatement(query);
            preStmt.setString(1, userName);
            ResultSet rs = preStmt.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
            preStmt.close();
            rs.close();
            CloseConnect();
            return count;
        } catch (Exception e) {
            System.out.println("countBookingByUserName err: ");
            e.printStackTrace();
        }
        return count;
    }

    public int countListHotelByIdUser(int idUser) {
        int count = 0;
        try {
            OpenConnect();
            String query = "SELECT count(idBooking) FROM booking JOIN hotel ON booking.idHotel=hotel.idHotel WHERE idUser=?"
                    + " ORDER BY idBooking ";
            PreparedStatement preStmt = con.prepareStatement(query);
            preStmt.setInt(1, idUser);
            ResultSet rs = preStmt.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
            preStmt.close();
            rs.close();
            CloseConnect();
            return count;
        } catch (Exception e) {
            System.out.println("getListHotelByIdUser err: ");
            e.printStackTrace();
        }
        return count;
    }

    public int getDateById(int idBooking) {
        int number = 0;
        try {
            OpenConnect();
            String query = "select datediff(checkOut,checkIn) from booking where idBooking=?";
            PreparedStatement preStmt = con.prepareStatement(query);
            preStmt.setInt(1, idBooking);
            ResultSet rs = preStmt.executeQuery();
            while (rs.next()) {
                number = rs.getInt(1);
            }
            preStmt.close();
            rs.close();
            CloseConnect();
            return number;
        } catch (Exception e) {
            System.out.println("getDateById - error: ");
            e.printStackTrace();
        }
        return number;
    }

    public boolean addNewBooking(String idUser, String checkin, String checkout, String orderTime, String note, String idHotel) {
        boolean result = false;
        try {
            OpenConnect();
            String query = "INSERT INTO Booking (idUser, bookingTime, checkIn, checkOut, note, idHotel, statusBooking)"
                    + " VALUES (?,?,?,?,?,?,?)";
            PreparedStatement preStmt = con.prepareStatement(query);
            preStmt.setString(1, idUser);
            preStmt.setString(2, orderTime);
            preStmt.setString(3, checkin);
            preStmt.setString(4, checkout);
            preStmt.setString(5, note);
            preStmt.setString(6, idHotel);
            preStmt.setString(7, "1");

            result = preStmt.execute();

            CloseConnect();
            return result;
        } catch (Exception e) {
            System.out.println("addNewBooking err: ");
            e.printStackTrace();
        }
        return result;
    }

    public int newestIDBookingBy(String idUser) {
        int idBooking = -1;
        try {
            OpenConnect();
            String query = "SELECT MAX(idBooking) AS newBooking FROM Booking WHERE idUser = ?";
            PreparedStatement preStmt = con.prepareStatement(query);
            preStmt.setString(1, idUser);
            ResultSet rs = preStmt.executeQuery();
            if (rs.next()) {
                idBooking = rs.getInt("newBooking");
            }
            rs.close();
            preStmt.close();
            CloseConnect();
            return idBooking;
        } catch (Exception e) {
            System.out.println("addNewBooking err: ");
            e.printStackTrace();
        }
        return idBooking;
    }

    public Booking getBookingByIdBooking(int idBooking){
        Booking booking=new Booking();
        try {
            OpenConnect();
            Statement stmt = con.createStatement();
            String query = "select * from booking where idBooking="+idBooking;
            ResultSet rs = stmt.executeQuery(query);
            if (rs.next()) {
                booking.setIdBooking(rs.getInt("idBooking"));
                User user=UserDAO.Instance().getUserByIdUser(rs.getInt("idUser"));
                booking.setUser(user);
                booking.setOrderTime(rs.getTimestamp("bookingTime"));
                booking.setCheckIn(rs.getDate("checkIn"));
                booking.setCheckOut(rs.getDate("checkOut"));
                booking.setNote(rs.getString("note"));
                Hotel hotel=HotelDAO.Instance().getHotelByID(rs.getInt("idHotel"));
                booking.setHotel(hotel);
            }
            stmt.close();
            rs.close();
            CloseConnect();
        } catch (Exception e) {
            System.out.println("getListHotelByIdUser err: ");
            e.printStackTrace();
        }
        return booking;
    }
    public ArrayList<Booking> getFullBookingInfo(int page, int itemsPerPage) {
        ArrayList<Booking> fullBookingInfo = new ArrayList<>();
        try {
            OpenConnect();
            String query = "SELECT idBooking, Name, phone, bookingTime, hotelName, checkin, checkout FROM booking JOIN user\n"
                    + "ON booking.idUser = user.idUser\n"
                    + "JOIN hotel ON booking.idHotel = hotel.idHotel ORDER BY idBooking DESC LIMIT ?,?";
            PreparedStatement preStmt = con.prepareStatement(query);
            preStmt.setInt(1, (page - 1) * itemsPerPage);
            preStmt.setInt(2, itemsPerPage);
            ResultSet rs = preStmt.executeQuery();
            while (rs.next()) {
                Booking oneRecord = new Booking();
                oneRecord.setIdBooking(rs.getInt("idBooking"));
                oneRecord.getUser().setName(rs.getString("Name"));
                oneRecord.getUser().setPhone(rs.getString("phone"));
                oneRecord.setOrderTime(rs.getTimestamp("bookingTime"));
                oneRecord.getHotel().setHotelName(rs.getString("hotelName"));
                oneRecord.setCheckIn(rs.getDate("checkin"));
                oneRecord.setCheckOut(rs.getDate("checkout"));
                fullBookingInfo.add(oneRecord);
            }
            rs.close();
            preStmt.close();
            CloseConnect();
        } catch (Exception e) {
            System.out.println("getFullBookingInfo with err: ");
            e.printStackTrace();
        }
        return fullBookingInfo;
    }
    public int totalBooking(){
        int total = -1;
        try {
            OpenConnect();
            String query = "SELECT COUNT(*) AS TOTAL FROM booking";
            PreparedStatement preStmt = con.prepareStatement(query);
            ResultSet rs = preStmt.executeQuery();
            if(rs.next()){
                total = rs.getInt("TOTAL");
            }
            CloseConnect();
        } catch (Exception e) {
            System.out.println("totalBooking err: ");
            e.printStackTrace();
        }
        return total;
    }
    public int totalCostByIdBooking(int idBooking){
        int totalCost = -1;
        try {
            OpenConnect();
            String query =  "SELECT SUM(cost * bookingNumber) * datediff(checkout,checkin) AS TOTALCOST from detailbooking JOIN room\n" +
                            "ON detailbooking.idRoom = room.idRoom JOIN booking\n" +
                            "ON detailbooking.idBooking = booking.idBooking WHERE booking.idBooking = ? AND detailbooking.status = 1";
            PreparedStatement preStmt = con.prepareStatement(query);
            preStmt.setInt(1, idBooking);
            ResultSet rs = preStmt.executeQuery();
            if(rs.next()){
                totalCost = rs.getInt("TOTALCOST");
            }
            CloseConnect();
        } catch (Exception e) {
            System.out.println("totalCostByIdBooking err: ");
            e.printStackTrace();
        }
        return totalCost;
    }
    public ArrayList<Booking> getInforBooking(){
        ArrayList<Booking> list= new ArrayList<>();
         try {
            OpenConnect();
            String query=" SELECT month(bookingTime) AS 'time',count(idbooking) AS'quantity' "
                    + "FROM booking where year(bookingTime)=year(now()) group by month(bookingTime);";
            PreparedStatement preStmt = con.prepareStatement(query);
            ResultSet rs = preStmt.executeQuery();
            while(rs.next()){
                Booking oneRecord = new Booking();
                oneRecord.setIdBooking(rs.getInt(2));
                String t="Tháng "+rs.getString(1);
                oneRecord.setNote(t);
                list.add(oneRecord);
            }
            CloseConnect();
        } catch (Exception e) {
            System.out.println("getInforBookingerr: ");
            e.printStackTrace();
        }
         return list;
    }
    public static void main(String[] args) {
        ArrayList<Booking> list= BookingDAO.Instance().getInforBooking();
        System.out.println(list.get(1).getIdBooking() +" | "+list.get(1).getNote());
    }
}
