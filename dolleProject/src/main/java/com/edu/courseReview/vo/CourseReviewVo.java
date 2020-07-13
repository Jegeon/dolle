package com.edu.courseReview.vo;

import java.util.Date;

public class CourseReviewVo {
	
	//CourseReview
	private int reviewIdx;
	private int reviewMemberIdx;
	private int reviewCourseIdx;
	private String reviewTitle;
	private String reviewContent;
	private int reviewReadCount;
	private int reviewLikeCount;
	private int reviewRating;
	private Date reviewCreDate;
	private Date reviewModDate;
	
	public CourseReviewVo() {
		
	}

	public CourseReviewVo(int reviewIdx, int reviewMemberIdx, int reviewCourseIdx, String reviewTitle,
			String reviewContent, int reviewReadCount, int reviewLikeCount, int reviewRating, Date reviewCreDate,
			Date reviewModDate) {
		super();
		this.reviewIdx = reviewIdx;
		this.reviewMemberIdx = reviewMemberIdx;
		this.reviewCourseIdx = reviewCourseIdx;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.reviewReadCount = reviewReadCount;
		this.reviewLikeCount = reviewLikeCount;
		this.reviewRating = reviewRating;
		this.reviewCreDate = reviewCreDate;
		this.reviewModDate = reviewModDate;
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

	@Override
	public String toString() {
		return "CourseReviewVo [reviewIdx=" + reviewIdx + ", reviewMemberIdx=" + reviewMemberIdx + ", reviewCourseIdx="
				+ reviewCourseIdx + ", reviewTitle=" + reviewTitle + ", reviewContent=" + reviewContent
				+ ", reviewReadCount=" + reviewReadCount + ", reviewLikeCount=" + reviewLikeCount + ", reviewRating="
				+ reviewRating + ", reviewCreDate=" + reviewCreDate + ", reviewModDate=" + reviewModDate + "]";
	}

	

}
