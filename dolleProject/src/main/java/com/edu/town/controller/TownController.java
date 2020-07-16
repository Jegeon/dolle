package com.edu.town.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.edu.town.service.TownService;

@Controller
public class TownController {

	private static final Logger log = 
			LoggerFactory.getLogger(TownController.class);
	
	@Autowired
	private TownService townService;
	
	@RequestMapping(value="/town/nineInfo.do", method = RequestMethod.GET)
	public String townNineInfoView(Model model) {
		
		return "town/nineTownInfoView";
	}
	
	@RequestMapping(value="/town/nineInfoDetail.do", method = RequestMethod.GET)
	public String townNineInfoDetailView(Model model
			,@RequestParam(defaultValue = "intro") String menu) {
		
		model.addAttribute("menu",menu);
		
		return "town/nineTownInfoDetailView";
	}
	
	@RequestMapping(value="/town/castleTownInfo.do", method = RequestMethod.GET)
	public String castleTownInfoView(Model model) {
		
		
		return "town/castleTownInfoView";
	}
	
}
