package model;

public class Utilities {
	private int idUtility;
	private String utilityName;
	public Utilities() {

	}
	public Utilities(int idUtility, String utilityName) {
		this.idUtility = idUtility;
		this.utilityName = utilityName;
	}
	public int getIdUtility() {
		return idUtility;
	}
	public void setIdUtility(int idUtility) {
		this.idUtility = idUtility;
	}
	public String getUtilityName() {
		return utilityName;
	}
	public void setUtilityName(String utilityName) {
		this.utilityName = utilityName;
	}
}
