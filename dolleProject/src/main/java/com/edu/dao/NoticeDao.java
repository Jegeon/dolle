package com.edu.dao;

import java.util.List;

import com.edu.vo.NoticeMemberFileVo;

public interface NoticeDao {
	
	public List<NoticeMemberFileVo> noticeMemberFileList();
	public List<NoticeMemberFileVo> noticeMemberFileFixedList();
}
