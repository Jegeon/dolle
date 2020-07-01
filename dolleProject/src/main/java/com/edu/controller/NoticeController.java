package com.edu.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.edu.service.NoticeService;
import com.edu.vo.NoticeMemberFileVo;

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
		
		model.addAttribute("noticeMemberFileList",noticeMemberFileList);
		
		
		return "noticeBoard/noticeBoardListView";
	}
	
}
