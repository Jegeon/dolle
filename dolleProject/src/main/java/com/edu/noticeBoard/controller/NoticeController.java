package com.edu.noticeBoard.controller;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.edu.noticeBoard.service.NoticeService;
import com.edu.noticeBoard.vo.NoticeMemberFileVo;
import com.edu.util.Paging;

@Controller
public class NoticeController {

	private static final Logger log = 
			LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeService noticeService;
	
	
	
	@RequestMapping(value = "/noticeBoard/list.do"
			, method = {RequestMethod.GET, RequestMethod.POST})
	public String NoticeList(Model model
			, @RequestParam(defaultValue = "1") int curPage) {
		log.info("Welcome NoticeList! "  + curPage);
		
		int totalCount = noticeService.noticeSelectTotalCount();
		
		
		Paging paging = new Paging(totalCount, curPage, 10);
		int start = paging.getPageBegin();
		int end = paging.getPageEnd();
		
		List<NoticeMemberFileVo> noticeMemberFileList = noticeService.noticeMemberFileList(start, end);
		List<NoticeMemberFileVo> noticeMemberFileFixedList = noticeService.noticeMemberFileFixedList();
		
		int listSize = noticeMemberFileList.size();
		
		// tempList에 고정으로 띄울 최신글 4개를 저장하고 tempList만 보내서 따로 거르는 과정
		int fixedListCount = noticeMemberFileFixedList.size();
		int limitNum = 4;
		List<NoticeMemberFileVo> tempList = new ArrayList<NoticeMemberFileVo>();
		if(fixedListCount > limitNum) {
			for(int i=0; i<limitNum; i++) {
				tempList.add(noticeMemberFileFixedList.get(i));
			}
		}else {
			for(int i=0; i<noticeMemberFileFixedList.size(); i++) {
				tempList.add(noticeMemberFileFixedList.get(i));
			}
		}
		
		//페이징
		Map<String, Object> pagingMap = new HashMap<>();
		
		
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("paging", paging);
		model.addAttribute("pagingMap", pagingMap);
		
		
		model.addAttribute("noticeMemberFileList", noticeMemberFileList);
		model.addAttribute("noticeMemberFileFixedList", tempList);
		model.addAttribute("listSize", listSize);
		
		
		
		return "noticeBoard/noticeBoardListView";
	}
	
	@RequestMapping(value="/noticeBoard/detail.do", method = RequestMethod.GET)
	public String noticeBoardDetailView(Model model
			, @RequestParam(defaultValue = "1") int curPage
			, int noticeIdx) {
		log.debug(" *** Welcome NoticeBoardDetail View {}***", noticeIdx);
		
		NoticeMemberFileVo noticeVo = noticeService.noticeDetailSelectOne(noticeIdx);
		
		int rNum = noticeService.noticeFindCurrentRow(noticeIdx);
		
		int totalCount = noticeService.noticeSelectTotalCount();
		
		Paging paging = new Paging(totalCount, curPage, 10);
		int start = paging.getPageBegin();
		int end = paging.getPageEnd();
		
		int topIdx = noticeService.noticeFindUpIdx(2);
		int listSize = noticeService.noticeMemberFileList(start, end).size();
		int bottomIdx = noticeService.noticeFindUpIdx(listSize+1);
		
		int upIdx = topIdx;
		int downIdx = bottomIdx;
		
		if(rNum == topIdx) {
			upIdx = noticeService.noticeFindUpIdx(rNum);
		}

		if(rNum == 1) {
			downIdx	= noticeService.noticeFindDownIdx(rNum);
		}
		
		
		if(upIdx > topIdx) {
			upIdx = -1;
		}
		
		model.addAttribute("noticeVo", noticeVo);
		model.addAttribute("upIdx", upIdx);
		model.addAttribute("downIdx", downIdx);
		
		return "noticeBoard/noticeBoardDetailView";
	}
	
	
	
	@RequestMapping(value = "/noticeBoard/adminNoticeAdd.do", method = {RequestMethod.GET})
	public String adminNoticeAdd(Model model) {
		
		log.info("call AdminNoticeAdd!");
		
		
		return "/noticeBoard/adminNoticeBoardAddView";
	}
	
	@RequestMapping(value = "/noticeBoard/adminNoticeAddCtr.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminNoticeAdd(Model model
			, NoticeMemberFileVo noticeMemberFileVo
			, MultipartHttpServletRequest mulRequest
			, @RequestParam(defaultValue = "none") String fixed) {
		log.info("call adminNoticeAdd_Ctr! {}", noticeMemberFileVo);
		
		noticeMemberFileVo.setNoticeFixed(fixed);
		
		noticeService.noticeInsertOne(noticeMemberFileVo, mulRequest);
		
		return "redirect:/noticeBoard/list.do";
	}
	

	
	@RequestMapping(value = "/noticeBoard/adminUpdate.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminNoticeUpdate(Model model
			, int noticeIdx) {
		log.info("call adminNoticeUpdate!");
		
		NoticeMemberFileVo noticeVo = noticeService.noticeDetailSelectOne(noticeIdx);
		
		model.addAttribute("noticeVo", noticeVo);
		
		return "/noticeBoard/adminNoticeBoardUpdateView";
	}
	
	@RequestMapping(value = "/noticeBoard/adminUpdateCtr.do", method = {RequestMethod.POST})
	public String adminNoticeUpdate(Model model, @RequestParam(defaultValue = "none") String fixed
			, NoticeMemberFileVo noticeMemberFileVo
			, MultipartHttpServletRequest mulRequest
			, @RequestParam(value="fileIdx", defaultValue="-1") int fileIdx) {
		log.info("call adminNoticeUpdateCtr!!!!!!!!!!!!!!!!!!", noticeMemberFileVo, fixed);
		
		
		noticeMemberFileVo.setNoticeFixed(fixed);
		noticeService.noticeUpdateOne(noticeMemberFileVo, mulRequest, fileIdx);
		
		
		
		return "redirect:/noticeBoard/list.do";
		
	}
	
	@RequestMapping(value = "/noticeBoard/adminNoticeDeleteCtr.do", method = {RequestMethod.GET})
	public String adminNoticeDelete(int noticeIdx, Model model) {
		log.info("call adminNoticeDeleteCtr! " + noticeIdx);
		
		noticeService.noticeDeleteOne(noticeIdx);
		
		return "redirect:/noticeBoard/list.do";
	}
	
	
}
