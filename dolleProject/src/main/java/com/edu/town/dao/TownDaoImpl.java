package com.edu.town.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.town.dao.TownDao;

@Repository
public class TownDaoImpl implements TownDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
}
