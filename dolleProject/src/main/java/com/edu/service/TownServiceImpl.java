package com.edu.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.dao.TownDao;
import com.edu.vo.TownVo;

@Service
public class TownServiceImpl implements TownService{

	@Autowired
	public TownDao townDao;
	
}
