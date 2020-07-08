package com.edu.courseReview.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.edu.courseReview.vo.CourseReviewMemberCommentFileVo;
import com.edu.courseReview.vo.CourseReviewVo;

public interface CourseReviewService {

	public List<CourseReviewMemberCommentFileVo> reviewSelectList(String orderOption, int start, int end);
	public CourseReviewMemberCommentFileVo reviewSelectOne(int reviewIdx);
	public void courseReviewInsertOne(CourseReviewVo reviewVo
			, MultipartHttpServletRequest mulRequest);
	
	public int reviewNewestSelectIdx();
	public int reviewSelectTotalCount();
//	public int reviewIncreaseReadCount(int reviewIdx);
	
	public void courseReviewUpdateOne(CourseReviewVo reviewVo
			, MultipartHttpServletRequest mulRequest, int fileIdx);
	public int fileUpdateOne(Map<String, Object> map);
	public Map<String, Object> fileSelectStoredName(int reviewIdx);
	
	public void courseReviewDeleteOne(int reviewIdx);
}
