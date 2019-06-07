package model;

public class RoomType {
	private String idRoomType;
	private String roomTypeName;
	public RoomType() {

	}
	public RoomType(String idRoomType, String roomTypeName) {
		this.idRoomType = idRoomType;
		this.roomTypeName = roomTypeName;
	}
	public String getIdRoomType() {
		return idRoomType;
	}
	public void setIdRoomType(String idRoomType) {
		this.idRoomType = idRoomType;
	}
	public String getRoomTypeName() {
		return roomTypeName;
	}
	public void setRoomTypeName(String roomTypeName) {
		this.roomTypeName = roomTypeName;
	}
}
