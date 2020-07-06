package com.edu.noticeBoard.service;

import java.util.List;

import com.edu.noticeBoard.vo.NoticeMemberFileVo;

public interface NoticeService {

	public List<NoticeMemberFileVo> noticeMemberFileList();
	public List<NoticeMemberFileVo> noticeMemberFileFixedList();
	public NoticeMemberFileVo noticeDetailSelectOne(int noticeIdx);
	public int noticeFindUpIdx(int noticeIdx);
	public int noticeFindDownIdx(int noticeIdx);
	public int noticeFindCurrentRow(int noticeIdx);
}
