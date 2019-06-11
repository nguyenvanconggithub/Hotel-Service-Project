package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import model.Utilities;

public class UltilitiesDAO {

    Connection con;
    String url = "jdbc:mysql://localhost:3306/hotel";
    String classDriver = "com.mysql.cj.jdbc.Driver";
    String username = "root";
    String password = "1234";
    private static UltilitiesDAO instance = null;

    public static UltilitiesDAO Instance() {
        if (instance == null) {
            instance = new UltilitiesDAO();
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

    public ArrayList<Utilities> getListUtilities() {
        ArrayList<Utilities> list = new ArrayList<>();
        try {
            OpenConnect();
            Statement stmt = con.createStatement();
            String query = "SELECT * FROM utilities";
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                Utilities oneRecord = new Utilities();
                oneRecord.setIdUtility(rs.getInt("idUtility"));
                oneRecord.setUtilityName(rs.getString("utilityName"));

                list.add(oneRecord);
            }
            stmt.close();
            rs.close();
            CloseConnect();
            return list;
        } catch (Exception e) {
            System.out.println("get List Ultilies - Connect Fail with err: ");
            e.printStackTrace();
        }
        return list;
    }
    
}
