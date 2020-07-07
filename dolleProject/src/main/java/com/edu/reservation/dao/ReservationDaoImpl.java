package com.edu.reservation.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.reservation.vo.ReservationVo;
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
	public TourVo tourSelectOne(int tourNo) {
		return sqlSession.selectOne(namespace + "tourSelectOne", tourNo);
	}

	@Override
	public TourVo tourSelectAllFromOne(int tourNo) {
		return sqlSession.selectOne(namespace + "tourSelectAllFromOne", tourNo);
	}

	@Override
	public TourVo tourAndReservationSelectAllFromOne(Map<String, Object> paramMap) {
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
	
}
