package com.edu.courseReview.vo;

import java.util.Date;

public class CourseReviewFileVo {

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
		
	//CourseReviewFile
	private int fileIdx;
	private int fileReviewIdx;
	private String fileOriginalName;
	private String fileStoredName;
	private int fileSize;
	private Date fileCreDate;
	private Date fileModDate;
	
	
	
	public CourseReviewFileVo() {
		super();
	}


	public CourseReviewFileVo(int reviewIdx, int reviewMemberIdx, int reviewCourseIdx, String reviewTitle,
			String reviewContent, int reviewReadCount, int reviewLikeCount, int reviewRating, String reviewDelYn,
			Date reviewCreDate, Date reviewModDate, int fileIdx, int fileReviewIdx, String fileOriginalName,
			String fileStoredName, int fileSize, Date fileCreDate, Date fileModDate) {
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
		this.fileIdx = fileIdx;
		this.fileReviewIdx = fileReviewIdx;
		this.fileOriginalName = fileOriginalName;
		this.fileStoredName = fileStoredName;
		this.fileSize = fileSize;
		this.fileCreDate = fileCreDate;
		this.fileModDate = fileModDate;
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
		return "CourseReviewFileVo [reviewIdx=" + reviewIdx + ", reviewMemberIdx=" + reviewMemberIdx
				+ ", reviewCourseIdx=" + reviewCourseIdx + ", reviewTitle=" + reviewTitle + ", reviewContent="
				+ reviewContent + ", reviewReadCount=" + reviewReadCount + ", reviewLikeCount=" + reviewLikeCount
				+ ", reviewRating=" + reviewRating + ", reviewDelYn=" + reviewDelYn + ", reviewCreDate=" + reviewCreDate
				+ ", reviewModDate=" + reviewModDate + ", fileIdx=" + fileIdx + ", fileReviewIdx=" + fileReviewIdx
				+ ", fileOriginalName=" + fileOriginalName + ", fileStoredName=" + fileStoredName + ", fileSize="
				+ fileSize + ", fileCreDate=" + fileCreDate + ", fileModDate=" + fileModDate + "]";
	}
}
