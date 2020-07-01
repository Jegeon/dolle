package com.edu.service;

import java.util.List;
import java.util.Map;

import com.edu.vo.MemberVo;
import com.edu.vo.ReservationVo;
import com.edu.vo.TourVo;

public interface ReservationService {

	public List<TourVo> tourSelectList();
	public TourVo tourSelectOne(int tourNo);
	public TourVo tourReservation(int tourNo);
	public TourVo tourReservation(Map<String, Object> paramMap);
}
