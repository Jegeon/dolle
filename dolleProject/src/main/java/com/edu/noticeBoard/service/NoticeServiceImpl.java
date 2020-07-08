package com.edu.noticeBoard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.edu.noticeBoard.dao.NoticeDao;
import com.edu.noticeBoard.vo.NoticeMemberFileVo;

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


	@Override
	public NoticeMemberFileVo noticeDetailSelectOne(int noticeIdx) {
		// TODO Auto-generated method stub
		
		return noticeDao.noticeDetailSelectOne(noticeIdx);
	}


	@Override
	public int noticeFindUpIdx(int noticeIdx) {
		// TODO Auto-generated method stub
		
		int upIdx = noticeDao.noticeFindUpIdx(noticeIdx);
		
		return upIdx;
	}


	@Override
	public int noticeFindDownIdx(int noticeIdx) {
		// TODO Auto-generated method stub
		
		int downIdx = noticeDao.noticeFindDownIdx(noticeIdx);
		
		return downIdx;
	}


	@Override
	public int noticeFindCurrentRow(int noticeIdx) {
		// TODO Auto-generated method stub
		
		int rNum = noticeDao.noticeFindCurrentRow(noticeIdx);
		
		return rNum;
	}


	@Override
	public void noticeInsertOne(NoticeMemberFileVo noticeMemberFileVo) {
		// TODO Auto-generated method stub
		
		noticeDao.noticeInsertOne(noticeMemberFileVo);
	}


	@Override
	public void noticeUpdateOne(NoticeMemberFileVo noticeMemberFileVo) {
		// TODO Auto-generated method stub
		
		noticeDao.noticeUpdateOne(noticeMemberFileVo);
		
	}


	@Override
	public void noticeDeleteOne(int noticeIdx) {
		// TODO Auto-generated method stub
		
		noticeDao.noticeDeleteOne(noticeIdx);
		
	}




	
	
	
}
