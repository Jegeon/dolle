package com.edu.noticeBoard.vo;

import java.util.Date;

public class NoticeMemberFileVo {
	
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
	
	private int fileIdx;
	private int fileNoticeIdx;
	private String fileNoticeOriginalName;
	private String fileNoticeStoredName;
	private int fileNoticeSize;
	private Date fileNoticeCreDate;
	private Date fileNoticeModDate;
	private int fileExist;
	
	
	public NoticeMemberFileVo() {
		super();
	}


	public NoticeMemberFileVo(int noticeIdx, int noticeMemberIdx, String noticeTitle, String noticeContent,
			String noticeFixed, String noticeDelYn, Date noticeCreDate, Date noticeModDate, int memberIdx,
			String memberName, String memberEmail, String memberNickname, String memberPassword, String memberPhone,
			Date memberBirthdate, String memberNational, Date memberCreDate, Date memberModDate, String memberGrade,
			String memberDelYn, String memberTempPwd, int fileIdx, int fileNoticeIdx, String fileNoticeOriginalName,
			String fileNoticeStoredName, int fileNoticeSize, Date fileNoticeCreDate, Date fileNoticeModDate,
			int fileExist) {
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
		this.memberBirthdate = memberBirthdate;
		this.memberNational = memberNational;
		this.memberCreDate = memberCreDate;
		this.memberModDate = memberModDate;
		this.memberGrade = memberGrade;
		this.memberDelYn = memberDelYn;
		this.memberTempPwd = memberTempPwd;
		this.fileIdx = fileIdx;
		this.fileNoticeIdx = fileNoticeIdx;
		this.fileNoticeOriginalName = fileNoticeOriginalName;
		this.fileNoticeStoredName = fileNoticeStoredName;
		this.fileNoticeSize = fileNoticeSize;
		this.fileNoticeCreDate = fileNoticeCreDate;
		this.fileNoticeModDate = fileNoticeModDate;
		this.fileExist = fileExist;
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


	public Date getMemberBirthdate() {
		return memberBirthdate;
	}


	public void setMemberBirthdate(Date memberBirthdate) {
		this.memberBirthdate = memberBirthdate;
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


	public int getFileIdx() {
		return fileIdx;
	}


	public void setFileIdx(int fileIdx) {
		this.fileIdx = fileIdx;
	}


	public int getFileNoticeIdx() {
		return fileNoticeIdx;
	}


	public void setFileNoticeIdx(int fileNoticeIdx) {
		this.fileNoticeIdx = fileNoticeIdx;
	}


	public String getFileNoticeOriginalName() {
		return fileNoticeOriginalName;
	}


	public void setFileNoticeOriginalName(String fileNoticeOriginalName) {
		this.fileNoticeOriginalName = fileNoticeOriginalName;
	}


	public String getFileNoticeStoredName() {
		return fileNoticeStoredName;
	}


	public void setFileNoticeStoredName(String fileNoticeStoredName) {
		this.fileNoticeStoredName = fileNoticeStoredName;
	}


	public int getFileNoticeSize() {
		return fileNoticeSize;
	}


	public void setFileNoticeSize(int fileNoticeSize) {
		this.fileNoticeSize = fileNoticeSize;
	}


	public Date getFileNoticeCreDate() {
		return fileNoticeCreDate;
	}


	public void setFileNoticeCreDate(Date fileNoticeCreDate) {
		this.fileNoticeCreDate = fileNoticeCreDate;
	}


	public Date getFileNoticeModDate() {
		return fileNoticeModDate;
	}


	public void setFileNoticeModDate(Date fileNoticeModDate) {
		this.fileNoticeModDate = fileNoticeModDate;
	}


	public int getFileExist() {
		return fileExist;
	}


	public void setFileExist(int fileExist) {
		this.fileExist = fileExist;
	}


	@Override
	public String toString() {
		return "NoticeMemberFileVo [noticeIdx=" + noticeIdx + ", noticeMemberIdx=" + noticeMemberIdx + ", noticeTitle="
				+ noticeTitle + ", noticeContent=" + noticeContent + ", noticeFixed=" + noticeFixed + ", noticeDelYn="
				+ noticeDelYn + ", noticeCreDate=" + noticeCreDate + ", noticeModDate=" + noticeModDate + ", memberIdx="
				+ memberIdx + ", memberName=" + memberName + ", memberEmail=" + memberEmail + ", memberNickname="
				+ memberNickname + ", memberPassword=" + memberPassword + ", memberPhone=" + memberPhone
				+ ", memberBirthdate=" + memberBirthdate + ", memberNational=" + memberNational + ", memberCreDate="
				+ memberCreDate + ", memberModDate=" + memberModDate + ", memberGrade=" + memberGrade + ", memberDelYn="
				+ memberDelYn + ", memberTempPwd=" + memberTempPwd + ", fileIdx=" + fileIdx + ", fileNoticeIdx="
				+ fileNoticeIdx + ", fileNoticeOriginalName=" + fileNoticeOriginalName + ", fileNoticeStoredName="
				+ fileNoticeStoredName + ", fileNoticeSize=" + fileNoticeSize + ", fileNoticeCreDate="
				+ fileNoticeCreDate + ", fileNoticeModDate=" + fileNoticeModDate + ", fileExist=" + fileExist + "]";
	}
	
	
	
}
