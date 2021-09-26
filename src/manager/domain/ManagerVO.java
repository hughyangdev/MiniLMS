package manager.domain;

import java.sql.Date;

public class ManagerVO {

	private int mnum;
	private String mname;
	private String mphone;
	private String maddr;
	private String memail;
	private String mpwd;
	private String mid;
	private String mgender;
	private int maccstate;
	private Date mindate;
	
	public ManagerVO() {
		
	}
	
	
	public ManagerVO(int mnum, String mname, String mphone, String maddr, String memail, 
			String mpwd, String mid,String mgender, int maccstate, Date mindate) {
		super();
		this.mnum = mnum;
		this.mname = mname;
		this.mphone = mphone;
		this.maddr = maddr;
		this.memail = memail;
		this.mpwd = mpwd;
		this.mid = mid;
		this.mgender = mgender;
		this.maccstate = maccstate;
		this.mindate = mindate;
	}

	public int getMnum() {
		return mnum;
	}

	public void setMnum(int mnum) {
		this.mnum = mnum;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMphone() {
		return mphone;
	}

	public void setMphone(String mphone) {
		this.mphone = mphone;
	}

	public String getMaddr() {
		return maddr;
	}

	public void setMaddr(String maddr) {
		this.maddr = maddr;
	}

	public String getMemail() {
		return memail;
	}

	public void setMemail(String memail) {
		this.memail = memail;
	}

	public String getMpwd() {
		return mpwd;
	}

	public void setMpwd(String mpwd) {
		this.mpwd = mpwd;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMgender() {
		return mgender;
	}

	public void setMgender(String mgender) {
		this.mgender = mgender;
	}

	public int getMaccstate() {
		return maccstate;
	}

	public void setMaccstate(int maccstate) {
		this.maccstate = maccstate;
	}

	public Date getMindate() {
		return mindate;
	}

	public void setMindate(Date mindate) {
		this.mindate = mindate;
	}


	@Override
	public String toString() {
		return "ManagerVO [mnum=" + mnum + ", mname=" + mname + ", mphone=" + mphone + ", maddr=" + maddr + ", memail="
				+ memail + ", mpwd=" + mpwd + ", mid=" + mid + ", mgender=" + mgender + ", maccstate=" + maccstate
				+ ", mindate=" + mindate + "]";
	}
	
	
}
