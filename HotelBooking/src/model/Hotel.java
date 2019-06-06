package model;

public class Hotel {
	private int idHotel;
	private String hotelName;
	private int star;
	private String address;
	private Account account;
	private float rate;
	private boolean removed;
	public Hotel() {
	}
	public Hotel(int idHotel, String hotelName, int star, String address, Account account, float rate,
			boolean removed) {
		this.idHotel = idHotel;
		this.hotelName = hotelName;
		this.star = star;
		this.address = address;
		this.account = account;
		this.rate = rate;
		this.removed = removed;
	}
	public int getIdHotel() {
		return idHotel;
	}
	public void setIdHotel(int idHotel) {
		this.idHotel = idHotel;
	}
	public String getHotelName() {
		return hotelName;
	}
	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Account getAccount() {
		return account;
	}
	public void setAccount(Account account) {
		this.account = account;
	}
	public float getRate() {
		return rate;
	}
	public void setRate(float rate) {
		this.rate = rate;
	}
	public boolean isRemoved() {
		return removed;
	}
	public void setRemoved(boolean removed) {
		this.removed = removed;
	}
}
