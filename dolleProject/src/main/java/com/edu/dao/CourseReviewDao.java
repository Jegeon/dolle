package com.edu.dao;

import java.util.List;

import com.edu.vo.CourseReviewMemberCommentFileVo;
import com.edu.vo.CourseReviewVo;

public interface CourseReviewDao {

	public List<CourseReviewMemberCommentFileVo> reviewSelectList();
}
