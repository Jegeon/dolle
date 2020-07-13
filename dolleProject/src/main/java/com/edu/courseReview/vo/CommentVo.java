package com.edu.courseReview.vo;

import java.util.Date;

public class CommentVo {
	
	//Comment
	private int commentIdx;
	private int commentReviewIdx;
	private int commentMemberIdx;
	private String memberNickname;
	private String commentContent;
	private String commentEmoticon;
	private Date creDate;
	private Date modDate;
	private String commentDelYn;
	
	public CommentVo() {
		super();
	}
	
	public CommentVo(int commentIdx, int commentReviewIdx, int commentMemberIdx, String memberNickname,
			String commentContent, String commentEmoticon, Date creDate, Date modDate, String commentDelYn) {
		super();
		this.commentIdx = commentIdx;
		this.commentReviewIdx = commentReviewIdx;
		this.commentMemberIdx = commentMemberIdx;
		this.memberNickname = memberNickname;
		this.commentContent = commentContent;
		this.commentEmoticon = commentEmoticon;
		this.creDate = creDate;
		this.modDate = modDate;
		this.commentDelYn = commentDelYn;
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
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public String getCommentEmoticon() {
		return commentEmoticon;
	}
	public void setCommentEmoticon(String commentEmoticon) {
		this.commentEmoticon = commentEmoticon;
	}
	public Date getCreDate() {
		return creDate;
	}
	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}
	public Date getModDate() {
		return modDate;
	}
	public void setModDate(Date modDate) {
		this.modDate = modDate;
	}
	public String getCommentDelYn() {
		return commentDelYn;
	}
	public void setCommentDelYn(String commentDelYn) {
		this.commentDelYn = commentDelYn;
	}
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}

	@Override
	public String toString() {
		return "CommentVo [commentIdx=" + commentIdx + ", commentReviewIdx=" + commentReviewIdx + ", commentMemberIdx="
				+ commentMemberIdx + ", memberNickname=" + memberNickname + ", commentContent=" + commentContent
				+ ", commentEmoticon=" + commentEmoticon + ", creDate=" + creDate + ", modDate=" + modDate
				+ ", commentDelYn=" + commentDelYn + "]";
	}
	
}
