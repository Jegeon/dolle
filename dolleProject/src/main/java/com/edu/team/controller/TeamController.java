package com.edu.team.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.edu.team.service.TeamService;

@Controller
public class TeamController {

	private static final Logger log = 
			LoggerFactory.getLogger(TeamController.class);
	
	@Autowired
	private TeamService teamService;
	
}
