package com.edu.noticeBoard.vo;

import java.util.Date;

public class NoticeVo {

	private int noticeIdx;
	private int noticeMemberIdx;
	private String noticeTitle;
	private String noticeContent;
	private String noticeFixed;
	private Date noticeCreDate;
	private Date noticeModDate;
	
	
	public NoticeVo() {
		super();
	}


	public NoticeVo(int noticeIdx, int noticeMemberIdx, String noticeTitle, String noticeContent, String noticeFixed,
			Date noticeCreDate, Date noticeModDate) {
		super();
		this.noticeIdx = noticeIdx;
		this.noticeMemberIdx = noticeMemberIdx;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeFixed = noticeFixed;
		this.noticeCreDate = noticeCreDate;
		this.noticeModDate = noticeModDate;
	}


	public int getNoticeIdx() {
		return noticeIdx;
	}


	public void setNoticeIdx(int noticeIdx) {
		this.noticeIdx = noticeIdx;
	}


	public int getNoticeMemberIdx() {
		return noticeMemberIdx;
	}


	public void setNoticeMemberIdx(int noticeMemberIdx) {
		this.noticeMemberIdx = noticeMemberIdx;
	}


	public String getNoticeTitle() {
		return noticeTitle;
	}


	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}


	public String getNoticeContent() {
		return noticeContent;
	}


	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}


	public String getNoticeFixed() {
		return noticeFixed;
	}


	public void setNoticeFixed(String noticeFixed) {
		this.noticeFixed = noticeFixed;
	}


	public Date getNoticeCreDate() {
		return noticeCreDate;
	}


	public void setNoticeCreDate(Date noticeCreDate) {
		this.noticeCreDate = noticeCreDate;
	}


	public Date getNoticeModDate() {
		return noticeModDate;
	}


	public void setNoticeModDate(Date noticeModDate) {
		this.noticeModDate = noticeModDate;
	}


	@Override
	public String toString() {
		return "NoticeVo [noticeIdx=" + noticeIdx + ", noticeMemberIdx=" + noticeMemberIdx + ", noticeTitle="
				+ noticeTitle + ", noticeContent=" + noticeContent + ", noticeFixed=" + noticeFixed + ", noticeCreDate="
				+ noticeCreDate + ", noticeModDate=" + noticeModDate + "]";
	}
	
	
	
}
