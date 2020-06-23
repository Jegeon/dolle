package com.edu.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.dao.ReservationDao;
import com.edu.vo.ReservationVo;

@Service
public class ReservationServiceImpl implements ReservationService{

	@Autowired
	public ReservationDao reservationDao;
	
}
