package model;

import java.util.List;

public class HotelUltilities {
	private List<Utilities> utility;
	private Hotel hotel;
	public HotelUltilities() {

	}
	public HotelUltilities(List<Utilities> utility, Hotel hotel) {
		this.utility = utility;
		this.hotel = hotel;
	}
	public List<Utilities> getUtility() {
		return utility;
	}
	public void setUtility(List<Utilities> utility) {
		this.utility = utility;
	}
	public Hotel getHotel() {
		return hotel;
	}
	public void setHotel(Hotel hotel) {
		this.hotel = hotel;
	}
}
