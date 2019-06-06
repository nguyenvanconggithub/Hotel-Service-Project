package model;

public class DetailBookingRoom {
	private int idRoom;
	private BookingRoom bookingRoom;
	private int status;
	private int bookingNumber;
	private String ownRoomName;
	public DetailBookingRoom() {
	}
	public DetailBookingRoom(int idRoom, BookingRoom bookingRoom, int status, int bookingNumber, String ownRoomName) {		this.idRoom = idRoom;
		this.bookingRoom = bookingRoom;
		this.status = status;
		this.bookingNumber = bookingNumber;
		this.ownRoomName = ownRoomName;
	}
	public int getIdRoom() {
		return idRoom;
	}
	public void setIdRoom(int idRoom) {
		this.idRoom = idRoom;
	}
	public BookingRoom getBookingRoom() {
		return bookingRoom;
	}
	public void setBookingRoom(BookingRoom bookingRoom) {
		this.bookingRoom = bookingRoom;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getBookingNumber() {
		return bookingNumber;
	}
	public void setBookingNumber(int bookingNumber) {
		this.bookingNumber = bookingNumber;
	}
	public String getOwnRoomName() {
		return ownRoomName;
	}
	public void setOwnRoomName(String ownRoomName) {
		this.ownRoomName = ownRoomName;
	}
}
