package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    Connection con;
    String url = "jdbc:mysql://localhost:3306/hotel";
    String classDriver = "com.mysql.cj.jdbc.Driver";
    String username = "root";
    String password = "123456";
    private static UserDAO instance = null;

    public static UserDAO Instance() {
        if (instance == null) {
            instance = new UserDAO();
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

    public boolean addNewUser(String name, String email, String phone, String username) {
        boolean result = false;
        try {
            OpenConnect();
            String query = "INSERT INTO user (Name, Email, phone, userName) VALUES(?,?,?,?)";
            PreparedStatement preStmt = con.prepareStatement(query);
            preStmt.setString(1, name);
            preStmt.setString(2, email);
            preStmt.setString(3, phone);
            preStmt.setString(4, username);
            result = preStmt.execute();

            preStmt.close();
            CloseConnect();
            return result;
        } catch (Exception e) {
            System.out.println("Add New User - err: ");
            e.printStackTrace();
        }
        return result;
    }

    public int getIdUserByUserName(String userName) {
        try {
            int idUser = 1;
            OpenConnect();
            String query = "SELECT idUser FROM account join user on account.userName=user.userName where user.userName=? ";
            PreparedStatement preStmt = con.prepareStatement(query);
            preStmt.setString(1, userName);
            ResultSet rs = preStmt.executeQuery();
            while (rs.next()) {
                idUser = rs.getInt("idUser");
            }
            preStmt.close();
            CloseConnect();
            return idUser;
        } catch (Exception e) {
            System.out.println("getIdUserByUserName - err: ");
            e.printStackTrace();
            return 0;
        }

    }
}
