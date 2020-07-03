package com.edu.team.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.team.dao.TeamDao;

@Service
public class TeamServiceImpl implements TeamService{

	@Autowired
	public TeamDao teamDao;
	
}
