package com.edu.courseReview.vo;

import java.util.Date;

public class CourseReviewVo {
	
	private int review_idx;
	private int member_idx;
	private int course_idx;
	private String review_title;
	private String review_content;
	private int review_read_count;
	private int review_like_count;
	private int review_rating;
	private String review_del_yn;
	private Date review_cre_date;
	private Date review_mod_date;
	
	public CourseReviewVo() {
		
	}
	
	public CourseReviewVo(int review_idx, int member_idx, int course_idx, String review_title, String review_content,
			int review_read_count, int review_like_count, int review_rating, String review_del_yn, Date review_cre_date,
			Date review_mod_date) {
		super();
		this.review_idx = review_idx;
		this.member_idx = member_idx;
		this.course_idx = course_idx;
		this.review_title = review_title;
		this.review_content = review_content;
		this.review_read_count = review_read_count;
		this.review_like_count = review_like_count;
		this.review_rating = review_rating;
		this.review_del_yn = review_del_yn;
		this.review_cre_date = review_cre_date;
		this.review_mod_date = review_mod_date;
	}

	public int getReview_idx() {
		return review_idx;
	}
	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public int getCourse_idx() {
		return course_idx;
	}
	public void setCourse_idx(int course_idx) {
		this.course_idx = course_idx;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public int getReview_read_count() {
		return review_read_count;
	}
	public void setReview_read_count(int review_read_count) {
		this.review_read_count = review_read_count;
	}
	public int getReview_like_count() {
		return review_like_count;
	}
	public void setReview_like_count(int review_like_count) {
		this.review_like_count = review_like_count;
	}
	public int getReview_rating() {
		return review_rating;
	}
	public void setReview_rating(int review_rating) {
		this.review_rating = review_rating;
	}
	public String getReview_del_yn() {
		return review_del_yn;
	}
	public void setReview_del_yn(String review_del_yn) {
		this.review_del_yn = review_del_yn;
	}
	public Date getReview_cre_date() {
		return review_cre_date;
	}
	public void setReview_cre_date(Date review_cre_date) {
		this.review_cre_date = review_cre_date;
	}
	public Date getReview_mod_date() {
		return review_mod_date;
	}
	public void setReview_mod_date(Date review_mod_date) {
		this.review_mod_date = review_mod_date;
	}

	@Override
	public String toString() {
		return "CourseReviewVo [review_idx=" + review_idx + ", member_idx=" + member_idx + ", course_idx=" + course_idx
				+ ", review_title=" + review_title + ", review_content=" + review_content + ", review_read_count="
				+ review_read_count + ", review_like_count=" + review_like_count + ", review_rating=" + review_rating
				+ ", review_del_yn=" + review_del_yn + ", review_cre_date=" + review_cre_date + ", review_mod_date="
				+ review_mod_date + "]";
	}

}
