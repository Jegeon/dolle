package com.edu.noticeBoard.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.edu.noticeBoard.vo.NoticeMemberFileVo;

public interface NoticeService {

	public List<NoticeMemberFileVo> noticeMemberFileList(int start, int end);
	public List<NoticeMemberFileVo> noticeMemberFileFixedList();
	public NoticeMemberFileVo noticeDetailSelectOne(int noticeIdx);
	public int noticeFindUpIdx(int noticeIdx);
	public int noticeFindDownIdx(int noticeIdx);
	public int noticeFindCurrentRow(int noticeIdx);
	public void noticeInsertOne(NoticeMemberFileVo noticeMemberFileVo
		, MultipartHttpServletRequest mulRequest);
	public void noticeUpdateOne(NoticeMemberFileVo noticeMemberFileVo, 
		MultipartHttpServletRequest mulRequest, int fileIdx);
	public void noticeDeleteOne(int noticeIdx);
	public int noticeSelectTotalCount();
}
