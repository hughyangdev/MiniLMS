package student.domain;

import java.io.Serializable;

public class ClassListVO implements Serializable {

	private int lnum;
	private int subjectCode;
	private int pnum;
	private String lname;
	private int credit;
	private String cday;
	private String ctime;
	private int classnum;

	// join추가문
	private String pname;

	public ClassListVO() {

	}

	public ClassListVO(int lnum, int subjectCode, int pnum, String lname, int credit, String cday, String ctime,
			int classnum, String pname) {
		super();
		this.lnum = lnum;
		this.subjectCode = subjectCode;
		this.pnum = pnum;
		this.lname = lname;
		this.credit = credit;
		this.cday = cday;
		this.ctime = ctime;
		this.classnum = classnum;
		this.pname = pname;
	}

	public int getLnum() {
		return lnum;
	}

	public void setLnum(int lnum) {
		this.lnum = lnum;
	}

	public int getSubjectCode() {
		return subjectCode;
	}

	public void setSubjectCode(int subjectCode) {
		this.subjectCode = subjectCode;
	}

	public int getPnum() {
		return pnum;
	}

	public void setPnum(int pnum) {
		this.pnum = pnum;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public int getCredit() {
		return credit;
	}

	public void setCredit(int credit) {
		this.credit = credit;
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

	public int getClassnum() {
		return classnum;
	}

	public void setClassnum(int classnum) {
		this.classnum = classnum;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

}
