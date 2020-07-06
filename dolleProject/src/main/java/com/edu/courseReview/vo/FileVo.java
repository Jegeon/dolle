package com.edu.courseReview.vo;

import java.util.Date;

public class FileVo {

	//CourseReviewFile
	private int fileIdx;
	private int fileReviewIdx;
	private String fileOriginalName;
	private String fileStoredName;
	private int fileSize;
	private Date fileCreDate;
	private Date fileModDate;
	
	
	public FileVo() {
		super();
	}

	public FileVo(int fileIdx, int fileReviewIdx, String fileOriginalName, String fileStoredName, int fileSize,
			Date fileCreDate, Date fileModDate) {
		super();
		this.fileIdx = fileIdx;
		this.fileReviewIdx = fileReviewIdx;
		this.fileOriginalName = fileOriginalName;
		this.fileStoredName = fileStoredName;
		this.fileSize = fileSize;
		this.fileCreDate = fileCreDate;
		this.fileModDate = fileModDate;
	}

	public int getFileIdx() {
		return fileIdx;
	}

	public void setFileIdx(int fileIdx) {
		this.fileIdx = fileIdx;
	}

	public int getFileReviewIdx() {
		return fileReviewIdx;
	}

	public void setFileReviewIdx(int fileReviewIdx) {
		this.fileReviewIdx = fileReviewIdx;
	}

	public String getFileOriginalName() {
		return fileOriginalName;
	}

	public void setFileOriginalName(String fileOriginalName) {
		this.fileOriginalName = fileOriginalName;
	}

	public String getFileStoredName() {
		return fileStoredName;
	}

	public void setFileStoredName(String fileStoredName) {
		this.fileStoredName = fileStoredName;
	}

	public int getFileSize() {
		return fileSize;
	}

	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}

	public Date getFileCreDate() {
		return fileCreDate;
	}

	public void setFileCreDate(Date fileCreDate) {
		this.fileCreDate = fileCreDate;
	}

	public Date getFileModDate() {
		return fileModDate;
	}

	public void setFileModDate(Date fileModDate) {
		this.fileModDate = fileModDate;
	}

	@Override
	public String toString() {
		return "FileVo [fileIdx=" + fileIdx + ", fileReviewIdx=" + fileReviewIdx + ", fileOriginalName="
				+ fileOriginalName + ", fileStoredName=" + fileStoredName + ", fileSize=" + fileSize + ", fileCreDate="
				+ fileCreDate + ", fileModDate=" + fileModDate + "]";
	}	
	
	
	
}
