package com.edu.courseReview.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.edu.courseReview.vo.CommentVo;
import com.edu.courseReview.vo.CourseReviewMemberCommentFileVo;
import com.edu.courseReview.vo.CourseReviewVo;

public interface CourseReviewService {

	public List<CourseReviewMemberCommentFileVo> reviewSelectList(String orderOption
			, String searchOption, String keyword, int start, int end);
	public CourseReviewMemberCommentFileVo reviewSelectOne(int reviewIdx);
	
	public int reviewMovePageOne(int rnum, int channel);
	public int reviewFindRNum(int reviewIdx);
	public int reviewFindLastRowNum();
	public List<String> reviewFindReadCount(List<String> reviewIdxList);
	public List<String> reviewFindCmtNum(List<String> reviewIdxList);
	
	public void courseReviewInsertOne(CourseReviewVo reviewVo
			, MultipartHttpServletRequest mulRequest);
	
	public int reviewNewestSelectIdx();
	public int reviewSelectTotalCount(String searchOption, String keyword);
//	public int reviewIncreaseReadCount(int reviewIdx);
	
	public void courseReviewUpdateOne(CourseReviewVo reviewVo
			, MultipartHttpServletRequest mulRequest, int fileIdx);
	public int fileUpdateOne(Map<String, Object> map);
	public Map<String, Object> fileSelectStoredName(int reviewIdx);
	
	public void courseReviewDeleteOne(int reviewIdx);
	public int courseReviewDeleteList(List<String> reviewIdxList); //다중삭제
	
	
	//댓글
	public int commentInsertOne(CommentVo commentVo);
	public List<CommentVo> commentSelectList(int reviewIdx, int start, int end);
	public int commentDeleteOne(int commentIdx, int commentMemberIdx);
	public int commentUpdateOne(CommentVo commentVo);
	public int commentSelectTotalCount(int reviewIdx);
}
