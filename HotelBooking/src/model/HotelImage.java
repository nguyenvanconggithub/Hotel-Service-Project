package model;


public class HotelImage {
	private int idHotelImage;
	private String linkImage;
	private Hotel hotel;
	public HotelImage() {
	}
	public HotelImage(int idHotelImage, String linkImage, Hotel hotel) {
		this.idHotelImage = idHotelImage;
		this.linkImage = linkImage;
		this.hotel = hotel;
	}
	public int getIdHotelImage() {
		return idHotelImage;
	}
	public void setIdHotelImage(int idHotelImage) {
		this.idHotelImage = idHotelImage;
	}
	public String getLinkImage() {
		return linkImage;
	}
	public void setLinkImage(String linkImage) {
		this.linkImage = linkImage;
	}
	public Hotel getHotel() {
		return hotel;
	}
	public void setHotel(Hotel hotel) {
		this.hotel = hotel;
	}
}
