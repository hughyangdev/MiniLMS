package prof.domain;

import java.sql.Date;

public class ProfessorVO {

	private int pnum;
	private int pclass;
	private String pname;
	private String pmajor;
	private String pphone;
	private String paddr;
	private String pemail;
	private String ppwd;
	private String pid;
	private String pgender;
	private int paccstate;
	private Date pindate;
	
	public ProfessorVO() {
		
	}
	
	public ProfessorVO(int pnum, int pclass, String pname, String pmajor, String pphone, String paddr, String pemail,
			String ppwd, String pid, String pgender, int paccstate, Date pindate) {
		super();
		this.pnum = pnum;
		this.pclass = pclass;
		this.pname = pname;
		this.pmajor = pmajor;
		this.pphone = pphone;
		this.paddr = paddr;
		this.pemail = pemail;
		this.ppwd = ppwd;
		this.pid = pid;
		this.pgender = pgender;
		this.paccstate = paccstate;
		this.pindate = pindate;
	}


	public int getPnum() {
		return pnum;
	}

	public void setPnum(int pnum) {
		this.pnum = pnum;
	}

	public int getPclass() {
		return pclass;
	}

	public void setPclass(int pclass) {
		this.pclass = pclass;
	}

	public String getPname() {
		return pname;
	}
	
	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPmajor() {
		return pmajor;
	}

	public void setPmajor(String pmajor) {
		this.pmajor = pmajor;
	}

	public String getPphone() {
		return pphone;
	}

	public void setPphone(String pphone) {
		this.pphone = pphone;
	}

	public String getPaddr() {
		return paddr;
	}

	public void setPaddr(String paddr) {
		this.paddr = paddr;
	}

	public String getPemail() {
		return pemail;
	}

	public void setPemail(String pemail) {
		this.pemail = pemail;
	}

	public String getPpwd() {
		return ppwd;
	}

	public void setPpwd(String ppwd) {
		this.ppwd = ppwd;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getPgender() {
		return pgender;
	}

	public void setPgender(String pgender) {
		this.pgender = pgender;
	}

	public int getPaccstate() {
		return paccstate;
	}

	public void setPaccstate(int paccstate) {
		this.paccstate = paccstate;
	}
	
	public Date getPindate() {
		return pindate;
	}

	public void setPindate(Date pindate) {
		this.pindate = pindate;
	}

	@Override
	public String toString() {
		return "ProfessorVO [pnum=" + pnum + ", pclass=" + pclass + ", pname=" + pname + ", pmajor=" + pmajor
				+ ", pphone=" + pphone + ", paddr=" + paddr + ", pemail=" + pemail + ", ppwd=" + ppwd + ", pid=" + pid
				+ ", pgender=" + pgender + ", paccstate=" + paccstate + ", pindate=" + pindate + "]";
	}
	
	
}
