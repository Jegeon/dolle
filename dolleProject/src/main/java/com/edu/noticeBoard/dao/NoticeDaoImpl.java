package com.edu.noticeBoard.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.noticeBoard.vo.NoticeMemberFileVo;

@Repository
public class NoticeDaoImpl implements NoticeDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.edu.noticeBoard.";


	@Override
	public List<NoticeMemberFileVo> noticeMemberFileList() {
		// TODO Auto-generated method stub
		
		
		return sqlSession.selectList(namespace + "noticeMemberFileList");
	}


	@Override
	public List<NoticeMemberFileVo> noticeMemberFileFixedList() {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList(namespace + "noticeMemberFileFixedList");
	}
	
}
