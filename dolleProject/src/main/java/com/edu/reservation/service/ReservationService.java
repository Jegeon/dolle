package com.edu.reservation.service;

import java.util.List;
import java.util.Map;

import com.edu.reservation.vo.ClosedDayVo;
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
	public List<TourVo> tourReservationSelectListAll(String searchOption, String keyword, int start, int end);
	public List<TourVo> tourReservationSelectListPaid(String searchOption, String keyword, int start, int end);
	public List<TourVo> tourReservationSelectListCanceled(String searchOption, String keyword, int start, int end);
	public int tourUpdateOne(Map<String, Object> paramMap);
	public void tourDeleteOne(int tourNo);
	public void tourInsertOne(Map<String, Object> paramMap);
	
	// 아름누나 페이징
	public int reservationSelectTotalCount(String searchOption, String keyword);
	
	// 다중
	public int reservationConfirmList(List<String> checkIdxList);
	public int reservationCancelList(List<String> checkIdxList);
	public int reservationDeleteList(List<String> checkIdxList);
	
	// 휴무일
	public ClosedDayVo tourClosedDaySelectOne();
	public int tourClosedDayUpdateOne(Map<String, Object> paramMap);
	
}	
