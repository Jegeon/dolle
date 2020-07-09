package com.edu.noticeBoard.controller;

import java.util.ArrayList;
import java.util.List;

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

@Controller
public class NoticeController {

	private static final Logger log = 
			LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeService noticeService;
	
	
	
	@RequestMapping(value="/noticeBoard/detail.do", method = RequestMethod.GET)
	public String noticeBoardDetailView(Model model
			, int noticeIdx) {
		log.debug(" *** Welcome NoticeBoardDetail View {}***", noticeIdx);
		
		NoticeMemberFileVo noticeVo = noticeService.noticeDetailSelectOne(noticeIdx);
		
		int rNum = noticeService.noticeFindCurrentRow(noticeIdx);
		
		int topIdx = noticeService.noticeFindUpIdx(2);
		int listSize = noticeService.noticeMemberFileList().size();
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
	
	@RequestMapping(value = "/noticeBoard/list.do"
			, method = {RequestMethod.GET, RequestMethod.POST})
	public String NoticeList(Model model) {
		log.info("Welcome NoticeList! " );
		
		List<NoticeMemberFileVo> noticeMemberFileList = noticeService.noticeMemberFileList();
		List<NoticeMemberFileVo> noticeMemberFileFixedList = noticeService.noticeMemberFileFixedList();
		
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
		
		model.addAttribute("noticeMemberFileList", noticeMemberFileList);
		model.addAttribute("noticeMemberFileFixedList", tempList);
		
		
		
		return "noticeBoard/noticeBoardListView";
	}
	
	@RequestMapping(value = "/noticeBoard/adminList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminNoticeBoardListView(Model model) {

		log.debug(" *** Welcome adminNoticeBoardListView {}***");

		List<NoticeMemberFileVo> noticeMemberFileList = noticeService.noticeMemberFileList();
		List<NoticeMemberFileVo> noticeMemberFileFixedList = noticeService.noticeMemberFileFixedList();

// tempList에 고정으로 띄울 최신글 4개를 저장하고 tempList만 보내서 따로 거르는 과정
		int fixedListCount = noticeMemberFileFixedList.size();
		int limitNum = 4;
		List<NoticeMemberFileVo> tempList = new ArrayList<NoticeMemberFileVo>();
		if (fixedListCount > limitNum) {
			for (int i = 0; i < limitNum; i++) {
				tempList.add(noticeMemberFileFixedList.get(i));
			}
		} else {
			for (int i = 0; i < noticeMemberFileFixedList.size(); i++) {
				tempList.add(noticeMemberFileFixedList.get(i));
			}
		}

		model.addAttribute("noticeMemberFileList", noticeMemberFileList);
		model.addAttribute("noticeMemberFileFixedList", tempList);

		return "noticeBoard/adminNoticeBoardListView";
	}
	
	@RequestMapping(value = "/noticeBoard/AdminNoticeAdd.do", method = {RequestMethod.GET})
	public String adminNoticeAdd(Model model) {
		
		log.info("call AdminNoticeAdd!");
		
		
		return "/noticeBoard/adminNoticeBoardAddView";
	}
	
	@RequestMapping(value = "/noticeBoard/AdminNoticeAddCtr.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminNoticeAdd(Model model
			, NoticeMemberFileVo noticeMemberFileVo
			, MultipartHttpServletRequest mulRequest
			, @RequestParam(defaultValue = "none") String fixed) {
		log.info("call adminNoticeAdd_Ctr! {}", noticeMemberFileVo);
		
		noticeMemberFileVo.setNoticeFixed(fixed);
		
		noticeService.noticeInsertOne(noticeMemberFileVo, mulRequest);
		
		return "redirect:/noticeBoard/adminList.do";
	}
	
	@RequestMapping(value = "/noticeBoard/adminDetail.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminNoticeDetailView(Model model
			,int noticeIdx) {
		log.info("call adminNoticeDetailView!");
		
		NoticeMemberFileVo noticeVo = noticeService.noticeDetailSelectOne(noticeIdx);
		
		int rNum = noticeService.noticeFindCurrentRow(noticeIdx);
		
		int topIdx = noticeService.noticeFindUpIdx(2);
		int listSize = noticeService.noticeMemberFileList().size();
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
		
		
		return "/noticeBoard/adminNoticeBoardDetailView";
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
		
		
		
		return "redirect:/noticeBoard/adminList.do";
		
	}
	
	@RequestMapping(value = "/noticeBoard/adminNoticeDeleteCtr.do", method = {RequestMethod.GET})
	public String adminNoticeDelete(int noticeIdx, Model model) {
		log.info("call adminNoticeDeleteCtr! " + noticeIdx);
		
		noticeService.noticeDeleteOne(noticeIdx);
		
		return "redirect:/noticeBoard/adminList.do";
	}
	
	
}
