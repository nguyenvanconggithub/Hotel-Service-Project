package model;



public class RoomUltilities {
	private Utilities utility = new Utilities();
	private Room room = new Room();
	
	public RoomUltilities() {

	}
	public RoomUltilities(Utilities utility, Room room) {
		this.utility = utility;
		this.room = room;
	}
	public Room getRoom() {
		return room;
	}
	public void setRoom(Room room) {
		this.room = room;
	}
	public Utilities getUtility() {
		return utility;
	}
	public void setUtility(Utilities utility) {
		this.utility = utility;
	}

}
