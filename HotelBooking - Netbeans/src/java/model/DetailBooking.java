package model;

public class DetailBooking {
	private Room room= new Room();
	private Booking bookingRoom = new  Booking();
	private int status;
	private int bookingNumber;
	private String ownRoomName;
	public DetailBooking() {
	}
	public DetailBooking(Room Room, Booking bookingRoom, int status, int bookingNumber, String ownRoomName) {		
                this.room = Room;
		this.bookingRoom = bookingRoom;
		this.status = status;
		this.bookingNumber = bookingNumber;
		this.ownRoomName = ownRoomName;
	}
	public Room getRoom() {
		return room;
	}
	public Booking getBooking() {
		return bookingRoom;
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
