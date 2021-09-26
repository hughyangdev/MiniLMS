package student.domain;

import java.io.Serializable;

public class RegistClassVO implements Serializable {

	private int snum;
	private int lnum;
	private int rstate;

	// select 문에서 가져오는 것 - 학생
	private int subjectCode;
	private String lname;
	private String pname;
	private int classnum;
	private int credit;
	
	// select 문에서 가져오는 것 - 교수
	private String sname;
	private int grade;
	private int semester;
	private int rn;
	private String major;
	private String sgender;
	
	//select문에서 가져오는 것 - 시간표
	private String cday;
	private String ctime;
	
	public RegistClassVO(int snum, int lnum, int rstate) {
		super();
		this.snum = snum;
		this.lnum = lnum;
		this.rstate = rstate;
	}
	
	public String getCday() {
		return cday;
	}

	public void setCday(String cday) {
		this.cday = cday;
	}

	public String getCtime() {
		return ctime;
	}

	public void setCtime(String ctime) {
		this.ctime = ctime;
	}

	public String getSgender() {
		return sgender;
	}

	public void setSgender(String sgender) {
		this.sgender = sgender;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getSemester() {
		return semester;
	}

	public void setSemester(int semester) {
		this.semester = semester;
	}

	public RegistClassVO() {
	}

	public int getSnum() {
		return snum;
	}

	public void setSnum(int snum) {
		this.snum = snum;
	}

	public int getLnum() {
		return lnum;
	}

	public void setLnum(int lnum) {
		this.lnum = lnum;
	}

	public int getRstate() {
		return rstate;
	}

	public void setRstate(int rstate) {
		this.rstate = rstate;
	}

	/////////////////////////////////////////

	public int getSubjectCode() {
		return subjectCode;
	}

	public void setSubjectCode(int subjectCode) {
		this.subjectCode = subjectCode;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getClassnum() {
		return classnum;
	}

	public void setClassnum(int classnum) {
		this.classnum = classnum;
	}

	public int getCredit() {
		return credit;
	}

	public void setCredit(int credit) {
		this.credit = credit;
	}

}
