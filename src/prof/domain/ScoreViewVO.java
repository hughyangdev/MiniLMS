package prof.domain;

public class ScoreViewVO {

	private int idx;
	private int sNum;
	private String sName;
	private String uniName;
	private String major;
	private int score;
	
	public ScoreViewVO() {
		
	}

	public ScoreViewVO(int idx, int sNum, String sName, String uniName, String major, int score) {
		super();
		this.idx = idx;
		this.sNum = sNum;
		this.sName = sName;
		this.uniName = uniName;
		this.major = major;
		this.score = score;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getsNum() {
		return sNum;
	}

	public void setsNum(int sNum) {
		this.sNum = sNum;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public String getuniName() {
		return uniName;
	}

	public void setuniName(String uniName) {
		this.uniName = uniName;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}
	
}
