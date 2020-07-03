package com.edu.courseReview.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.edu.courseReview.service.CourseReviewService;
import com.edu.courseReview.vo.CourseReviewMemberCommentFileVo;

@Controller
public class CourseReviewController {

	private static final Logger log = 
			LoggerFactory.getLogger(CourseReviewController.class);
	
	@Autowired
	private CourseReviewService courseReviewService;
	
	
	//코스리뷰 전체 조회 화면
	@RequestMapping(value="/courseReview/list.do", method = RequestMethod.GET)
	public String courseReviewBoard(Model model) {
		log.debug(" **** Welcome courseReviewBoard ****");
		
//		List<CourseReviewVo> reviewList = courseReviewService.reviewSelectList();
		List<CourseReviewMemberCommentFileVo> reviewList = courseReviewService.reviewSelectList();
		
		int listSize = reviewList.size();
		
		model.addAttribute("reviewList",reviewList);
		model.addAttribute("listSize",listSize);
		
		return "courseReview/courseReviewListView";
	}
	
	//코스리뷰 작성
	@RequestMapping(value="/courseReview/add.do", method = RequestMethod.GET)
	public String courseReviewAdd(Model model) {
		log.debug(" **** Welcome courseReviewAdd ****");


		
		return "courseReview/courseReviewForm";
	}
	
}
