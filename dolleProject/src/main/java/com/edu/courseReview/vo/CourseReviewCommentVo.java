package com.edu.courseReview.vo;

import java.util.Date;

public class CourseReviewCommentVo {

	private int comment_idx;
	private int review_idx;
	private int member_idx;
	private String comment_content;
	private String comment_emotion;
	private String comment_del_yn;
	private Date comment_cre_date;
	private Date comment_mod_date;
	
	public CourseReviewCommentVo() {
		super();
	}

	public CourseReviewCommentVo(int comment_idx, int review_idx, int member_idx, String comment_content,
			String comment_emotion, String comment_del_yn, Date comment_cre_date, Date comment_mod_date) { 
		super();
		this.comment_idx = comment_idx;
		this.review_idx = review_idx;
		this.member_idx = member_idx;
		this.comment_content = comment_content;
		this.comment_emotion = comment_emotion;
		this.comment_del_yn = comment_del_yn;
		this.comment_cre_date = comment_cre_date;
		this.comment_mod_date = comment_mod_date;
	}

	public int getComment_idx() {
		return comment_idx;
	}
	public void setComment_idx(int comment_idx) {
		this.comment_idx = comment_idx;
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
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public String getComment_emotion() {
		return comment_emotion;
	}
	public void setComment_emotion(String comment_emotion) {
		this.comment_emotion = comment_emotion;
	}
	public String getComment_del_yn() {
		return comment_del_yn;
	}
	public void setComment_del_yn(String comment_del_yn) {
		this.comment_del_yn = comment_del_yn;
	}
	public Date getComment_cre_date() {
		return comment_cre_date;
	}
	public void setComment_cre_date(Date comment_cre_date) {
		this.comment_cre_date = comment_cre_date;
	}
	public Date getComment_mod_date() {
		return comment_mod_date;
	}
	public void setComment_mod_date(Date comment_mod_date) {
		this.comment_mod_date = comment_mod_date;
	}


	@Override
	public String toString() {
		return "CommentVo [comment_idx=" + comment_idx + ", review_idx=" + review_idx + ", member_idx=" + member_idx
				+ ", comment_content=" + comment_content + ", comment_emotion=" + comment_emotion + ", comment_del_yn="
				+ comment_del_yn + ", comment_cre_date=" + comment_cre_date + ", comment_mod_date=" + comment_mod_date
				+ "]";
	}
	
}
