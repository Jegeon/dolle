package com.edu.reservation.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.reservation.dao.ReservationDao;
import com.edu.reservation.vo.ReservationVo;
import com.edu.reservation.vo.TourVo;

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
	public int tourReservationInsertOne(Map<String, Object> paramMap) {
		return reservationDao.tourReservationInsertOne(paramMap);
	}

	@Override
	public ReservationVo reservationSelectNewestOne() {
		return reservationDao.reservationSelectNewestOne();
	}
	
}
