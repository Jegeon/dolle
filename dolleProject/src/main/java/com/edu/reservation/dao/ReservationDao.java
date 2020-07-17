package com.edu.reservation.dao;

import java.util.List;
import java.util.Map;

import com.edu.reservation.vo.ClosedDayVo;
import com.edu.reservation.vo.ReservationVo;
import com.edu.reservation.vo.TourFileVo;
import com.edu.reservation.vo.TourVo;

public interface ReservationDao {

	public List<TourVo> tourSelectList();
	public TourFileVo tourSelectOne(int tourNo);
	public TourFileVo tourSelectAllFromOne(int tourNo);
	public TourFileVo tourAndReservationSelectAllFromOne(Map<String, Object> paramMap);
	public int tourReservationInsertOne(Map<String, Object> paramMap);
	public ReservationVo reservationSelectNewestOne();
	
	// 관리자 전용 시작
	public List<TourVo> tourReservationSelectList();
	public List<TourVo> tourReservationSelectListAll(String searchOption, String keyword, int start, int end);
	public List<TourVo> tourReservationSelectListPaid(String searchOption, String keyword, int start, int end);
	public List<TourVo> tourReservationSelectListCanceled(String searchOption, String keyword, int start, int end);
	
	// 관리자 CRUD
	public int tourUpdateOne(Map<String, Object> paramMap);
	public int tourDeleteOne(int tourNo);
	public int tourInsertOne(Map<String, Object> paramMap);

	// 아름누나 페이징
	public int reservationSelectTotalCount(String searchOption, String keyword);
	public int reservationSelectTotalCountPaid(String searchOption, String keyword);
	public int reservationSelectTotalCountCanceled(String searchOption, String keyword);
	
	// 다중 승인
	public int reservationConfirmList(List<String> checkIdxList);
	public int reservationCancelList(List<String> checkIdxList);
	public int reservationDeleteList(List<String> checkIdxList);
	
	// 휴무일
	public ClosedDayVo tourClosedDaySelectOne();
	public int tourClosedDayUpdateOne(Map<String, Object> paramMap);
	
	// 아름누나 파일 기술
	// reviewNewestSelectIdx();
	public int tourNewestSelectIdx();
	public int fileInsertOne(Map<String, Object> map);
	public int fileUpdateOne(Map<String, Object> map);
	public Map<String, Object> fileSelectStoredName(int tourIdx);
	public int fileDeleteOne(int tourIdx);
}
