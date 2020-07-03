package com.edu.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.admin.dao.TestDao;

@Service
public class TestServiceImpl implements TestService{

	@Autowired
	public TestDao testDao;

//	@Override
//	public List<TourVo> tourSelectList() {
//		return reservationDao.tourSelectList();
//	}
//
//	@Override
//	public TourVo tourSelectOne(int tourNo) {
//		return reservationDao.tourSelectOne(tourNo);
//	}

	
}
