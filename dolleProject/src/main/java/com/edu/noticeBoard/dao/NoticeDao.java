package com.edu.noticeBoard.dao;

import java.util.List;

import com.edu.noticeBoard.vo.NoticeMemberFileVo;

public interface NoticeDao {
	
	public List<NoticeMemberFileVo> noticeMemberFileList();
	public List<NoticeMemberFileVo> noticeMemberFileFixedList();
}
