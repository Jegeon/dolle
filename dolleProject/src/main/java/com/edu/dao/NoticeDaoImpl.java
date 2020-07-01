package com.edu.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.vo.MemberVo;
import com.edu.vo.NoticeMemberVo;
import com.edu.vo.NoticeVo;

@Repository
public class NoticeDaoImpl implements NoticeDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.edu.";


	@Override
	public List<NoticeMemberVo> noticeMemberList() {
		// TODO Auto-generated method stub
		
		
		return sqlSession.selectList(namespace + "noticeMemberList");
	}
	
}
