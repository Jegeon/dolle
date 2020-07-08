package com.edu.courseReview.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.courseReview.vo.CourseReviewMemberCommentFileVo;
import com.edu.courseReview.vo.CourseReviewVo;

@Repository
public class CourseReviewDaoImpl implements CourseReviewDao{

	@Autowired
	SqlSessionTemplate sqlSession;

	String namespace = "com.edu.courseReview.";
	
	@Override
	public List<CourseReviewMemberCommentFileVo> reviewSelectList(String orderOption, int start, int end) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		map.put("orderOption", orderOption);
		
		return sqlSession.selectList(namespace + "reviewMemComFileList", map);
	}
	
	@Override
	public CourseReviewMemberCommentFileVo reviewSelectOne(int reviewIdx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"reviewSelectOne", reviewIdx);
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
	public int reviewSelectTotalCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "reviewSelectTotalCount");
	}

	@Override
	public int reviewIncreaseReadCount(int reviewIdx) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "increaseReadCount", reviewIdx);
	}

	
	
	
}
