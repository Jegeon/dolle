package com.edu.member.dao;

import java.util.List;
import java.util.Map;

import com.edu.member.vo.MemberVo;

public interface MemberDao {

	public List<MemberVo> userList();
	public List<MemberVo> memberSelectList(String searchOption, 
			String keyword, int start, int end);
	public List<MemberVo> adminSelectList();
	public MemberVo memberExist(Map<String, Object> paramMap);
	public int memberInsertOne(MemberVo memberVo);
	public MemberVo memberSelectOne(int no);
	public MemberVo adminSelectOne(int no);
	public List<MemberVo> memberReservationOne(int no);
	public List<MemberVo> reservationListOne(int no, int begin, int end);
	public int reservationTotalCount(int no);
	public int reviewTotalCount(int no);
	public List<MemberVo> memberTourOne(int no);
	public List<MemberVo> tourListOne(int no, int begin, int end);
	public MemberVo memberEmailOne(Map<String, Object> paramMap);
	public MemberVo memberPwdOne(Map<String, Object> paramMap);
	public int memberNickNameList(String nickname);
	public int memberUpdateOne(MemberVo memberVo);
	public int memberDelete(int no);
	public MemberVo memberPaymentSelectOne(int reserveIdx);
	public int memberPaymentUpdateOne(int reserveIdx);
	public int memberSelectTotalCount(String searchOption, String keyword);
	public int memberSelectCurPage(String searchOption, String keyword, int no);
	
}
