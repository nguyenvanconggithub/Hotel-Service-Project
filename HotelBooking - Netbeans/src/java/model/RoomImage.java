package model;


public class RoomImage {
	private int idRoomImage;
	private String linkImage;
	private Room room= new Room();
	
	public RoomImage() {

	}
	public RoomImage(int idRoomImage, String linkImage, Room idRoom) {
		this.idRoomImage = idRoomImage;
		this.linkImage = linkImage;
		this.room = idRoom;
	}
	public int getIdRoomImage() {
		return idRoomImage;
	}
	public void setIdRoomImage(int idRoomImage) {
		this.idRoomImage = idRoomImage;
	}
	public String getLinkImage() {
		return linkImage;
	}
	public void setLinkImage(String linkImage) {
		this.linkImage = linkImage;
	}
	public Room getRoom() {
		return room;
	}
	public void setRoom(Room room) {
		this.room = room;
	}
}
