package model;

import java.util.List;

public class RoomImage {
	private int idRoomImage;
	private List linkImage;
	private Room room;
	
	public RoomImage() {

	}
	public RoomImage(int idRoomImage, List linkImage, Room idRoom) {
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
	public List getLinkImage() {
		return linkImage;
	}
	public void setLinkImage(List linkImage) {
		this.linkImage = linkImage;
	}
	public Room getRoom() {
		return room;
	}
	public void setRoom(Room room) {
		this.room = room;
	}
}
