package com.edu.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.dao.TeamDao;
import com.edu.vo.TeamVo;

@Service
public class TeamServiceImpl implements TeamService{

	@Autowired
	public TeamDao teamDao;
	
}
