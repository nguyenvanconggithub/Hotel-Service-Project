package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import modal.SinhVien;

public class SinhVienTable {
	private int pageSize = 0;
	private static  SinhVienTable instance;
	
	public static SinhVienTable getInstance() {
		if(instance == null) {
			instance = new SinhVienTable();
		}
		return instance;
	}
	private Connection getConnect() {
		Connection connection = null;
		try {
			String conString = "jdbc:mysql://localhost:3306/demojspdatabase";
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(conString, "root", "123456");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return connection;
	}
	public ArrayList<SinhVien> getAllData() {
		ArrayList<SinhVien> lstSinhVien = new ArrayList<SinhVien>();
		try {
			Connection connection = getConnect();
			Statement stmt = connection.createStatement();
			String query = "SELECT * FROM demo_table";
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				String maSV = rs.getString("MaSV");
				String hoTen = rs.getString("HoTen");
				String SDT = rs.getNString("SDT");
				
				SinhVien sv = new SinhVien(maSV,hoTen,SDT);
				lstSinhVien.add(sv);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return lstSinhVien;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public ArrayList<SinhVien> getDataInPage(int page){
		ArrayList<SinhVien> lstSinhVien = new ArrayList<SinhVien>();
		int offset = (page-1) * pageSize;
		try {
			Connection connection = getConnect();
			Statement stmt = connection.createStatement();
			String query = "SELECT * FROM demo_table LIMIT "+offset+","+pageSize+"";
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				String maSV = rs.getString("MaSV");
				String hoTen = rs.getString("HoTen");
				String SDT = rs.getNString("SDT");
				
				SinhVien sv = new SinhVien(maSV,hoTen,SDT);
				lstSinhVien.add(sv);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return lstSinhVien;
	}
	public SinhVien getSinhVien(String MaSV) {
		SinhVien sv = null;
		try {
			Connection connection = getConnect();
			Statement stmt = connection.createStatement();
			String query = "SELECT * FROM demo_table WHERE MaSV = '"+MaSV+"'";
			ResultSet rs = stmt.executeQuery(query);
			
			if(rs.next()) {
				String maSV = rs.getString("MaSV");
				String hoTen = rs.getString("HoTen");
				String SDT = rs.getNString("SDT");
				
				sv = new SinhVien(maSV,hoTen,SDT);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return sv;
	}
}
