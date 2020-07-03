package com.edu.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.dao.ReservationDao;
import com.edu.vo.ReservationVo;
import com.edu.vo.TourVo;

@Service
public class ReservationServiceImpl implements ReservationService{

	@Autowired
	public ReservationDao reservationDao;

	@Override
	public List<TourVo> tourSelectList() {
		return reservationDao.tourSelectList();
	}

	@Override
	public TourVo tourSelectOne(int tourNo) {
		return reservationDao.tourSelectOne(tourNo);
	}

	@Override
	public TourVo tourReservation(int tourNo) {
		return reservationDao.tourSelectAllFromOne(tourNo);
	}

	@Override
	public TourVo tourReservation(Map<String, Object> paramMap) {
		return reservationDao.tourAndReservationSelectAllFromOne(paramMap);
	}

	@Override
	public int tourReservationClear(Map<String, Object> paramMap) {
		return reservationDao.reservationInsertOne(paramMap);
	}

	@Override
	public ReservationVo reservationSelectNewestOne() {
		return reservationDao.reservationSelectNewestOne();
	}
	
}
