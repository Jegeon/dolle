package com.edu.town.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.town.dao.TownDao;
import com.edu.town.service.TownService;

@Service
public class TownServiceImpl implements TownService{

	@Autowired
	public TownDao townDao;
	
}
