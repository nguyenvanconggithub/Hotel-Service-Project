package model;

import java.util.List;

public class RoomUltilities {
	private List<Utilities> utility;
	private Room room;
	
	public RoomUltilities() {

	}
	public RoomUltilities(List<Utilities> utility, Room room) {
		this.utility = utility;
		this.room = room;
	}
	public Room getRoom() {
		return room;
	}
	public void setRoom(Room room) {
		this.room = room;
	}
	public List<Utilities> getUtility() {
		return utility;
	}
	public void setUtility(List<Utilities> utility) {
		this.utility = utility;
	}

}
