package com.edu.member.service;

import java.util.List;
import java.util.Map;

import com.edu.member.vo.MemberVo;

public interface MemberService {

	public List<MemberVo> memberSelectList();
	public MemberVo memberExist(Map<String, Object> paramMap);
	public int memberInsertOne(MemberVo memberVo);
	public MemberVo memberSelectOne(int no);
	public List<MemberVo> memberReservationOne();
	public int memberNickNameList(String nickname);
	public int memberUpdateOne(MemberVo memberVo);
	public int memberDelete(int no);
}
