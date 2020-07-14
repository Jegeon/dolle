package com.edu.team.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.edu.reservation.vo.ClosedDayVo;
import com.edu.team.service.TeamService;

@Controller
public class TeamController {

	private static final Logger log = 
			LoggerFactory.getLogger(TeamController.class);
	
	@Autowired
	private TeamService teamService;
	
	// 단순 이동
	@RequestMapping(value="/team/teamIntroduction.do", method=RequestMethod.GET)
	public String teamIntroduction(Model model) {
		log.debug("Welcome team teamIntroduction");
		
		return "common/teamIntroduction";
	}
}
