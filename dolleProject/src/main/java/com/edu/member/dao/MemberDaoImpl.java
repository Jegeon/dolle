package com.edu.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.member.vo.MemberVo;

@Repository
public class MemberDaoImpl implements MemberDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.edu.member.";
	
	
	@Override
	public List<MemberVo> memberSelectList(String searchOption, 
			String keyword, int start, int end) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);

		return sqlSession.selectList(namespace + "memberSelectList", map);
	}

	@Override
	public MemberVo memberExist(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne(namespace + "memberExist", paramMap);

	}
	
	@Override
	public int memberUpdateOne(MemberVo memberVo) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "memberUpdateOne"
				, memberVo);
	}

	@Override
	public int memberInsertOne(MemberVo memberVo) {
		// TODO Auto-generated method stub
		
		return sqlSession.insert(namespace + "memberInsertOne",
				memberVo);
	}

	@Override
	public MemberVo memberSelectOne(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "memberSelectOne",
				no);
	}

	@Override
	public int memberDelete(int no) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace + "memberDelete"
				, no);
	}

	@Override
	public int memberNickNameList(String nickname) {
		// TODO Auto-generated method stub
		System.out.println("닉네임 중복체크" + nickname);
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("nickname", nickname);
		
		int result = sqlSession.selectOne(namespace + "memberNickNameList", paramMap);
		return result;
	}

	@Override
	public List<MemberVo> memberReservationOne(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "memberReservationOne", no);
	}

	@Override
	public MemberVo memberPaymentSelectOne(int reserveIdx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "memberPaymentSelectOne",
				reserveIdx);
	}

	@Override
	public int memberPaymentUpdateOne(int reserveIdx) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "memberPaymentUpdateOne",
				reserveIdx);
	}

	@Override
	public MemberVo memberEmailOne(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "memberEmailOne",
				paramMap);
	}

	@Override
	public MemberVo memberPwdOne(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "memberPwdOne",
				paramMap);
	}

	@Override
	public List<MemberVo> memberTourOne(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "memberTourOne", no);
	}

	@Override
	public List<MemberVo> adminSelectList() {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList(namespace + "adminSelectList");
	}

	@Override
	public MemberVo adminSelectOne(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "adminSelectOne",
				no);
	}

	@Override
	public int memberSelectTotalCount(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
				
		paramMap.put("searchOption", searchOption);
		paramMap.put("keyword", keyword);
		
		return sqlSession.selectOne(namespace + "memberSelectTotalCount"
				, paramMap);
	}

	@Override
	public int memberSelectCurPage(String searchOption, String keyword, int no) {
		// TODO Auto-generated method stub
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchOption", searchOption);
		paramMap.put("keyword", keyword);
		paramMap.put("no", no);
			
		return sqlSession.selectOne(namespace 
				+ "memberSelectCurPage", paramMap);
	}

}
