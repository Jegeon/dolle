package com.edu.reservation.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.member.dao.MemberDao;
import com.edu.member.vo.MemberVo;

/**
 * @author TJ
 *
 */
@Service
public class ReservationServiceImpl implements ReservationService{

	@Autowired
	public MemberDao memberDao;
	
	@Override
	public List<MemberVo> memberSelectList() {
		
		return memberDao.memberSelectList();
	}

	@Override
	public MemberVo memberExist(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		
		return memberDao.memberExist(paramMap);
	}

	@Override
	public int memberUpdateOne(MemberVo memberVo) {
		// TODO Auto-generated method stub
		return memberDao.memberUpdateOne(memberVo);
	}

	@Override
	public int memberInsertOne(MemberVo memberVo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public MemberVo memberSelectOne(int no) {
		return null;
	}
	
	@Override
	public int memberDelete(int no) {
		return memberDao.memberDelete(no);
	}

}
