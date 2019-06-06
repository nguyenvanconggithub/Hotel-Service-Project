package model;



public class HotelUltilities {
	private Utilities utility;
	private Hotel hotel;
	public HotelUltilities() {

	}
	public HotelUltilities(Utilities utility, Hotel hotel) {
		this.utility = utility;
		this.hotel = hotel;
	}
	public Utilities getUtility() {
		return utility;
	}
	public void setUtility(Utilities utility) {
		this.utility = utility;
	}
	public Hotel getHotel() {
		return hotel;
	}
	public void setHotel(Hotel hotel) {
		this.hotel = hotel;
	}
}
