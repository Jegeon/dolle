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

import com.edu.noticeBoard.service.NoticeService;
import com.edu.noticeBoard.vo.NoticeMemberFileVo;

@Controller
public class NoticeController {

	private static final Logger log = 
			LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeService noticeService;
	
	
	@RequestMapping(value="/noticeBoard/detail.do", method = RequestMethod.GET)
	public String noticeBoardDetailView(Model model) {
		log.debug(" *** Welcome NoticeBoardDetail View ***");
		
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
		}
		
		model.addAttribute("noticeMemberFileList",noticeMemberFileList);
		model.addAttribute("noticeMemberFileFixedList", tempList);
		
		
		
		return "noticeBoard/noticeBoardListView";
	}
	
}
