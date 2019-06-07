package model;

public class Room {
	private int idRoom;
	private String roomName;
	private Hotel hotel;
	private Bed bed;
	private RoomType roomType;
	private int agcreage;
	private int cost;
	private int people;
	private int quantity;
	private int roomLeft;
	private String note;
	private boolean removed;
	public Room() {
	}
	public Room(int idRoom, String roomName, Hotel hotel, Bed bed, RoomType roomType, int agcreage, int cost,
			int people, int quantity, int roomLeft, String note, boolean removed) {
		this.idRoom = idRoom;
		this.roomName = roomName;
		this.hotel = hotel;
		this.bed = bed;
		this.roomType = roomType;
		this.agcreage = agcreage;
		this.cost = cost;
		this.people = people;
		this.quantity = quantity;
		this.roomLeft = roomLeft;
		this.note = note;
		this.removed = removed;
	}
	public int getIdRoom() {
		return idRoom;
	}
	public void setIdRoom(int idRoom) {
		this.idRoom = idRoom;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public Hotel getHotel() {
		return hotel;
	}
	public void setHotel(Hotel hotel) {
		this.hotel = hotel;
	}
	public Bed getBed() {
		return bed;
	}
	public void setBed(Bed bed) {
		this.bed = bed;
	}
	public RoomType getRoomType() {
		return roomType;
	}
	public void setRoomType(RoomType roomType) {
		this.roomType = roomType;
	}
	public int getAgcreage() {
		return agcreage;
	}
	public void setAgcreage(int agcreage) {
		this.agcreage = agcreage;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public int getPeople() {
		return people;
	}
	public void setPeople(int people) {
		this.people = people;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getRoomLeft() {
		return roomLeft;
	}
	public void setRoomLeft(int roomLeft) {
		this.roomLeft = roomLeft;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public boolean isRemoved() {
		return removed;
	}
	public void setRemoved(boolean removed) {
		this.removed = removed;
	}
}
