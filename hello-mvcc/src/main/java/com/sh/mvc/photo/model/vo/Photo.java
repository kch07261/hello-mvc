package com.sh.mvc.photo.model.vo;

import java.sql.Date;

public class Photo {
	private int no;
	private String writer;
	private String content;
	private String originalFilename;
	private String renamedFilename;
	private String readCount;
	private Date regDate;
	
	public Photo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Photo(int no, String writer, String content, String originalFilename, String renamedFilename,
			String readCount, Date regDate) {
		super();
		this.no = no;
		this.writer = writer;
		this.content = content;
		this.originalFilename = originalFilename;
		this.renamedFilename = renamedFilename;
		this.readCount = readCount;
		this.regDate = regDate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getOriginalFilename() {
		return originalFilename;
	}

	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}

	public String getRenamedFilename() {
		return renamedFilename;
	}

	public void setRenamedFilename(String renamedFilename) {
		this.renamedFilename = renamedFilename;
	}

	public String getReadCount() {
		return readCount;
	}

	public void setReadCount(String readCount) {
		this.readCount = readCount;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "Photo [no=" + no + ", writer=" + writer + ", content=" + content + ", originalFilename="
				+ originalFilename + ", renamedFilename=" + renamedFilename + ", readCount=" + readCount + ", regDate="
				+ regDate + "]";
	}
	
	
	
}
