package com.edu.noticeBoard.dao;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.edu.noticeBoard.vo.NoticeMemberFileVo;

public interface NoticeDao {
	
	public List<NoticeMemberFileVo> noticeMemberFileList();
	public List<NoticeMemberFileVo> noticeMemberFileFixedList();
	public NoticeMemberFileVo noticeDetailSelectOne(int noticeIdx);
	public int noticeFindUpIdx(int noticeIdx);
	public int noticeFindDownIdx(int noticeIdx);
	public int noticeFindCurrentRow(int noticeIdx);
	public void noticeInsertOne(NoticeMemberFileVo noticeMemberFileVo);
	public void noticeUpdateOne(NoticeMemberFileVo noticeMemberFileVo);
	public void noticeDeleteOne(int noticeIdx);
}
