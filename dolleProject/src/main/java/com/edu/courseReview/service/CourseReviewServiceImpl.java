package com.edu.courseReview.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.edu.courseReview.dao.CourseReviewDao;
import com.edu.courseReview.vo.CourseReviewMemberCommentFileVo;
import com.edu.courseReview.vo.CourseReviewVo;
import com.edu.courseReview.vo.ReviewFileUtils;

@Service
public class CourseReviewServiceImpl implements CourseReviewService{

	@Autowired
	public CourseReviewDao courseReviewDao;

	@Resource(name="reviewFileUtils")
	private ReviewFileUtils reviewFileUtils;
		
	@Override
	public List<CourseReviewMemberCommentFileVo> reviewSelectList() {
		// TODO Auto-generated method stub
		return courseReviewDao.reviewSelectList();
	}

	
	@Override
	public void courseReviewInsertOne(CourseReviewVo reviewVo
			, MultipartHttpServletRequest multipartHttpServletRequest) {
		// TODO Auto-generated method stub
		courseReviewDao.courseReviewInsertOne(reviewVo);
		
		int newestIdx = courseReviewDao.reviewNewestSelectIdx();
		
		int reviewIdx = newestIdx;
		System.out.println("**************reviewIdx"+reviewIdx+"************");
		try {
			List<Map<String, Object>> fileList = 
				reviewFileUtils.parseInsertFileInfo(reviewIdx
					, multipartHttpServletRequest);
			
			for (int i = 0; i < fileList.size(); i++) {
				courseReviewDao.fileInsertOne(fileList.get(i));
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("문제 생기면 처리할꺼 정하자");
			System.out.println("일단 여긴 파일 처리 중 문제 발생한 거야");
			e.printStackTrace();
		}
		
	}


	@Override
	public int reviewNewestSelectIdx() {
		// TODO Auto-generated method stub
		return courseReviewDao.reviewNewestSelectIdx();
	}

	
}
