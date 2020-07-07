package com.edu.member.dao;

import java.util.List;
import java.util.Map;

import com.edu.member.vo.MemberVo;

public interface MemberDao {

	public List<MemberVo> memberSelectList();
	public MemberVo memberExist(Map<String, Object> paramMap);
	public int memberInsertOne(MemberVo memberVo);
	public MemberVo memberSelectOne(int no);
	public List<MemberVo> memberReservationOne(int no);
	public int memberNickNameList(String nickname);
	public int memberUpdateOne(MemberVo memberVo);
	public int memberDelete(int no);
	public MemberVo memberPaymentSelectOne(int reserveIdx);
	public int memberPaymentUpdateOne(int reserveIdx);
	
}
