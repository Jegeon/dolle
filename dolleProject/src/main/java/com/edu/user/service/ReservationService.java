package com.edu.user.service;

import java.util.List;
import java.util.Map;

import com.edu.vo.MemberVo;
import com.edu.user.vo.ReservationVo;
import com.edu.user.vo.TourVo;

public interface ReservationService {

	public List<TourVo> tourSelectList();
	public TourVo tourSelectOne(int tourNo);
	public TourVo tourReservation(int tourNo);
	public TourVo tourReservation(Map<String, Object> paramMap);
	public int tourReservationClear(Map<String, Object> paramMap);
	public ReservationVo reservationSelectNewestOne();
}
