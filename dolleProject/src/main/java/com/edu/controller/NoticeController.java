package com.edu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.edu.service.NoticeService;
import com.edu.vo.NoticeVo;

@Controller
public class NoticeController {

	private static final Logger log = 
			LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping(value="/noticeBoard/list.do", method = RequestMethod.GET)
	public String noticeBoardListView(Model model) {
		log.debug(" *** Welcome NoticeBoardListView ***");
		
		return "noticeBoard/noticeBoardListView";
	}
	
	@RequestMapping(value="/noticeBoard/detail.do", method = RequestMethod.GET)
	public String noticeBoardDetailView(Model model) {
		log.debug(" *** Welcome NoticeBoardDetail View ***");
		
		return "noticeBoard/noticeBoardDetailView";
	}
	
}
