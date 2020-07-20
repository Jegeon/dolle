package com.edu.courseReview.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.edu.courseReview.vo.CommentVo;
import com.edu.courseReview.vo.CourseReviewMemberCommentFileVo;
import com.edu.courseReview.vo.CourseReviewVo;

public interface CourseReviewDao {

	public List<CourseReviewMemberCommentFileVo> reviewSelectList(String orderOption
			, String searchOption, String keyword, int start, int end);
	public CourseReviewMemberCommentFileVo reviewSelectOne(int reviewIdx);
	
	public int reviewMovePageOne(int rnum, int channel);
	public int reviewFindRNum(int reviewIdx);
	public int reviewFindLastRowNum();
	public List<Integer> reviewFindReadCount(List<Integer> reviewIdxList);
	
	public int courseReviewInsertOne(CourseReviewVo reviewVo);
	public int fileInsertOne(Map<String, Object> map);
	
	public int reviewNewestSelectIdx();
	public int reviewSelectTotalCount(String searchOption, String keyword);
	public int reviewIncreaseReadCount(int reviewIdx);
	
	public Map<String, Object> fileSelectStoredName(int reviewIdx);
	public int courseReviewUpdateOne(CourseReviewVo reviewVo);
	public int fileUpdateOne(Map<String, Object> map);
	public int courseReviewDeleteOne(int reviewIdx);
	public int fileDeleteOne(int reviewIdx);

	//다중삭제용
	public int courseReviewDeleteList(List<String> reviewIdxList);
	public int fileDeleteList(List<String> reviewIdxList);
	public int commentDeleteList(List<String> reviewIdxList); 
	
	//댓글
	public int commentInsertOne(CommentVo commentVo);
	public List<CommentVo> commentSelectList(int reviewIdx, int start, int end);
	public int commentDeleteOne(int commentIdx, int commentMemberIdx);
	public int commentUpdateOne(CommentVo commentVo);
	public int commentSelectTotalCount(int reviewIdx);
	public int commentDeleteTogether(int reviewIdx);
}
