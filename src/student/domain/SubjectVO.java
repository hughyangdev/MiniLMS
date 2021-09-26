package student.domain;

public class SubjectVO {

	private String subjectCode;
	private String subjectName;
	private int majorCode;
	private int semester;
	private int grade;

	public SubjectVO() {

	}

	public SubjectVO(String subjectCode, String subjectName, int majorCode, int semester, int grade) {
		super();
		this.subjectCode = subjectCode;
		this.subjectName = subjectName;
		this.majorCode = majorCode;
		this.semester = semester;
		this.grade = grade;
	}

	public String getSubjectCode() {
		return subjectCode;
	}

	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public int getMajorCode() {
		return majorCode;
	}

	public void setMajorCode(int majorCode) {
		this.majorCode = majorCode;
	}

	public int getSemester() {
		return semester;
	}

	public void setSemester(int semester) {
		this.semester = semester;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

}
