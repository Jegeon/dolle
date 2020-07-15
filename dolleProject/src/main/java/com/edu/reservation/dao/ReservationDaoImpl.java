package com.edu.reservation.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.reservation.vo.ClosedDayVo;
import com.edu.reservation.vo.ReservationVo;
import com.edu.reservation.vo.TourFileVo;
import com.edu.reservation.vo.TourVo;

@Repository
public class ReservationDaoImpl implements ReservationDao{

	@Autowired
	SqlSessionTemplate sqlSession;

	String namespace = "com.edu.reservation.";
	
	@Override
	public List<TourVo> tourSelectList() {
		return sqlSession.selectList(namespace + "tourSelectList");
	}

	@Override
	public TourFileVo tourSelectOne(int tourNo) {
		return sqlSession.selectOne(namespace + "tourSelectOne", tourNo);
	}

	@Override
	public TourFileVo tourSelectAllFromOne(int tourNo) {
		return sqlSession.selectOne(namespace + "tourSelectAllFromOne", tourNo);
	}

	@Override
	public TourFileVo tourAndReservationSelectAllFromOne(Map<String, Object> paramMap) {
		return sqlSession.selectOne(namespace + "tourAndReservationSelectAllFromOne", paramMap);
	}

	@Override
	public int tourReservationInsertOne(Map<String, Object> paramMap) {
		return sqlSession.insert(namespace + "tourReservationInsertOne", paramMap);
	}

	@Override
	public ReservationVo reservationSelectNewestOne() {
		return sqlSession.selectOne(namespace + "reservationSelectNewestOne");
	}

	@Override
	public List<TourVo> tourReservationSelectList() {
		return sqlSession.selectList(namespace + "tourReservationSelectList");
	}

	@Override
	public List<TourVo> tourReservationSelectListAll(String searchOption, String keyword, int start, int end) {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("start", String.valueOf(start));
		paramMap.put("end", String.valueOf(end));
		paramMap.put("searchOption", searchOption);
		paramMap.put("keyword", keyword);
		
		return sqlSession.selectList(namespace + "tourReservationSelectListAll", paramMap);
	}

	@Override
	public List<TourVo> tourReservationSelectListPaid(String searchOption, String keyword, int start, int end) {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("start", String.valueOf(start));
		paramMap.put("end", String.valueOf(end));
		paramMap.put("searchOption", searchOption);
		paramMap.put("keyword", keyword);
		return sqlSession.selectList(namespace + "tourReservationSelectListPaid", paramMap);
	}
	
	@Override
	public List<TourVo> tourReservationSelectListCanceled(String searchOption, String keyword, int start, int end) {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("start", String.valueOf(start));
		paramMap.put("end", String.valueOf(end));
		paramMap.put("searchOption", searchOption);
		paramMap.put("keyword", keyword);
		return sqlSession.selectList(namespace + "tourReservationSelectListCanceled", paramMap);
	}
	
	@Override
	public int tourUpdateOne(Map<String, Object> paramMap) {
		return sqlSession.update(namespace + "tourUpdateOne", paramMap);
	}

	@Override
	public int tourDeleteOne(int tourNo) {
		return sqlSession.update(namespace + "tourDeleteOne", tourNo);
	}

	@Override
	public int tourInsertOne(Map<String, Object> paramMap) {
		return sqlSession.update(namespace + "tourInsertOne", paramMap);
	}

	// 아름누나 페이징
	@Override
	public int reservationSelectTotalCount(String searchOption, String keyword) {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchOption", searchOption);
		paramMap.put("keyword", keyword);
		
		return sqlSession.selectOne(namespace + "reservationSelectTotalCount", paramMap);
	}

	@Override
	public int reservationConfirmList(List<String> checkIdxList) {
		System.out.println("Dao reservationConfirmList 접근중"+ checkIdxList.get(0));
		return sqlSession.delete(namespace + "reservationConfirmList", checkIdxList);
	}

	@Override
	public int reservationCancelList(List<String> checkIdxList) {
		System.out.println("Dao reservationCancelList 접근중"+ checkIdxList.get(0));
		return sqlSession.delete(namespace + "reservationCancelList", checkIdxList);
	}
	
	@Override
	public int reservationDeleteList(List<String> checkIdxList) {
		System.out.println("Dao reservationDeleteList 접근중"+ checkIdxList.get(0));
		return sqlSession.delete(namespace + "reservationDeleteList", checkIdxList);
	}

	@Override
	public ClosedDayVo tourClosedDaySelectOne() {
		return sqlSession.selectOne(namespace + "tourClosedDaySelectOne");
	}

	@Override
	public int tourClosedDayUpdateOne(Map<String, Object> paramMap) {
		return sqlSession.update(namespace + "tourClosedDayUpdateOne", paramMap);
	}
	
	// 아름 파일
	// fileInsertOne
	@Override
	public int fileInsertOne(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace + "fileInsertOne", map);
	}
	// reviewNewestSelectIdx
	@Override
	public int tourNewestSelectIdx() {
		return sqlSession.selectOne(namespace + "tourNewestSelectIdx");
	}
	@Override
	public int fileDeleteOne(int fileIdx) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace + "fileDeleteOne", fileIdx);
	}

	@Override
	public Map<String, Object> fileSelectStoredName(int tourIdx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "fileSelectStoredName", tourIdx);
	}
	@Override
	public int fileUpdateOne(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "fileUpdateOne", map);
	}
}
