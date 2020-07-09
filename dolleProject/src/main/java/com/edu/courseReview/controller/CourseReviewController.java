package com.edu.courseReview.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.edu.courseReview.service.CourseReviewService;
import com.edu.courseReview.util.ReviewPaging;
import com.edu.courseReview.vo.CourseReviewMemberCommentFileVo;
import com.edu.courseReview.vo.CourseReviewVo;

@Controller
public class CourseReviewController {

	private static final Logger log = 
			LoggerFactory.getLogger(CourseReviewController.class);
	
	@Autowired
	private CourseReviewService courseReviewService;
	
	
	//코스리뷰 전체 조회 화면
	@RequestMapping(value="/courseReview/list.do"
			, method = {RequestMethod.GET, RequestMethod.POST})
	public String courseReviewBoard(Model model
			,@RequestParam(defaultValue = "1") int curPage
			,@RequestParam(defaultValue = "newest") String orderOption
			,@RequestParam(defaultValue = "both") String searchOption
			,@RequestParam(defaultValue = "") String keyword) {
		log.debug(" **** Welcome courseReviewBoard ***"+ curPage+ orderOption+ searchOption);
		
		int totalCount = courseReviewService.reviewSelectTotalCount();
		
		ReviewPaging reviewPaging = new ReviewPaging(totalCount, curPage);
		int start = reviewPaging.getPageBegin();
		int end = reviewPaging.getPageEnd();
		
		System.out.println("======start"+start+"end"+end);
		List<CourseReviewMemberCommentFileVo> reviewList 
			= courseReviewService.reviewSelectList(orderOption, searchOption, keyword, start, end);
		int listSize = reviewList.size();
		
		
		//정렬
		model.addAttribute("orderOption",orderOption);
		
		//검색
		model.addAttribute("searchOption",searchOption);
		model.addAttribute("keyword",keyword);
		
		// 페이징
		Map<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("reviewPaging", reviewPaging);
		model.addAttribute("pagingMap",pagingMap);
		
		model.addAttribute("reviewList",reviewList);
		model.addAttribute("listSize",listSize);
		
		return "courseReview/courseReviewListView";
	}
	
	@RequestMapping(value="/courseReview/add.do", method = RequestMethod.GET)
	public String courseReviewAdd(Model model) {
		log.debug(" **** Welcome courseReviewForm ****");
		
		return "courseReview/courseReviewForm";
	}
	
	@RequestMapping(value="/courseReview/addCtr.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String courseReviewAdd(CourseReviewVo reviewVo
			, MultipartHttpServletRequest mulRequest
			, Model model) {
		log.debug(" **** Welcome courseReviewForm 등록 성공 ****");
		
		System.out.println("=====memberIdx"+reviewVo.getReviewMemberIdx());
		courseReviewService.courseReviewInsertOne(reviewVo, mulRequest);
		
		return "redirect:/courseReview/list.do";
	}
	
	
	@RequestMapping(value="/courseReview/detail.do", method = RequestMethod.GET)
	public String courseReviewDetail(int reviewIdx, Model model) {
		log.debug(" **** Welcome courseReviewDetail ****");
		
		//조회수 증가
//		courseReviewService.reviewIncreaseLikeCount(reviewIdx);

		CourseReviewMemberCommentFileVo reviewMCFVo
		 = courseReviewService.reviewSelectOne(reviewIdx);
		
		model.addAttribute("reviewMCFVo",reviewMCFVo);
		
		return "courseReview/courseReviewDetailView";
	}
	
	
	@RequestMapping(value="/courseReview/update.do", method = RequestMethod.GET)
	public String courseReviewUpdate(int reviewIdx, Model model) {
		log.debug(" **** Welcome courseReviewUpdate - { } ****", reviewIdx);
		
		CourseReviewMemberCommentFileVo reviewMCFVo
		 = courseReviewService.reviewSelectOne(reviewIdx);
		
		model.addAttribute("reviewMCFVo",reviewMCFVo);
		
		return "courseReview/courseReviewUpdateForm";
	}
	
	@RequestMapping(value="/courseReview/updateCtr.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String courseReviewUpdate(CourseReviewVo reviewVo
			, @RequestParam(value="fileIdx", defaultValue = "-1") int fileIdx
			, MultipartHttpServletRequest mulRequest, Model model) {
		log.debug(" **** Welcome courseReviewUpdate POST****");
		log.debug(" **** Welcome courseReviewUpdate POST****" + reviewVo.getReviewIdx(), reviewVo.getReviewTitle()
				,reviewVo.getReviewRating());
		
		courseReviewService.courseReviewUpdateOne(reviewVo, mulRequest, fileIdx);
		
		return "redirect:/courseReview/list.do";
	}
	
	
	@RequestMapping(value="/courseReview/delete.do", method = RequestMethod.GET)
	public String courseReviewDelete(int reviewIdx, Model model) {
		log.debug(" **** Welcome courseReviewDelete ****");
		
		courseReviewService.courseReviewDeleteOne(reviewIdx);
		
		return "redirect:/courseReview/list.do";
	}
	
}
