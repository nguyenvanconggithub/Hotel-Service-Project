package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class AccountDAO {

    Connection con;
    String url = "jdbc:mysql://localhost:3306/hotel";
    String classDriver = "com.mysql.cj.jdbc.Driver";
    String username = "root";
    String password = "123456";
    private static AccountDAO instance = null;

    public AccountDAO Instance() {
        if (instance == null) {
            instance = new AccountDAO();
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

    public boolean alreadyExistsUsername(String newUsername) {
        try {
            OpenConnect();
            String query = "SELECT * FROM account WHERE userName =?";
            PreparedStatement preStmt = con.prepareStatement(query);
            
            preStmt.setString(1, newUsername);
            ResultSet rs = preStmt.executeQuery();
            if (rs.next()) {
                preStmt.close();
                rs.close();
                CloseConnect();
                return true;
            }
            preStmt.close();
            rs.close();
            CloseConnect();
            return false;
        } catch (Exception e) {
            System.out.println("Already Exists Username - error: ");
            e.printStackTrace();
        }
        return false;
    }

}
