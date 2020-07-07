package com.edu.courseReview.dao;

import java.util.List;
import java.util.Map;

import com.edu.courseReview.vo.CourseReviewMemberCommentFileVo;
import com.edu.courseReview.vo.CourseReviewVo;

public interface CourseReviewDao {

	public List<CourseReviewMemberCommentFileVo> reviewSelectList();
	public CourseReviewMemberCommentFileVo reviewSelectOne(int reviewIdx);
	public int courseReviewInsertOne(CourseReviewVo reviewVo);
	public int fileInsertOne(Map<String, Object> map);
	public int reviewNewestSelectIdx();
	
	public Map<String, Object> fileSelectStoredName(int reviewIdx);
	public int courseReviewUpdateOne(CourseReviewVo reviewVo);
	public int fileUpdateOne(Map<String, Object> map);
	public int courseReviewDeleteOne(int reviewIdx);
	public int fileDeleteOne(int reviewIdx);
	
}
