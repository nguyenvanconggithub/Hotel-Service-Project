package model;

public class Bed {
	private int idBed;
	private String bedName;
	public Bed() {

	}
	public Bed(int idBed, String bedName) {
		this.idBed = idBed;
		this.bedName = bedName;
	}
	public int getIdBed() {
		return idBed;
	}
	public String getBedName() {
		return bedName;
	}
	public void setIdBed(int idBed) {
		this.idBed = idBed;
	}
	public void setBedName(String bedName) {
		this.bedName = bedName;
	}
}
