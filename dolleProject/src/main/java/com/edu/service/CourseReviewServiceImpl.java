package com.edu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.dao.CourseReviewDao;
import com.edu.vo.CourseReviewMemberCommentFileVo;
import com.edu.vo.CourseReviewVo;

@Service
public class CourseReviewServiceImpl implements CourseReviewService{

	@Autowired
	public CourseReviewDao courseReviewDao;

	@Override
	public List<CourseReviewMemberCommentFileVo> reviewSelectList() {
		// TODO Auto-generated method stub
		return courseReviewDao.reviewSelectList();
	}
	
}
