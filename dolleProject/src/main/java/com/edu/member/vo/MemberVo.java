package com.edu.member.vo;

import java.util.Date;

public class MemberVo {

	private int no;
	private String name;
	private String email;
	private String nickname;
	private String password;
	private String phone;
	private Date birthdate;
	private String national;
	private Date createDate;
	private Date modifiedDate;
	private String grade;
	private String del;
	private String tempPassword;
	private int tourIdx;
	private String tourName;
	private Date reserveApplyDate;
	private Date reserveDepositDate;
	private String reserveDepositState;
	private int reserveIdx;
	private int reserveApplyNum;
	private int reservePrice;
	private String tourAccountNum;
	private int reviewIdx;
	private String reviewTitle;
	private String reviewContent;
	private Date reviewCreDate;
	private Date reviewModDate;
	private int reviewReadCount;
	private int reviewLikeCount;
	private int reviewRating;
	private String townName;
	private String accBank;
	private String accDepositor;
	private int commentCount;
	
	public MemberVo(int no, String name, String email, String nickname, String password, String phone, Date birthdate,
			String national, Date createDate, Date modifiedDate, String grade, String del, String tempPassword,
			int tourIdx, String tourName, Date reserveApplyDate, Date reserveDepositDate, String reserveDepositState,
			int reserveIdx, int reserveApplyNum, int reservePrice, String tourAccountNum, int reviewIdx,
			String reviewTitle, String reviewContent, Date reviewCreDate, Date reviewModDate, int reviewReadCount,
			int reviewLikeCount, int reviewRating, String townName, String accBank, String accDepositor, int commentCount) {
		super();
		this.no = no;
		this.name = name;
		this.email = email;
		this.nickname = nickname;
		this.password = password;
		this.phone = phone;
		this.birthdate = birthdate;
		this.national = national;
		this.createDate = createDate;
		this.modifiedDate = modifiedDate;
		this.grade = grade;
		this.del = del;
		this.tempPassword = tempPassword;
		this.tourIdx = tourIdx;
		this.tourName = tourName;
		this.reserveApplyDate = reserveApplyDate;
		this.reserveDepositDate = reserveDepositDate;
		this.reserveDepositState = reserveDepositState;
		this.reserveIdx = reserveIdx;
		this.reserveApplyNum = reserveApplyNum;
		this.reservePrice = reservePrice;
		this.tourAccountNum = tourAccountNum;
		this.reviewIdx = reviewIdx;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.reviewCreDate = reviewCreDate;
		this.reviewModDate = reviewModDate;
		this.reviewReadCount = reviewReadCount;
		this.reviewLikeCount = reviewLikeCount;
		this.reviewRating = reviewRating;
		this.townName = townName;
		this.accBank = accBank;
		this.accDepositor = accDepositor;
		this.commentCount = commentCount;
	}
	
	public MemberVo() {
		super();
	}
	
	public int getNo() {
		return no;
	}
	
	public void setNo(int no) {
		this.no = no;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getNickname() {
		return nickname;
	}
	
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public Date getBirthdate() {
		return birthdate;
	}
	
	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}
	
	public String getNational() {
		return national;
	}
	
	public void setNational(String national) {
		this.national = national;
	}
	
