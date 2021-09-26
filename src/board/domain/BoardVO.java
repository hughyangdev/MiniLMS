package board.domain;

import java.io.Serializable;
import java.sql.Date;

public class BoardVO implements Serializable {

	private int bNum;
	private String bTitle;
	private String bWriter;
	private String bContents;
	private String bPwd;
	private Date bDate;
	
	private String bFile;
	private String originFilename;
	private long filesize;

	public BoardVO() {
	}

	public BoardVO(int bNum, String bTitle, String bWriter, String bContents, String bPwd, Date bDate, String bFile) {
		super();
		this.bNum = bNum;
		this.bTitle = bTitle;
		this.bWriter = bWriter;
		this.bContents = bContents;
		this.bPwd = bPwd;
		this.bDate = bDate;
		this.bFile = bFile;
	}

	public BoardVO(int bNum, String bTitle, String bWriter, String bContents, String bPwd, Date bDate, String bFile,
			String originFilename, long filesize) {
		super();
		this.bNum = bNum;
		this.bTitle = bTitle;
		this.bWriter = bWriter;
		this.bContents = bContents;
		this.bPwd = bPwd;
		this.bDate = bDate;
		this.bFile = bFile;
		this.originFilename = originFilename;
		this.filesize = filesize;
	}

	public String getOriginFilename() {
		return originFilename;
	}

	public void setOriginFilename(String originFilename) {
		this.originFilename = originFilename;
	}

	public long getFilesize() {
		return filesize;
	}

	public void setFilesize(long filesize) {
		this.filesize = filesize;
	}

	public Date getbDate() {
		return bDate;
	}

	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbWriter() {
		return bWriter;
	}

	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}

	public String getbContents() {
		return bContents;
	}

	public void setbContents(String bContents) {
		this.bContents = bContents;
	}

	public String getbPwd() {
		return bPwd;
	}

	public void setbPwd(String bPwd) {
		this.bPwd = bPwd;
	}

	public String getbFile() {
		return bFile;
	}

	public void setbFile(String bFile) {
		this.bFile = bFile;
	}

	public int getbNum() {
		return bNum;
	}

	public void setbNum(int bNum) {
		this.bNum = bNum;
	}

	@Override
	public String toString() {
		return "BoardVO [bNum=" + bNum + ", bTitle=" + bTitle + ", bWriter=" + bWriter + ", bContents=" + bContents
				+ ", bFile=" + bFile + ", bPwd=" + bPwd + ", bDate=" + bDate + "]";
	}

}
