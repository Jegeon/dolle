package com.edu.reservation.service;

import java.util.List;
import java.util.Map;

import com.edu.reservation.vo.ReservationVo;
import com.edu.reservation.vo.TourVo;

public interface ReservationService {

	public List<TourVo> tourSelectList();
	public TourVo tourSelectOne(int tourNo);
	public TourVo tourReservation(int tourNo);
	public TourVo tourReservation(Map<String, Object> paramMap);
	public int tourReservationInsertOne(Map<String, Object> paramMap);
	public ReservationVo reservationSelectNewestOne();
	public List<TourVo> tourReservationSelectList();
	public List<TourVo> tourReservationSelectListAll();
	public int tourUpdateOne(Map<String, Object> paramMap);
	public void tourDeleteOne(int tourNo);
	public void tourInsertOne(Map<String, Object> paramMap);
}	