	public Date getCreateDate() {
		return createDate;
	}
	
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	public Date getModifiedDate() {
		return modifiedDate;
	}
	
	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}
	
	public String getGrade() {
		return grade;
	}
	
	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	public String getDel() {
		return del;
	}
	
	public void setDel(String del) {
		this.del = del;
	}
	
	public String getTempPassword() {
		return tempPassword;
	}
	
	public void setTempPassword(String tempPassword) {
		this.tempPassword = tempPassword;
	}
	
	public int getTourIdx() {
		return tourIdx;
	}
	
	public void setTourIdx(int tourIdx) {
		this.tourIdx = tourIdx;
	}
	
	public String getTourName() {
		return tourName;
	}
	
	public void setTourName(String tourName) {
		this.tourName = tourName;
	}
	
	public Date getReserveApplyDate() {
		return reserveApplyDate;
	}
	
	public void setReserveApplyDate(Date reserveApplyDate) {
		this.reserveApplyDate = reserveApplyDate;
	}
	
	public Date getReserveDepositDate() {
		return reserveDepositDate;
	}
	
	public void setReserveDepositDate(Date reserveDepositDate) {
		this.reserveDepositDate = reserveDepositDate;
	}
	
	public String getReserveDepositState() {
		return reserveDepositState;
	}
	
	public void setReserveDepositState(String reserveDepositState) {
		this.reserveDepositState = reserveDepositState;
	}
	
	public int getReserveIdx() {
		return reserveIdx;
	}
	
	public void setReserveIdx(int reserveIdx) {
		this.reserveIdx = reserveIdx;
	}
	
	public int getReserveApplyNum() {
		return reserveApplyNum;
	}
	
	public void setReserveApplyNum(int reserveApplyNum) {
		this.reserveApplyNum = reserveApplyNum;
	}
	
	public int getReservePrice() {
		return reservePrice;
	}
	
	public void setReservePrice(int reservePrice) {
		this.reservePrice = reservePrice;
	}
	
	public String getTourAccountNum() {
		return tourAccountNum;
	}
	
	public void setTourAccountNum(String tourAccountNum) {
		this.tourAccountNum = tourAccountNum;
	}
	
	public int getReviewIdx() {
		return reviewIdx;
	}
	
	public void setReviewIdx(int reviewIdx) {
		this.reviewIdx = reviewIdx;
	}
	
	public String getReviewTitle() {
		return reviewTitle;
	}
	
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	
	public String getReviewContent() {
		return reviewContent;
	}
	
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	
	public Date getReviewCreDate() {
		return reviewCreDate;
	}
	
	public void setReviewCreDate(Date reviewCreDate) {
		this.reviewCreDate = reviewCreDate;
	}
	
	public Date getReviewModDate() {
		return reviewModDate;
	}
	
	public void setReviewModDate(Date reviewModDate) {
		this.reviewModDate = reviewModDate;
	}
	
	public int getReviewReadCount() {
		return reviewReadCount;
	}
	
	public void setReviewReadCount(int reviewReadCount) {
		this.reviewReadCount = reviewReadCount;
	}
	
	public int getReviewLikeCount() {
		return reviewLikeCount;
	}
	
	public void setReviewLikeCount(int reviewLikeCount) {
		this.reviewLikeCount = reviewLikeCount;
	}
	
	public int getReviewRating() {
		return reviewRating;
	}
	
	public void setReviewRating(int reviewRating) {
		this.reviewRating = reviewRating;
	}
	
	public String getTownName() {
		return townName;
	}

	public void setTownName(String townName) {
		this.townName = townName;
	}
	
	public String getAccBank() {
		return accBank;
	}

	public void setAccBank(String accBank) {
		this.accBank = accBank;
	}

	public String getAccDepositor() {
		return accDepositor;
	}

	public void setAccDepositor(String accDepositor) {
		this.accDepositor = accDepositor;
	}
	
	public int getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}

	@Override
	public String toString() {
		return "MemberVo [no=" + no + ", name=" + name + ", email=" + email + ", nickname=" + nickname + ", password="
				+ password + ", phone=" + phone + ", birthdate=" + birthdate + ", national=" + national
				+ ", createDate=" + createDate + ", modifiedDate=" + modifiedDate + ", grade=" + grade + ", del=" + del
				+ ", tempPassword=" + tempPassword + ", tourIdx=" + tourIdx + ", tourName=" + tourName
				+ ", reserveApplyDate=" + reserveApplyDate + ", reserveDepositDate=" + reserveDepositDate
				+ ", reserveDepositState=" + reserveDepositState + ", reserveIdx=" + reserveIdx + ", reserveApplyNum="
				+ reserveApplyNum + ", reservePrice=" + reservePrice + ", tourAccountNum=" + tourAccountNum
				+ ", reviewIdx=" + reviewIdx + ", reviewTitle=" + reviewTitle + ", reviewContent=" + reviewContent
				+ ", reviewCreDate=" + reviewCreDate + ", reviewModDate=" + reviewModDate + ", reviewReadCount="
				+ reviewReadCount + ", reviewLikeCount=" + reviewLikeCount + ", reviewRating=" + reviewRating
				+ ", townName=" + townName + ", accBank=" + accBank + ", accDepositor=" + accDepositor
				+ ", commentCount=" + commentCount + "]";
	}

}
