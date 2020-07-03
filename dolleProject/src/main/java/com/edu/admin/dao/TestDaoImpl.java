package com.edu.admin.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.vo.MemberVo;

@Repository
public class TestDaoImpl implements TestDao{

	@Autowired
	SqlSessionTemplate sqlSession;

	String namespace = "com.edu.reservation.";
	
//	@Override
//	public List<TourVo> tourSelectList() {
//		return sqlSession.selectList(namespace + "tourSelectList");
//	}
//
//	@Override
//	public TourVo tourSelectOne(int tourNo) {
//		return sqlSession.selectOne(namespace + "tourSelectOne", tourNo);
//	}

	
}
