package com.edu.noticeBoard.dao;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.edu.noticeBoard.vo.NoticeMemberFileVo;

public interface NoticeDao {
	
	public List<NoticeMemberFileVo> noticeMemberFileList(String searchOption, String keyword, int start, int end);
	public List<NoticeMemberFileVo> noticeMemberFileFixedList();
	public NoticeMemberFileVo noticeDetailSelectOne(int noticeIdx);
	public int noticeFindUpIdx(int noticeIdx);
	public int noticeFindDownIdx(int noticeIdx);
	public int noticeFindCurrentRow(int noticeIdx);
	public void noticeInsertOne(NoticeMemberFileVo noticeMemberFileVo);
	public void noticeUpdateOne(NoticeMemberFileVo noticeMemberFileVo);
	public void noticeDeleteOne(int noticeIdx);
	public void insertfile(Map<String, Object> map);
	public void deleteFile(int noticeIdx);
	public Map<String, Object> fileSelectStoredName(int noticeIdx);
	public int noticeSelectTotalCount();
}
