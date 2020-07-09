package com.edu.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.member.dao.MemberDao;
import com.edu.member.vo.MemberVo;

@Service
public class MemberServiceImpl implements MemberService{

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
		return memberDao.memberInsertOne(memberVo);
	}
	
	@Override
	public MemberVo memberSelectOne(int no) {
		return memberDao.memberSelectOne(no);
	}
	
	@Override
	public int memberDelete(int no) {
		return memberDao.memberDelete(no);
	}

	@Override
	public int memberNickNameList(String nickname) {
		// TODO Auto-generated method stub
		return memberDao.memberNickNameList(nickname);
	}

	@Override
	public List<MemberVo> memberReservationOne(int no) {
		// TODO Auto-generated method stub
		return memberDao.memberReservationOne(no);
	}

	@Override
	public MemberVo memberPaymentSelectOne(int reserveIdx) {
		// TODO Auto-generated method stub
		return memberDao.memberPaymentSelectOne(reserveIdx);
	}

	@Override
	public int memberPaymentUpdateOne(int reserveIdx) {
		// TODO Auto-generated method stub
		return memberDao.memberPaymentUpdateOne(reserveIdx);
	}

	@Override
	public MemberVo memberEmailOne(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return memberDao.memberEmailOne(paramMap);
	}

	@Override
	public MemberVo memberPwdOne(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return memberDao.memberPwdOne(paramMap);
	}

}
