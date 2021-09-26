package prof.domain;

public class UniversityVO {

	private int uniCode;
	private String uniName;
	
	public UniversityVO() {
		System.out.println("UniversityVO() ½ÇÇà...");
	}
	
	
	public UniversityVO(int uniCode, String uniName) {
		super();
		this.uniCode = uniCode;
		this.uniName = uniName;
	}


	public int getUniCode() {
		return uniCode;
	}
	public void setUniCode(int uniCode) {
		this.uniCode = uniCode;
	}
	public String getUniName() {
		return uniName;
	}
	public void setUniName(String uniName) {
		this.uniName = uniName;
	}
	
	
}
