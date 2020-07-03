package com.edu.courseReview.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.courseReview.dao.CourseReviewDao;
import com.edu.courseReview.vo.CourseReviewMemberCommentFileVo;

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
