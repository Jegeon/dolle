package com.edu.town.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.edu.town.service.TownService;

@Controller
public class TownController {

	private static final Logger log = 
			LoggerFactory.getLogger(TownController.class);
	
	@Autowired
	private TownService townService;
	
}
