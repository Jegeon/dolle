package com.edu.noticeBoard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<NoticeMemberFileVo> noticeMemberFileList(String searchOption, String keyword, int start, int end) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
		return sqlSession.selectList(namespace + "noticeMemberFileList", map);
	}


	@Override
	public List<NoticeMemberFileVo> noticeMemberFileFixedList() {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList(namespace + "noticeMemberFileFixedList");
	}


	@Override
	public NoticeMemberFileVo noticeDetailSelectOne(int noticeIdx) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne(namespace + "noticeDetailSelectOne", noticeIdx);
	}


	@Override
	public int noticeFindUpIdx(int noticeIdx) {
		// TODO Auto-generated method stub
		
		int upIdx = sqlSession.selectOne(namespace + "noticeFindUpIdx", noticeIdx);
		
		return upIdx;
	}


	@Override
	public int noticeFindDownIdx(int noticeIdx) {
		// TODO Auto-generated method stub
		
		int downIdx = sqlSession.selectOne(namespace + "noticeFindDownIdx", noticeIdx);
		
		return downIdx;
	}


	@Override
	public int noticeFindCurrentRow(int noticeIdx) {
		// TODO Auto-generated method stub
		
		int rNum = sqlSession.selectOne(namespace + "noticeFindCurrentRow", noticeIdx);
		
		return rNum;
	}


	@Override
	public void noticeInsertOne(NoticeMemberFileVo noticeMemberFileVo) {
		// TODO Auto-generated method stub
		
		sqlSession.insert(namespace + "noticeInsertOne", noticeMemberFileVo);
	}


	@Override
	public void noticeUpdateOne(NoticeMemberFileVo noticeMemberFileVo) {
		// TODO Auto-generated method stub		
		sqlSession.update(namespace + "noticeUpdateOne", noticeMemberFileVo);
		
	}


	@Override
	public void noticeDeleteOne(int noticeIdx) {
		// TODO Auto-generated method stub
		
		sqlSession.delete(namespace + "noticeDeleteOne", noticeIdx);
	}


	@Override
	public void insertfile(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		sqlSession.insert(namespace + "insertFile", map);
	}


	@Override
	public void deleteFile(int noticeIdx) {
		// TODO Auto-generated method stub
		
		sqlSession.delete(namespace + "deleteFile", noticeIdx);
	}


	@Override
	public Map<String, Object> fileSelectStoredName(int noticeIdx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "fileSelectStoredName", noticeIdx);
	}


	@Override
	public int noticeSelectTotalCount(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne(namespace + "noticeSelectTotalCount", map);
	}






	
	
}
