package manager.domain;

public class ScheduleVO {

	private int schnum;
	private String schstartdate;
	private String schenddate;
	private String schcontents;
	
	public ScheduleVO() {
		
	}
	
	public ScheduleVO(int schnum, String schstartdate, String schenddate, String schcontents) {
		super();
		this.schnum = schnum;
		this.schstartdate = schstartdate;
		this.schenddate = schenddate;
		this.schcontents = schcontents;
	}
	
	@Override
	public String toString() {
		return "Schedule [schnum=" + schnum + ", schstartdate=" + schstartdate + ", schenddate=" + schenddate
				+ ", schcontents=" + schcontents + "]";
	}
	public int getSchnum() {
		return schnum;
	}
	public void setSchnum(int schnum) {
		this.schnum = schnum;
	}
	public String getSchstartdate() {
		return schstartdate;
	}
	public void setSchstartdate(String schstartdate) {
		this.schstartdate = schstartdate;
	}
	public String getSchenddate() {
		return schenddate;
	}
	public void setSchenddate(String schenddate) {
		this.schenddate = schenddate;
	}
	public String getSchcontents() {
		return schcontents;
	}
	public void setSchcontents(String schcontents) {
		this.schcontents = schcontents;
	}
	
}