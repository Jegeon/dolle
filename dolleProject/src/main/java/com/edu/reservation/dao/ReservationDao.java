package com.edu.reservation.dao;

import java.util.List;
import java.util.Map;

import com.edu.reservation.vo.ReservationVo;
import com.edu.reservation.vo.TourVo;

public interface ReservationDao {

	public List<TourVo> tourSelectList();
	public TourVo tourSelectOne(int tourNo);
	public TourVo tourSelectAllFromOne(int tourNo);
	public TourVo tourAndReservationSelectAllFromOne(Map<String, Object> paramMap);
	public int tourReservationInsertOne(Map<String, Object> paramMap);
	public ReservationVo reservationSelectNewestOne();
	
	// 관리자 전용 시작
	public List<TourVo> tourReservationSelectList();
	public List<TourVo> tourReservationSelectListAll();
	public int tourUpdateOne(Map<String, Object> paramMap);
	public int tourDeleteOne(int tourNo);
	public int tourInsertOne(Map<String, Object> paramMap);

}
