package model;

import java.util.List;

public class HotelImage {
	private int idHotelImage;
	private List linkImage;
	private Hotel hotel;
	public HotelImage() {
	}
	public HotelImage(int idHotelImage, List linkImage, Hotel hotel) {
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
	public List getLinkImage() {
		return linkImage;
	}
	public void setLinkImage(List linkImage) {
		this.linkImage = linkImage;
	}
	public Hotel getHotel() {
		return hotel;
	}
	public void setHotel(Hotel hotel) {
		this.hotel = hotel;
	}
}
