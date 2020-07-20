package com.edu.courseReview.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.edu.courseReview.service.CourseReviewService;
import com.edu.courseReview.util.ReviewPaging;
import com.edu.courseReview.vo.CommentVo;
import com.edu.courseReview.vo.CourseReviewMemberCommentFileVo;
import com.edu.courseReview.vo.CourseReviewVo;
import com.edu.member.vo.MemberVo;
import com.edu.util.Paging;

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
		System.out.println("searchOption"+searchOption+"keyword"+keyword);
		
		int totalCount = courseReviewService.reviewSelectTotalCount(searchOption, keyword);
		
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
	
	@ResponseBody
	@RequestMapping(value = "/courseReview/checkReadCount.do", method = {RequestMethod.GET, RequestMethod.POST})
//	public Object checkReadCount(int readcount, int cmtCount, int imgWidth, int imgHeight, Model model) {
	public Object checkReadCount(List<Integer> reviewIdxList, Model model) {
		log.debug("checkReadCount test! - {}", reviewIdxList);
		
		List<Integer> readCount = new ArrayList<Integer>();
		readCount = courseReviewService.reviewFindReadCount(reviewIdxList);
		System.out.println(readCount);
		HashMap<String, Object> map = new HashMap<>();
		map.put("readCount", readCount);
//		map.put("cmtCount", cmtCount);
//		map.put("imgWidth", imgWidth);
//		map.put("imgHeight", imgHeight);
		
		return map;
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
	
	
	@RequestMapping(value="/courseReview/detail.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String courseReviewDetail(int reviewIdx
			,@RequestParam(defaultValue = "1") int cmtCurPage
			, Model model) {
		log.debug(" **** Welcome courseReviewDetail ****");
		
		//후기 
		CourseReviewMemberCommentFileVo reviewMCFVo
		 = courseReviewService.reviewSelectOne(reviewIdx);	//+조회수 증가 같이 기능함
		
		int cmtTotalCount = courseReviewService.commentSelectTotalCount(reviewIdx);
		
		Paging commentPaging = new Paging(cmtTotalCount, cmtCurPage, 10);
		int cmtStart = commentPaging.getPageBegin();
		int cmtEnd = commentPaging.getPageEnd();
		System.out.println(cmtStart+" + "+cmtEnd); 
		
		//댓글 리스트
		List<CommentVo> commentList = courseReviewService.commentSelectList(reviewIdx, cmtStart, cmtEnd);
		
		//현재 글의 번호 
		int rnum = courseReviewService.reviewFindRNum(reviewIdx);
		int lastRowNum = courseReviewService.reviewFindLastRowNum();
		//윗글 아랫글 검색결과로 적용할 시 ...
//		int lastRowNum = courseReviewService.reviewSelectTotalCount();
		
		model.addAttribute("reviewMCFVo",reviewMCFVo);
		model.addAttribute("rnum",rnum);
		model.addAttribute("lastRowNum",lastRowNum);
		
		model.addAttribute("commentList",commentList);
		model.addAttribute("cmtCurPage",cmtCurPage);
		int lastCmtPage = cmtTotalCount/10 +1;
		model.addAttribute("lastCmtPage",lastCmtPage);
		System.out.println("cmtCurPage"+cmtCurPage+"lastCmtPage"+lastCmtPage);
		
		//한페이지에 보이는 높이 계산용
		int commentCnt = commentList.size();
		model.addAttribute("commentCnt",commentCnt);
		
		
		return "courseReview/courseReviewDetailView";
	}
	
	@RequestMapping(value="/courseReview/pageMove.do", method = RequestMethod.GET)
	public String courseReviewDetailPageMove(int reviewIdx, int rnum
			,@RequestParam(defaultValue = "1") int channel 
			, Model model) {
		log.debug(" **** Welcome courseReviewDetailPageMove ****");
		
		int nextReviewIdx = courseReviewService.reviewMovePageOne(rnum, channel);
		
		model.addAttribute("reviewIdx",nextReviewIdx);
		
		return "redirect:/courseReview/detail.do";
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

	
	//댓글
	@RequestMapping(value="/courseReview/addCommentCtr.do", method = RequestMethod.POST)
	public String commentAdd(CommentVo commentVo, Model model) {
		log.debug(" **** Welcome commentAdd 등록 성공 ****");
		
		System.out.println("=====commentVo"+commentVo);
		courseReviewService.commentInsertOne(commentVo);
		
		int reviewIdx = commentVo.getCommentReviewIdx();
		model.addAttribute("reviewIdx", reviewIdx);
		
		return "redirect:/courseReview/detail.do";
	}
	
	@RequestMapping(value="/courseReview/deleteCommentCtr.do", method = RequestMethod.GET)
	public String commentDelete(int reviewIdx, int commentIdx, int memberIdx, Model model) {
		log.debug(" **** Welcome commentDelete 성공 ****"+reviewIdx+" : "+commentIdx+" : "+memberIdx);
		
		courseReviewService.commentDeleteOne(commentIdx, memberIdx);
		
		model.addAttribute("reviewIdx", reviewIdx);
		
		return "redirect:/courseReview/detail.do";
	}
	
	@RequestMapping(value="/courseReview/updateCommentCtr.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String commentUpdate(CommentVo commentVo
			, @RequestParam(defaultValue = "1") int cmtCurPage 
			, Model model) {
		log.debug(" **** Welcome commentUpdate POST****");
		
		courseReviewService.commentUpdateOne(commentVo);
		
		int reviewIdx = commentVo.getCommentReviewIdx();
		model.addAttribute("reviewIdx", reviewIdx);
		model.addAttribute("cmtCurPage", cmtCurPage);
		
		return "redirect:/courseReview/detail.do";
	}
	
	
	//관리자 페이지 
	@RequestMapping(value="/courseReview/adminList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String courseReviewAdminList(Model model
			, @RequestParam(defaultValue = "1") int curPage
			, @RequestParam(defaultValue = "10") int pageScale
			, @RequestParam(defaultValue = "newest") String orderOption
			, @RequestParam(defaultValue = "both") String searchOption
			, @RequestParam(defaultValue = "") String keyword) {
		log.debug(" **** Welcome courseReviewAdminList ***"+ curPage+ orderOption+ searchOption);
		
		int totalCount = courseReviewService.reviewSelectTotalCount(searchOption, keyword);
		
		Paging adminPaging = new Paging(totalCount, curPage, pageScale);
		int start = adminPaging.getPageBegin();
		int end = adminPaging.getPageEnd();
		
		System.out.println("======start"+start+"end"+end);
		List<CourseReviewMemberCommentFileVo> reviewList 
			= courseReviewService.reviewSelectList(orderOption, searchOption, keyword, start, end);
		int listSize = reviewList.size();
		
		//정렬
		model.addAttribute("orderOption",orderOption);
		model.addAttribute("pageScale",pageScale);
		
		//검색
		model.addAttribute("searchOption",searchOption);
		model.addAttribute("keyword",keyword);
		
		// 페이징
		Map<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("adminPaging", adminPaging);
		model.addAttribute("pagingMap",pagingMap);
		
		model.addAttribute("reviewList",reviewList);
		model.addAttribute("listSize",listSize);
		
		return "courseReview/adminCourseReviewList";
	}
	

	//다중 삭제
	@RequestMapping(value="/courseReview/multiDelete.do", method = RequestMethod.POST)
	public String courseReviewMultiDelete(Model model
			,@RequestParam(defaultValue = "0") List<String> checkIdx) {
		log.debug(" **** Welcome courseReviewMultiDelete ****");
		System.out.println("==========checkIdx=========");
		for(int i=0; i<checkIdx.size(); i++) {			
			System.out.println(checkIdx.get(i));
		}
		
		courseReviewService.courseReviewDeleteList(checkIdx);
		
		return "redirect:/courseReview/adminList.do";
	}

}
