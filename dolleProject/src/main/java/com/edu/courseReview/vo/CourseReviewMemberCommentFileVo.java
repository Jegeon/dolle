package com.edu.courseReview.vo;

import java.util.Date;

public class CourseReviewMemberCommentFileVo {

	//CourseReview
	private int reviewIdx;
	private int reviewMemberIdx;
	private int reviewCourseIdx;
	private String reviewTitle;
	private String reviewContent;
	private int reviewReadCount;
	private int reviewLikeCount;
	private int reviewRating;
	private String reviewDelYn;
	private Date reviewCreDate;
	private Date reviewModDate;
	
	//Member
	private int memberIdx;
	private String memberEmail;
	private String memberNickname;
	
	//Comment
	private int commentIdx;
	private int commentReviewIdx;
	private int commentMemberIdx;
	private int commentContent;
	private int commentCount;
	private int commentDelYn;
	
	//CourseReviewFile
	private int fileIdx;
	private int fileReviewIdx;
	private String fileOriginalName;
	private String fileStoredName;
	
	
	public CourseReviewMemberCommentFileVo() {
		super();
	}
	
	
	
	public CourseReviewMemberCommentFileVo(int reviewIdx, int reviewMemberIdx, int reviewCourseIdx, String reviewTitle,
			String reviewContent, int reviewReadCount, int reviewLikeCount, int reviewRating, String reviewDelYn,
			Date reviewCreDate, Date reviewModDate, int memberIdx, String memberEmail, String memberNickname,
			int commentIdx, int commentReviewIdx, int commentMemberIdx, int commentContent, int commentCount,
			int commentDelYn, int fileIdx, int fileReviewIdx, String fileOriginalName, String fileStoredName) {
		super();
		this.reviewIdx = reviewIdx;
		this.reviewMemberIdx = reviewMemberIdx;
		this.reviewCourseIdx = reviewCourseIdx;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.reviewReadCount = reviewReadCount;
		this.reviewLikeCount = reviewLikeCount;
		this.reviewRating = reviewRating;
		this.reviewDelYn = reviewDelYn;
		this.reviewCreDate = reviewCreDate;
		this.reviewModDate = reviewModDate;
		this.memberIdx = memberIdx;
		this.memberEmail = memberEmail;
		this.memberNickname = memberNickname;
		this.commentIdx = commentIdx;
		this.commentReviewIdx = commentReviewIdx;
		this.commentMemberIdx = commentMemberIdx;
		this.commentContent = commentContent;
		this.commentCount = commentCount;
		this.commentDelYn = commentDelYn;
		this.fileIdx = fileIdx;
		this.fileReviewIdx = fileReviewIdx;
		this.fileOriginalName = fileOriginalName;
		this.fileStoredName = fileStoredName;
	}



	public int getReviewIdx() {
		return reviewIdx;
	}
	public void setReviewIdx(int reviewIdx) {
		this.reviewIdx = reviewIdx;
	}
	public int getReviewMemberIdx() {
		return reviewMemberIdx;
	}
	public void setReviewMemberIdx(int reviewMemberIdx) {
		this.reviewMemberIdx = reviewMemberIdx;
	}
	public int getReviewCourseIdx() {
		return reviewCourseIdx;
	}
	public void setReviewCourseIdx(int reviewCourseIdx) {
		this.reviewCourseIdx = reviewCourseIdx;
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
	public String getReviewDelYn() {
		return reviewDelYn;
	}
	public void setReviewDelYn(String reviewDelYn) {
		this.reviewDelYn = reviewDelYn;
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
	public int getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(int memberIdx) {
		this.memberIdx = memberIdx;
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
	public int getCommentIdx() {
		return commentIdx;
	}
	public void setCommentIdx(int commentIdx) {
		this.commentIdx = commentIdx;
	}
	public int getCommentReviewIdx() {
		return commentReviewIdx;
	}
	public void setCommentReviewIdx(int commentReviewIdx) {
		this.commentReviewIdx = commentReviewIdx;
	}
	public int getCommentMemberIdx() {
		return commentMemberIdx;
	}
	public void setCommentMemberIdx(int commentMemberIdx) {
		this.commentMemberIdx = commentMemberIdx;
	}
	public int getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(int commentContent) {
		this.commentContent = commentContent;
	}
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	public int getCommentDelYn() {
		return commentDelYn;
	}
	public void setCommentDelYn(int commentDelYn) {
		this.commentDelYn = commentDelYn;
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

	@Override
	public String toString() {
		return "CourseReviewMemberCommentFileVo [reviewIdx=" + reviewIdx + ", reviewMemberIdx=" + reviewMemberIdx
				+ ", reviewCourseIdx=" + reviewCourseIdx + ", reviewTitle=" + reviewTitle + ", reviewContent="
				+ reviewContent + ", reviewReadCount=" + reviewReadCount + ", reviewLikeCount=" + reviewLikeCount
				+ ", reviewRating=" + reviewRating + ", reviewDelYn=" + reviewDelYn + ", reviewCreDate=" + reviewCreDate
				+ ", reviewModDate=" + reviewModDate + ", memberIdx=" + memberIdx + ", memberEmail=" + memberEmail
				+ ", memberNickname=" + memberNickname + ", commentIdx=" + commentIdx + ", commentReviewIdx="
				+ commentReviewIdx + ", commentMemberIdx=" + commentMemberIdx + ", commentContent=" + commentContent
				+ ", commentCount=" + commentCount + ", commentDelYn=" + commentDelYn + ", fileIdx=" + fileIdx
				+ ", fileReviewIdx=" + fileReviewIdx + ", fileOriginalName=" + fileOriginalName + ", fileStoredName="
				+ fileStoredName + "]";
	}
	
	

}
