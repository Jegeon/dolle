package com.edu.noticeBoard.service;

import java.util.List;

import com.edu.noticeBoard.vo.NoticeMemberFileVo;

public interface NoticeService {

	public List<NoticeMemberFileVo> noticeMemberFileList();
	public List<NoticeMemberFileVo> noticeMemberFileFixedList();
}
