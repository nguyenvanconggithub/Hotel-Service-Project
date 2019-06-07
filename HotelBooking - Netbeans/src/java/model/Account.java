package model;

public class Account {
	private String userName;
	private String passWord;
	private String role;
	private int status;
	public String getUserName() {
		return userName;
	}
	public String getPassWord() {
		return passWord;
	}
	public String getRole() {
		return role;
	}
	public int getStatus() {
		return status;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Account(String userName, String passWord, String role, int status) {
		this.userName = userName;
		this.passWord = passWord;
		this.role = role;
		this.status = status;
	}
	public Account() {
		
	}
	
}
