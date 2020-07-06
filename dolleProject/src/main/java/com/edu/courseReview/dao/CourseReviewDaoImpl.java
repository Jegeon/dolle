package com.edu.courseReview.dao;

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
	public List<CourseReviewMemberCommentFileVo> reviewSelectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "reviewMemComFileList");
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
	
}
