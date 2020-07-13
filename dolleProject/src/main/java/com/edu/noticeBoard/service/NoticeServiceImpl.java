package com.edu.noticeBoard.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.edu.noticeBoard.dao.NoticeDao;
import com.edu.noticeBoard.vo.NoticeFileUtils;
import com.edu.noticeBoard.vo.NoticeMemberFileVo;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	private static final Logger log =
			LoggerFactory.getLogger(NoticeServiceImpl.class);
	
	@Autowired
	public NoticeDao noticeDao;

	@Resource(name="noticeFileUtils")
	private NoticeFileUtils noticeFileUtils; 
	
	@Override
	public List<NoticeMemberFileVo> noticeMemberFileList(String searchOption, String keyword, int start, int end) {
		// TODO Auto-generated method stub
		
		return noticeDao.noticeMemberFileList(searchOption, keyword, start, end);
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
	public void noticeInsertOne(NoticeMemberFileVo noticeMemberFileVo
		, MultipartHttpServletRequest mulRequest) {
		// TODO Auto-generated method stub
		
		noticeDao.noticeInsertOne(noticeMemberFileVo);
		
		
		int noticeIdx = noticeMemberFileVo.getNoticeIdx();
		
		try {
			List<Map<String, Object>> fileList;
			fileList = noticeFileUtils.parseInsertFileInfo(noticeIdx
				, mulRequest);
			for (int i = 0; i < fileList.size(); i++) {
				log.info("----------------------------------------");
				log.info(fileList.toString());
				log.info("----------------------------------------");
				noticeDao.insertfile(fileList.get(i));
			}
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	@Override
	public void noticeUpdateOne(NoticeMemberFileVo noticeMemberFileVo
			, MultipartHttpServletRequest mulRequest
			, int fileIdx) {
		// TODO Auto-generated method stub
		
		int noticeIdx = noticeMemberFileVo.getNoticeIdx();
		try {
			Map<String, Object> tempFileMap = noticeDao.fileSelectStoredName(noticeIdx);

			List<Map<String, Object>> fileList = noticeFileUtils.parseInsertFileInfo(noticeIdx, mulRequest);

			if (fileList.isEmpty() == false) {

				if (tempFileMap != null) {
					noticeDao.deleteFile(noticeIdx);

					for (Map<String, Object> map : fileList) {
						noticeDao.insertfile(map);
					}

					noticeFileUtils.parseUpdateFileInfo(tempFileMap);
				}else if(tempFileMap == null) {
					
					for (Map<String, Object> map : fileList) {
						noticeDao.insertfile(map);
					}

					noticeFileUtils.parseUpdateFileInfo(tempFileMap);
				}

			} else if (fileIdx == -1) {

			}
			noticeDao.noticeUpdateOne(noticeMemberFileVo);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
	}
	

	@Override
	public void noticeDeleteOne(int noticeIdx) {
		// TODO Auto-generated method stub
		noticeDao.deleteFile(noticeIdx);
		noticeDao.noticeDeleteOne(noticeIdx);
	}


	@Override
	public int noticeSelectTotalCount() {
		// TODO Auto-generated method stub
		
		return noticeDao.noticeSelectTotalCount();
	}




	
	
	
}
