package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import model.Account;

public class AccountDAO {

    Connection con;
    String url = "jdbc:mysql://localhost:3306/hotel";
    String classDriver = "com.mysql.cj.jdbc.Driver";
    String username = "root";
    String password = "123456";
    private static AccountDAO instance = null;

    public static AccountDAO Instance() {
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
        } catch (Exception e) {
            System.out.println("Already Exists Username - error: ");
            e.printStackTrace();
        }
        return false;
    }

    public boolean addNewAccount(String username, String pass, String role, int status) {
        boolean result = false;
        try {
            OpenConnect();
            String query = "INSERT INTO account VALUES(?,?,?,?)";
            PreparedStatement preStmt = con.prepareStatement(query);
            preStmt.setString(1, username);
            preStmt.setString(2, pass);
            preStmt.setString(3, role);
            preStmt.setInt(4, status);
            result = preStmt.execute();

            preStmt.close();
            CloseConnect();
            return result;
        } catch (Exception e) {
            System.out.println("Add New Account - err: ");
            e.printStackTrace();
        }
        return result;
    }

    public boolean validLogin(String username, String password) {
        try {
            OpenConnect();
            String query = "SELECT * FROM account WHERE userName =? AND passWord=?";
            PreparedStatement preStmt = con.prepareStatement(query);

            preStmt.setString(1, username);
            preStmt.setString(2, password);
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
        } catch (Exception e) {
            System.out.println("checkLogin - error: ");
            e.printStackTrace();
        }
        return false;
    }

    public String getRoleOfUser(String username) {
        String role = "";
        try {
            OpenConnect();
            String query = "SELECT * FROM account WHERE userName =?";
            PreparedStatement preStmt = con.prepareStatement(query);

            preStmt.setString(1, username);
            ResultSet rs = preStmt.executeQuery();
            if (rs.next()) {
                role = rs.getString("role");
                preStmt.close();
                rs.close();
                CloseConnect();
                return role;
            }
            preStmt.close();
            rs.close();
            CloseConnect();
        } catch (Exception e) {
            System.out.println("checkLogin - error: ");
            e.printStackTrace();
        }
        return role;
    }
        public void updateAccount(String userName,int status){
        String query="UPDATE account SET status=? WHERE userName=?";
        try {
            PreparedStatement preStmt= con.prepareStatement(query);
            preStmt.setInt(1, status);
            preStmt.setString(2, userName);
            preStmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("updateAccount -err");
            e.printStackTrace();
        }
    }
        
            
    public Account getAccountByIdBooking(int idBooking){
        Account account=new Account();
        try {
            OpenConnect();
            String query = "select * from account join user on account.username=user.username join booking on booking.idUser=user.idUser where idbooking=?";
            PreparedStatement preStmt = con.prepareStatement(query);

            preStmt.setInt(1, idBooking);
            ResultSet rs = preStmt.executeQuery();
            if (rs.next()) {
                account.setUserName(rs.getString("userName"));
            }
            preStmt.close();
            rs.close();
            CloseConnect();
        } catch (Exception e) {
            System.out.println("checkLogin - error: ");
            e.printStackTrace();
        }
        return account;
    }
}
