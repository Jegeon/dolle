package com.edu.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.vo.MemberVo;

@Repository
public class ReservationDaoImpl implements ReservationDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
}
