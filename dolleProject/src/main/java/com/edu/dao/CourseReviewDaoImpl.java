package com.edu.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.vo.CourseReviewMemberCommentFileVo;
import com.edu.vo.CourseReviewVo;

@Repository
public class CourseReviewDaoImpl implements CourseReviewDao{

	@Autowired
	SqlSessionTemplate sqlSession;

	String namespace = "com.edu.";
	
	@Override
	public List<CourseReviewMemberCommentFileVo> reviewSelectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "reviewMemComFileList");
	}
	
}
