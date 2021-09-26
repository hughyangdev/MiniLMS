package prof.domain;

import java.io.Serializable;

public class ClassListVO implements Serializable {

	private int lNum;
	private int subjectCode;
	private int pNum;
	private String lName;
	private int credit;
	private int classNum;
	private String cday;
	private String ctime;

	private String majorName;
	private String pname;
	private int grade;
	private int semester;
	
	private int rn;

	public ClassListVO() {
		// System.out.println("ClassListVO() ����...");
	}

	public ClassListVO(int lNum, int subjectCode, int pNum, String lName, int credit, int classnum, String cday,
			String ctime) {
		super();
		this.lNum = lNum;
		this.subjectCode = subjectCode;
		this.pNum = pNum;
		this.lName = lName;
		this.credit = credit;
		this.classNum = classnum;
		this.cday = cday;
		this.ctime = ctime;
	}
	
	

	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public void setClassNum(int classNum) {
		this.classNum = classNum;
	}

	public int getClassNum() {
		return classNum;
	}

	public void setClassnum(int classNum) {
		this.classNum = classNum;
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

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getMajorName() {
		return majorName;
	}

	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}

	public int getlNum() {
		return lNum;
	}

	public void setlNum(int lNum) {
		this.lNum = lNum;
	}

	public int getSubjectCode() {
		return subjectCode;
	}

	public void setSubjectCode(int subjectCode) {
		this.subjectCode = subjectCode;
	}

	public int getpNum() {
		return pNum;
	}

	public void setpNum(int pNum) {
		this.pNum = pNum;
	}

	public String getlName() {
		return lName;
	}

	public void setlName(String lName) {
		this.lName = lName;
	}

	public int getCredit() {
		return credit;
	}

	public void setCredit(int credit) {
		this.credit = credit;
	}

	public int getSemester() {
		return semester;
	}

	public void setSemester(int semester) {
		this.semester = semester;
	}

}
