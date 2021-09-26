package prof.domain;

public class ScoreVO {

	private int scoreNum;
	private int lNum;
	private int sNum;
	private int score;
	
	public ScoreVO() {
		
	}
	
	public ScoreVO(int scoreNum, int lNum, int sNum, int score) {
		super();
		this.scoreNum = scoreNum;
		this.lNum = lNum;
		this.sNum = sNum;
		this.score = score;
	}

	public int getScoreNum() {
		return scoreNum;
	}

	public void setScoreNum(int scoreNum) {
		this.scoreNum = scoreNum;
	}

	public int getlNum() {
		return lNum;
	}

	public void setlNum(int lNum) {
		this.lNum = lNum;
	}

	public int getsNum() {
		return sNum;
	}

	public void setsNum(int sNum) {
		this.sNum = sNum;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}
	
}
