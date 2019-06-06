package model;

public class RoomImage {
	private int idRoomImage;
	private String linkImage;
	private int idRoom;
	
	public RoomImage() {

	}
	public RoomImage(int idRoomImage, String linkImage, int idRoom) {
		this.idRoomImage = idRoomImage;
		this.linkImage = linkImage;
		this.idRoom = idRoom;
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
	public int getIdRoom() {
		return idRoom;
	}
	public void setIdRoom(int idRoom) {
		this.idRoom = idRoom;
	}
}
