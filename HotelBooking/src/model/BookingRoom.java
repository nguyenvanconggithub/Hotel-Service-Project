package model;

import java.sql.Date;

public class BookingRoom {
	private int idBooking;
	private int idUser;
	private Date orderTime;
	private Date checkIn;
	private Date checkOut;
	private String note;
	
	public BookingRoom() {
	}
	public BookingRoom(int idBooking, int idUser, Date orderTime, Date checkIn, Date checkOut, String note) {

		this.idBooking = idBooking;
		this.idUser = idUser;
		this.orderTime = orderTime;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.note = note;
	}
	public int getIdBooking() {
		return idBooking;
	}
	public void setIdBooking(int idBooking) {
		this.idBooking = idBooking;
	}
	public int getIdUser() {
		return idUser;
	}
	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}
	public Date getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}
	public Date getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(Date checkIn) {
		this.checkIn = checkIn;
	}
	public Date getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(Date checkOut) {
		this.checkOut = checkOut;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
}
