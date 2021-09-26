package student.domain;

import java.io.Serializable;
import java.sql.Date;

public class StudentVO implements Serializable{

	private int snum;
	private String major;
	private String sname;
	private String sphone;
	private String saddr;
	private String semail;
	private String spwd;
	private int sstate;
	private int saccstate;
	private int semester;
	private int grade;
	private String sid;
	private String sgender;
	private Date sindate;
	
	public StudentVO() {
		
	}

	public StudentVO(int snum, String major, String sname, String sphone, String saddr, String semail, String spwd,
			int sstate, int saccstate, int semester, int grade, String sid, String sgender, Date sindate) {
		super();
		this.snum = snum;
		this.major = major;
		this.sname = sname;
		this.sphone = sphone;
		this.saddr = saddr;
		this.semail = semail;
		this.spwd = spwd;
		this.sstate = sstate;
		this.saccstate = saccstate;
		this.semester = semester;
		this.grade = grade;
		this.sid = sid;
		this.sgender = sgender;
		this.sindate = sindate;
	}

	public String getSphone() {
		return sphone;
	}

	public void setSphone(String sphone) {
		this.sphone = sphone;
	}



	public int getSnum() {
		return snum;
	}

	public void setSnum(int snum) {
		this.snum = snum;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getSaddr() {
		return saddr;
	}

	public void setSaddr(String saddr) {
		this.saddr = saddr;
	}

	public int getSemester() {
		return semester;
	}

	public void setSemester(int semester) {
		this.semester = semester;
	}

	public String getSemail() {
		return semail;
	}

	public void setSemail(String semail) {
		this.semail = semail;
	}

	public String getSpwd() {
		return spwd;
	}

	public void setSpwd(String spwd) {
		this.spwd = spwd;
	}

	public int getSstate() {
		return sstate;
	}

	public void setSstate(int sstate) {
		this.sstate = sstate;
	}

	public int getSaccstate() {
		return saccstate;
	}

	public void setSaccstate(int saccstate) {
		this.saccstate = saccstate;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getSgender() {
		return sgender;
	}

	public void setSgender(String sgender) {
		this.sgender = sgender;
	}

	public Date getSindate() {
		return sindate;
	}

	public void setSindate(Date sindate) {
		this.sindate = sindate;
	}

	@Override
	public String toString() {
		return "StudentVO [snum=" + snum + ", major=" + major + ", sname=" + sname + ", sphone=" + sphone + ", addr="
				+ saddr + ", semail=" + semail + ", spwd=" + spwd + ", sstate=" + sstate + ", saccstate=" + saccstate
				+ ", grade=" + grade + ", sid=" + sid + ", sgender=" + sgender + ", sindate=" + sindate + "]";
	}

}
