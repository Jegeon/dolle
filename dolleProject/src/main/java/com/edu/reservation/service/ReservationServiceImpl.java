package com.edu.reservation.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.reservation.dao.ReservationDao;
import com.edu.reservation.vo.ClosedDayVo;
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

	@Override
	public List<TourVo> tourReservationSelectList() {
		return reservationDao.tourReservationSelectList();
	}

	@Override
	public List<TourVo> tourReservationSelectListAll(String searchOption, String keyword, int start, int end) {
		return reservationDao.tourReservationSelectListAll(searchOption, keyword, start, end);
	}

	@Override
	public List<TourVo> tourReservationSelectListPaid(String searchOption, String keyword, int start, int end) {
		return reservationDao.tourReservationSelectListPaid(searchOption, keyword, start, end);
	}
	
	@Override
	public List<TourVo> tourReservationSelectListCanceled(String searchOption, String keyword, int start, int end) {
		return reservationDao.tourReservationSelectListCanceled(searchOption, keyword, start, end);
	}
	
	@Override
	public int tourUpdateOne(Map<String, Object> paramMap) {
		return reservationDao.tourUpdateOne(paramMap);
	}

	@Override
	public void tourDeleteOne(int tourNo) {
		reservationDao.tourDeleteOne(tourNo);
	}

	@Override
	public void tourInsertOne(Map<String, Object> paramMap) {
		reservationDao.tourInsertOne(paramMap);
	}
	
	// 아름누나 페이징
	@Override
	public int reservationSelectTotalCount(String searchOption, String keyword) {
		return reservationDao.reservationSelectTotalCount(searchOption, keyword);
	}

	// 다중 시작
	@Override
	public int reservationConfirmList(List<String> checkIdxList) {
		return reservationDao.reservationConfirmList(checkIdxList);
	}

	@Override
	public int reservationCancelList(List<String> checkIdxList) {
		return reservationDao.reservationCancelList(checkIdxList);
	}
	
	@Override
	public int reservationDeleteList(List<String> checkIdxList) {
		return reservationDao.reservationDeleteList(checkIdxList);
	}
	// 다중 끝

	@Override
	public ClosedDayVo tourClosedDaySelectOne() {
		return reservationDao.tourClosedDaySelectOne();
	}

	@Override
	public int tourClosedDayUpdateOne(Map<String, Object> paramMap) {
		return reservationDao.tourClosedDayUpdateOne(paramMap);
	}

}
