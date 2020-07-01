package com.edu.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.dao.NoticeDao;
import com.edu.vo.NoticeMemberVo;
import com.edu.vo.NoticeVo;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	public NoticeDao noticeDao;


	@Override
	public List<NoticeMemberVo> noticeMemberList() {
		// TODO Auto-generated method stub
		
		return noticeDao.noticeMemberList();
	}
	
}
