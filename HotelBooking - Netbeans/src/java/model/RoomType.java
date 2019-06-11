package model;

public class RoomType {
	private int idRoomType;
	private String roomTypeName;
	public RoomType() {

	}
	public RoomType(int idRoomType, String roomTypeName) {
		this.idRoomType = idRoomType;
		this.roomTypeName = roomTypeName;
	}
	public int getIdRoomType() {
		return idRoomType;
	}
	public void setIdRoomType(int idRoomType) {
		this.idRoomType = idRoomType;
	}
	public String getRoomTypeName() {
		return roomTypeName;
	}
	public void setRoomTypeName(String roomTypeName) {
		this.roomTypeName = roomTypeName;
	}
}
