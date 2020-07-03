package com.edu.noticeBoard.vo;

import java.util.Date;

public class NoticeFileVo {
	
	private int noticeFileIdx;
	private int noticeIdx;
	private String noticeOriginalFileName;
	private String noticeStoredFileName;
	private int noticeFileSize;
	private Date noticeFileCreDate;
	private Date noticeFileModDate;
	
	public NoticeFileVo() {
		super();
	}

	public NoticeFileVo(int noticeFileIdx, int noticeIdx, String noticeOriginalFileName, String noticeStoredFileName,
			int noticeFileSize, Date noticeFileCreDate, Date noticeFileModDate) {
		super();
		this.noticeFileIdx = noticeFileIdx;
		this.noticeIdx = noticeIdx;
		this.noticeOriginalFileName = noticeOriginalFileName;
		this.noticeStoredFileName = noticeStoredFileName;
		this.noticeFileSize = noticeFileSize;
		this.noticeFileCreDate = noticeFileCreDate;
		this.noticeFileModDate = noticeFileModDate;
	}

	public int getNoticeFileIdx() {
		return noticeFileIdx;
	}

	public void setNoticeFileIdx(int noticeFileIdx) {
		this.noticeFileIdx = noticeFileIdx;
	}

	public int getNoticeIdx() {
		return noticeIdx;
	}

	public void setNoticeIdx(int noticeIdx) {
		this.noticeIdx = noticeIdx;
	}

	public String getNoticeOriginalFileName() {
		return noticeOriginalFileName;
	}

	public void setNoticeOriginalFileName(String noticeOriginalFileName) {
		this.noticeOriginalFileName = noticeOriginalFileName;
	}

	public String getNoticeStoredFileName() {
		return noticeStoredFileName;
	}

	public void setNoticeStoredFileName(String noticeStoredFileName) {
		this.noticeStoredFileName = noticeStoredFileName;
	}

	public int getNoticeFileSize() {
		return noticeFileSize;
	}

	public void setNoticeFileSize(int noticeFileSize) {
		this.noticeFileSize = noticeFileSize;
	}

	public Date getNoticeFileCreDate() {
		return noticeFileCreDate;
	}

	public void setNoticeFileCreDate(Date noticeFileCreDate) {
		this.noticeFileCreDate = noticeFileCreDate;
	}

	public Date getNoticeFileModDate() {
		return noticeFileModDate;
	}

	public void setNoticeFileModDate(Date noticeFileModDate) {
		this.noticeFileModDate = noticeFileModDate;
	}

	@Override
	public String toString() {
		return "NoticeFileVo [noticeFileIdx=" + noticeFileIdx + ", noticeIdx=" + noticeIdx + ", noticeOriginalFileName="
				+ noticeOriginalFileName + ", noticeStoredFileName=" + noticeStoredFileName + ", noticeFileSize="
				+ noticeFileSize + ", noticeFileCreDate=" + noticeFileCreDate + ", noticeFileModDate="
				+ noticeFileModDate + "]";
	}
	
	
}
