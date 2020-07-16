package com.edu.courseReview.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.courseReview.vo.CommentVo;
import com.edu.courseReview.vo.CourseReviewMemberCommentFileVo;
import com.edu.courseReview.vo.CourseReviewVo;

@Repository
public class CourseReviewDaoImpl implements CourseReviewDao{

	@Autowired
	SqlSessionTemplate sqlSession;

	String namespace = "com.edu.courseReview.";
	
	@Override
	public List<CourseReviewMemberCommentFileVo> reviewSelectList(String orderOption
			, String searchOption, String keyword, int start, int end) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		map.put("orderOption", orderOption);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
		return sqlSession.selectList(namespace + "reviewMemComFileList", map);
	}
	
	@Override
	public CourseReviewMemberCommentFileVo reviewSelectOne(int reviewIdx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"reviewSelectOne", reviewIdx);
	}
	
	//이전글 다음글
	@Override
	public int reviewMovePageOne(int rnum, int channel) {
		// TODO Auto-generated method stub
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("rnum", rnum);
		map.put("channel", channel);
		return sqlSession.selectOne(namespace + "reviewMovePageOne", map);
	}
	

	@Override
	public int courseReviewInsertOne(CourseReviewVo reviewVo) {
		// TODO Auto-generated method stub
		
		return sqlSession.insert(namespace + "reviewInsertOne", reviewVo);
	}

	@Override
	public int fileInsertOne(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace + "fileInsertOne", map);
	}
	
	@Override
	public int reviewNewestSelectIdx(){
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "reviewNewestSelectIdx");
	}

	@Override
	public int courseReviewUpdateOne(CourseReviewVo reviewVo) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "reviewUpdateOne", reviewVo);
	}
	@Override
	public int fileUpdateOne(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "fileUpdateOne", map);
	}

	@Override
	public int courseReviewDeleteOne(int reviewIdx) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace + "reviewDeleteOne", reviewIdx);
	}
	@Override
	public int fileDeleteOne(int fileIdx) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace + "fileDeleteOne", fileIdx);
	}

	@Override
	public Map<String, Object> fileSelectStoredName(int reviewIdx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "fileSelectStoredName", reviewIdx);
	}

	@Override
	public int reviewSelectTotalCount(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return sqlSession.selectOne(namespace + "reviewSelectTotalCount", map);
	}

	@Override
	public int reviewIncreaseReadCount(int reviewIdx) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "increaseReadCount", reviewIdx);
	}

	//댓글
	@Override
	public int commentInsertOne(CommentVo commentVo) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace + "commentInsertOne", commentVo);
	}

	@Override
	public List<CommentVo> commentSelectList(int commentReviewIdx, int start, int end) {
		// TODO Auto-generated method stub
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("commentReviewIdx", commentReviewIdx);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList(namespace + "commentSelectList", map);
	}

	
	@Override
	public int commentDeleteOne(int commentIdx, int commentMemberIdx) {
		// TODO Auto-generated method stub
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("commentIdx", commentIdx);
		map.put("commentMemberIdx", commentMemberIdx);
		
		return sqlSession.delete(namespace + "commentDeleteOne", map);
	}

	@Override
	public int commentUpdateOne(CommentVo commentVo) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "commentUpdateOne", commentVo);
	}


	//다중삭제용
	@Override
	public int commentDeleteList(List<String> reviewIdxList) {
		// TODO Auto-generated method stub
		System.out.println("Dao commentDeleteList 접근중"+ reviewIdxList.get(0));
		return sqlSession.delete(namespace + "commentDeleteList", reviewIdxList);
	}
	@Override
	public int courseReviewDeleteList(List<String> reviewIdxList) {
		// TODO Auto-generated method stub
		System.out.println("Dao courseReviewDeleteList 접근중"+ reviewIdxList.get(0));

		return sqlSession.delete(namespace + "reviewDeleteList", reviewIdxList);
	}
	@Override
	public int fileDeleteList(List<String> reviewIdxList) {
		// TODO Auto-generated method stub
		System.out.println("Dao fileDeleteList 접근중"+ reviewIdxList.get(0));

		return sqlSession.delete(namespace + "fileDeleteList", reviewIdxList);
	}

	@Override
	public int reviewFindRNum(int reviewIdx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "reviewFindRNum", reviewIdx);
	}

	@Override
	public int reviewFindLastRowNum() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "reviewFindLastRowNum");
	}

	@Override
	public int commentSelectTotalCount(int reviewIdx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "commentSelectTotalCount", reviewIdx);
	}

	@Override
	public int commentDeleteTogether(int reviewIdx) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace + "commentDeleteTogether", reviewIdx);
	}

	
	
	
	
}
