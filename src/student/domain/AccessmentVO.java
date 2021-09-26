package student.domain;

import java.io.Serializable;

public class AccessmentVO implements Serializable {

	private int acnum;
	private String question;
	private int acscore;

	public AccessmentVO() {

	}

	public AccessmentVO(int acnum, String question, int acscore) {
		super();
		this.acnum = acnum;
		this.question = question;
		this.acscore = acscore;
	}

	public int getAcnum() {
		return acnum;
	}

	public void setAcnum(int acnum) {
		this.acnum = acnum;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public int getAcscore() {
		return acscore;
	}

	public void setAcscore(int acscore) {
		this.acscore = acscore;
	}

}
