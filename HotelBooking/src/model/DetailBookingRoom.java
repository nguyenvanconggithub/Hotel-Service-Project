package model;

public class DetailBookingRoom {
	private Room room;
	private BookingRoom bookingRoom;
	private int status;
	private int bookingNumber;
	private String ownRoomName;
	public DetailBookingRoom() {
	}
	public DetailBookingRoom(Room Room, BookingRoom bookingRoom, int status, int bookingNumber, String ownRoomName) {		
                this.room = Room;
		this.bookingRoom = bookingRoom;
		this.status = status;
		this.bookingNumber = bookingNumber;
		this.ownRoomName = ownRoomName;
	}
	public Room getRoom() {
		return room;
	}
	public BookingRoom getBookingRoom() {
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
