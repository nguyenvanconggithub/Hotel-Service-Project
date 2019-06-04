package modal;

public class SinhVien {
	private String maSV;
	private String hoTen;
	private String SDT;
	
	public SinhVien() {
		// TODO Auto-generated constructor stub
	}

	public SinhVien(String maSV, String hoTen, String sDT) {
		this.maSV = maSV;
		this.hoTen = hoTen;
		SDT = sDT;
	}

	public String getMaSV() {
		return maSV;
	}

	public void setMaSV(String maSV) {
		this.maSV = maSV;
	}

	public String getHoTen() {
		return hoTen;
	}

	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}

	public String getSDT() {
		return SDT;
	}

	public void setSDT(String sDT) {
		SDT = sDT;
	}
	
}
