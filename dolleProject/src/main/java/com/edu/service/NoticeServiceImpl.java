package com.edu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.dao.NoticeDao;
import com.edu.vo.NoticeMemberFileVo;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	public NoticeDao noticeDao;


	@Override
	public List<NoticeMemberFileVo> noticeMemberFileList() {
		// TODO Auto-generated method stub
		
		return noticeDao.noticeMemberFileList();
	}


	@Override
	public List<NoticeMemberFileVo> noticeMemberFileFixedList() {
		// TODO Auto-generated method stub
		
		return noticeDao.noticeMemberFileFixedList();
	}
	
}
