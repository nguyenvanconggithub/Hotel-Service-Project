package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import model.Bed;

public class BedDAO {

    Connection con;
    String url = "jdbc:mysql://localhost:3306/hotel";
    String classDriver = "com.mysql.cj.jdbc.Driver";
    String username = "root";
    String password = "123456";
    static BedDAO instance = null;

    public static BedDAO Instance() {
        if (instance == null) {
            instance = new BedDAO();
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

    public ArrayList<Bed> getListBed() {
        ArrayList<Bed> list = new ArrayList<Bed>();
        try {
            OpenConnect();
            Statement stmt = con.createStatement();
            String query = "select * from bed ";
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                Bed oneRecord = new Bed();
                oneRecord.setIdBed(rs.getInt("idBed"));
                oneRecord.setBedName(rs.getString("bedName"));
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

    public String getBedNameByID(int idBed) {
        String bedName = "";
        try {
            OpenConnect();
            String query = "SELECT bedName FROM bed WHERE idBed = ?";
            PreparedStatement preStmt = con.prepareStatement(query);
            preStmt.setInt(1, idBed);
            ResultSet rs = preStmt.executeQuery();
            if (rs.next()) {
                bedName = rs.getString("bedName");
                preStmt.close();
                rs.close();
                CloseConnect();
                return bedName;
            }

        } catch (Exception e) {
            System.out.println("getBedNameByID with err: ");
            e.printStackTrace();
        }
        return "";
    }

        public Bed getOneBedByIdBed(int idBed){
        Bed bed=new Bed();
        try {
            OpenConnect();
            String query = "select * from bed where idBed="+idBed;
            PreparedStatement preStmt = con.prepareStatement(query);
            ResultSet rs = preStmt.executeQuery();
            if (rs.next()) {
                bed.setIdBed(rs.getInt("idBed"));
                bed.setBedName(rs.getString("bedName"));
            }
            preStmt.close();
            rs.close();
            CloseConnect();
        } catch (Exception e) {
            System.out.println("getOneBedByIdBed - error: ");
            e.printStackTrace();
        }
        return bed;
    }
}
