package com.edu.vo;

import java.util.Date;

public class NoticeMemberVo {
	
	private int noticeIdx;
	private int noticeMemberIdx;
	private String noticeTitle;
	private String noticeContent;
	private String noticeFixed;
	private String noticeDelYn;
	private Date noticeCreDate;
	private Date noticeModDate;
	
	private int memberIdx;
	private String memberName;
	private String memberEmail;
	private String memberNickname;
	private String memberPassword;
	private String memberPhone;
	private Date memberBirthdate;
	private String memberNational;
	private Date memberCreDate;
	private Date memberModDate;
	private String memberGrade;
	private String memberDelYn;
	private String memberTempPwd;
	
	
	public NoticeMemberVo() {
		super();
	}


	public NoticeMemberVo(int noticeIdx, int noticeMemberIdx, String noticeTitle, String noticeContent,
			String noticeFixed, String noticeDelYn, Date noticeCreDate, Date noticeModDate, int memberIdx,
			String memberName, String memberEmail, String memberNickname, String memberPassword, String memberPhone,
			Date memberBirthDate, String memberNational, Date memberCreDate, Date memberModDate, String memberGrade,
			String memberDelYn, String memberTempPwd) {
		super();
		this.noticeIdx = noticeIdx;
		this.noticeMemberIdx = noticeMemberIdx;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeFixed = noticeFixed;
		this.noticeDelYn = noticeDelYn;
		this.noticeCreDate = noticeCreDate;
		this.noticeModDate = noticeModDate;
		this.memberIdx = memberIdx;
		this.memberName = memberName;
		this.memberEmail = memberEmail;
		this.memberNickname = memberNickname;
		this.memberPassword = memberPassword;
		this.memberPhone = memberPhone;
		this.memberBirthdate = memberBirthDate;
		this.memberNational = memberNational;
		this.memberCreDate = memberCreDate;
		this.memberModDate = memberModDate;
		this.memberGrade = memberGrade;
		this.memberDelYn = memberDelYn;
		this.memberTempPwd = memberTempPwd;
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


	public int getMemberIdx() {
		return memberIdx;
	}


	public void setMemberIdx(int memberIdx) {
		this.memberIdx = memberIdx;
	}


	public String getMemberName() {
		return memberName;
	}


	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}


	public String getMemberEmail() {
		return memberEmail;
	}


	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}


	public String getMemberNickname() {
		return memberNickname;
	}


	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}


	public String getMemberPassword() {
		return memberPassword;
	}


	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}


	public String getMemberPhone() {
		return memberPhone;
	}


	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}


	public Date getMemberBirthDate() {
		return memberBirthdate;
	}


	public void setMemberBirthDate(Date memberBirthDate) {
		this.memberBirthdate = memberBirthDate;
	}


	public String getMemberNational() {
		return memberNational;
	}


	public void setMemberNational(String memberNational) {
		this.memberNational = memberNational;
	}


	public Date getMemberCreDate() {
		return memberCreDate;
	}


	public void setMemberCreDate(Date memberCreDate) {
		this.memberCreDate = memberCreDate;
	}


	public Date getMemberModDate() {
		return memberModDate;
	}


	public void setMemberModDate(Date memberModDate) {
		this.memberModDate = memberModDate;
	}


	public String getMemberGrade() {
		return memberGrade;
	}


	public void setMemberGrade(String memberGrade) {
		this.memberGrade = memberGrade;
	}


	public String getMemberDelYn() {
		return memberDelYn;
	}


	public void setMemberDelYn(String memberDelYn) {
		this.memberDelYn = memberDelYn;
	}


	public String getMemberTempPwd() {
		return memberTempPwd;
	}


	public void setMemberTempPwd(String memberTempPwd) {
		this.memberTempPwd = memberTempPwd;
	}


	@Override
	public String toString() {
		return "NoticeMemberVo [noticeIdx=" + noticeIdx + ", noticeMemberIdx=" + noticeMemberIdx + ", noticeTitle="
				+ noticeTitle + ", noticeContent=" + noticeContent + ", noticeFixed=" + noticeFixed + ", noticeDelYn="
				+ noticeDelYn + ", noticeCreDate=" + noticeCreDate + ", noticeModDate=" + noticeModDate + ", memberIdx="
				+ memberIdx + ", memberName=" + memberName + ", memberEmail=" + memberEmail + ", memberNickname="
				+ memberNickname + ", memberPassword=" + memberPassword + ", memberPhone=" + memberPhone
				+ ", memberBirthDate=" + memberBirthdate + ", memberNational=" + memberNational + ", memberCreDate="
				+ memberCreDate + ", memberModDate=" + memberModDate + ", memberGrade=" + memberGrade + ", memberDelYn="
				+ memberDelYn + ", memberTempPwd=" + memberTempPwd + "]";
	}
	
	
	
}
