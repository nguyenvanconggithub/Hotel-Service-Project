package model;

public class User {
	private int idUser;
	private String name;
	private String email;
	private String phone;
	private Account account= new Account();
	public User() {

	}
	public User(int idUser, String name, String email, String phone, Account account) {
		this.idUser = idUser;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.account = account;
	}
	public int getIdUser() {
		return idUser;
	}
	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Account getAccount() {
		return account;
	}
	public void setAccount(Account account) {
		this.account = account;
	}
}
