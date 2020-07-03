package com.edu.noticeBoard.vo;

import java.util.Date;

public class NoticeVo {

	private int noticeIdx;
	private int noticeMemberIdx;
	private String noticeTitle;
	private String noticeContent;
	private String noticeFixed;
	private String noticeDelYn;
	private Date noticeCreDate;
	private Date noticeModDate;
	
	
	public NoticeVo() {
		super();
	}


	public NoticeVo(int noticeIdx, int memberIdx, String noticeTitle, String noticeContent, String noticeFixed,
			String noticeDelYn, Date noticeCreDate, Date noticeModDate) {
		super();
		this.noticeIdx = noticeIdx;
		this.noticeMemberIdx = memberIdx;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeFixed = noticeFixed;
		this.noticeDelYn = noticeDelYn;
		this.noticeCreDate = noticeCreDate;
		this.noticeModDate = noticeModDate;
	}


	public int getNoticeIdx() {
		return noticeIdx;
	}


	public void setNoticeIdx(int noticeIdx) {
		this.noticeIdx = noticeIdx;
	}


	public int getMemberIdx() {
		return noticeMemberIdx;
	}


	public void setMemberIdx(int memberIdx) {
		this.noticeMemberIdx = memberIdx;
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


	public String getNoticeDelYn() {
		return noticeDelYn;
	}


	public void setNoticeDelYn(String noticeDelYn) {
		this.noticeDelYn = noticeDelYn;
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
		return "NoticeVo [noticeIdx=" + noticeIdx + ", memberIdx=" + noticeMemberIdx + ", noticeTitle=" + noticeTitle
				+ ", noticeContent=" + noticeContent + ", noticeFixed=" + noticeFixed + ", noticeDelYn=" + noticeDelYn
				+ ", noticeCreDate=" + noticeCreDate + ", noticeModDate=" + noticeModDate + "]";
	}
	
	
	
	
	
}
