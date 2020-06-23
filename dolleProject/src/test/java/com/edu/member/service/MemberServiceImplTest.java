package com.edu.member.service;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.edu.member.vo.MemberVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		"file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class MemberServiceImplTest {

	@Autowired
	MemberServiceImpl memberServiceImpl; 
	
	// 
	/**
	 * 회원등록 및 조회가 이루어 지는지 테스트
	 * 결과1: 새로 추가한 회원의 비밀번호는 암호화 된다.
	 * 결과2: 추가한 회원의 비밀번호가 암호화 되었는지 확인 
	 * 결과3: 비빌번호 일치 여부 확인 
	 */
	@Test
	public void testMemberInsertOne() {
		// TODO Auto-generated method stub
		
		// 새로운 회원정보 입력
		
		// 등록확인
		
		
		// 등록한 회원 가져오기
		
		
		// 비밀번호 변경 확인
		
		
				
		// 암호 복호화		
		
		
		// 처음 입력한 비밀번호와 복구한 비밀번호가 일치하는지 확인
		
		
	}
	
}
