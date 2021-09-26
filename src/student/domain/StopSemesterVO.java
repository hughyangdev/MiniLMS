package student.domain;

import java.sql.Date;

public class StopSemesterVO {
	
	private int ssnum;
	private String ssReason;
	private int ssyear;
	private int sssemester;
	private int resultState;
	private Date registerDate;
	
	public StopSemesterVO() {
		
	}

	public StopSemesterVO(int ssnum, String ssReason, int ssyear, int sssemester, int resultState, Date registerDate) {
		super();
		this.ssnum = ssnum;
		this.ssReason = ssReason;
		this.ssyear = ssyear;
		this.sssemester = sssemester;
		this.resultState = resultState;
		this.registerDate = registerDate;
	}

	public int getSsnum() {
		return ssnum;
	}

	public void setSsnum(int ssnum) {
		this.ssnum = ssnum;
	}

	public String getSsReason() {
		return ssReason;
	}

	public void setSsReason(String ssReason) {
		this.ssReason = ssReason;
	}

	public int getSsyear() {
		return ssyear;
	}

	public void setSsyear(int ssyear) {
		this.ssyear = ssyear;
	}

	public int getSssemester() {
		return sssemester;
	}

	public void setSssemester(int sssemester) {
		this.sssemester = sssemester;
	}

	public int getResultState() {
		return resultState;
	}

	public void setResultState(int resultState) {
		this.resultState = resultState;
	}

	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	
	
}
