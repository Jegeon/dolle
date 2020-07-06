package com.edu.courseReview.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.edu.courseReview.vo.CourseReviewMemberCommentFileVo;
import com.edu.courseReview.vo.CourseReviewVo;

public interface CourseReviewService {

	public List<CourseReviewMemberCommentFileVo> reviewSelectList();
	public void courseReviewInsertOne(CourseReviewVo reviewVo
			, MultipartHttpServletRequest mulRequest);
	
	public int reviewNewestSelectIdx();
	
}
