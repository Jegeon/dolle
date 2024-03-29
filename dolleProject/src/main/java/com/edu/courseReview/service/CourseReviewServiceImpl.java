package com.edu.courseReview.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.edu.courseReview.dao.CourseReviewDao;
import com.edu.courseReview.vo.CommentVo;
import com.edu.courseReview.vo.CourseReviewMemberCommentFileVo;
import com.edu.courseReview.vo.CourseReviewVo;
import com.edu.courseReview.vo.ReviewFileUtils;

@Service
public class CourseReviewServiceImpl implements CourseReviewService{

	@Autowired
	public CourseReviewDao courseReviewDao;

	@Resource(name="reviewFileUtils")
	private ReviewFileUtils reviewFileUtils;
		
	@Override
	public List<CourseReviewMemberCommentFileVo> reviewSelectList(String orderOption
			, String searchOption, String keyword, int start, int end) {
		// TODO Auto-generated method stub
		return courseReviewDao.reviewSelectList(orderOption, searchOption, keyword, start, end);
	}
	
	@Override
	public CourseReviewMemberCommentFileVo reviewSelectOne(int reviewIdx) {
		// TODO Auto-generated method stub
		//조회 수 증가 
		courseReviewDao.reviewIncreaseReadCount(reviewIdx);
		
		return courseReviewDao.reviewSelectOne(reviewIdx);
	}

	//이전글 다음글
	@Override
	public int reviewMovePageOne(int rnum, int channel) {
		// TODO Auto-generated method stub
		return courseReviewDao.reviewMovePageOne(rnum, channel);
	}
	
	@Override
	public void courseReviewInsertOne(CourseReviewVo reviewVo
			, MultipartHttpServletRequest multipartHttpServletRequest) {
		// TODO Auto-generated method stub
		courseReviewDao.courseReviewInsertOne(reviewVo);
		
		int newestIdx = courseReviewDao.reviewNewestSelectIdx();
		
		int reviewIdx = newestIdx;
		System.out.println("**************reviewIdx"+reviewIdx+"************");
		try {
			List<Map<String, Object>> fileList = 
				reviewFileUtils.parseInsertFileInfo(reviewIdx
					, multipartHttpServletRequest);
			
			for (int i = 0; i < fileList.size(); i++) {
				courseReviewDao.fileInsertOne(fileList.get(i));
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("문제 생기면 처리할꺼 정하자");
			System.out.println("일단 여긴 파일 처리 중 문제 발생한 거야");
			e.printStackTrace();
		}
		
	}


	@Override
	public int reviewNewestSelectIdx() {
		// TODO Auto-generated method stub
		return courseReviewDao.reviewNewestSelectIdx();
	}
	
	
	
	@Override
	public void courseReviewUpdateOne(CourseReviewVo reviewVo
			, MultipartHttpServletRequest multipartHttpServletRequest
			, int fileIdx) {
		// TODO Auto-generated method stub
		
		
		int reviewIdx = reviewVo.getReviewIdx();
		System.out.println("**************reviewIdx"+reviewIdx+"************");
		try {
			Map<String, Object> tempFileMap 
			= courseReviewDao.fileSelectStoredName(reviewIdx);
			
			System.out.println(tempFileMap.get("REVIEW_STORED_FILE_NAME"));
			
			List<Map<String, Object>> fileList = 
				reviewFileUtils.parseInsertFileInfo(reviewIdx
					, multipartHttpServletRequest);
			
			// 오로지 하나만 관리 수정
			if(fileList.isEmpty() == false) {
				System.out.println("0");
				
				if(tempFileMap != null) {
					System.out.println("1");
					courseReviewDao.fileDeleteOne(reviewIdx);
					
					for (Map<String, Object> map : fileList) {
						System.out.println("4");
						courseReviewDao.fileInsertOne(map);
					}
					
					System.out.println("5");
					reviewFileUtils.parseUpdateFileInfo(tempFileMap);
					System.out.println("6");
				}
				
			}else if(fileIdx == -1) {
				System.out.println("2");
				if(tempFileMap != null) {
					System.out.println("3");
//					courseReviewDao.fileDeleteOne(reviewIdx);
					
					//파일입력이 없으면 기본 사진
//					List<Map<String, Object>> basicFile = 
//							reviewFileUtils.parseInsertFileInfo(reviewIdx
//								, multipartHttpServletRequest);
//					courseReviewDao.fileInsertOne(basicFile.get(0));
//					reviewFileUtils.parseUpdateFileInfo(tempFileMap);
					
					System.out.println(tempFileMap.get("REVIEW_STORED_FILE_NAME"));
				}
			}
			courseReviewDao.courseReviewUpdateOne(reviewVo);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("문제 생기면 처리할꺼 정하자");
			System.out.println("일단 여긴 파일 처리 중 문제 발생한 거야");
			e.printStackTrace();
		}
	}
	
	@Override
	public int fileUpdateOne(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return courseReviewDao.fileUpdateOne(map);
	}
	
	
	
	@Override
	public void courseReviewDeleteOne(int reviewIdx) {
		// TODO Auto-generated method stub
		courseReviewDao.fileDeleteOne(reviewIdx);
		courseReviewDao.commentDeleteTogether(reviewIdx);
		courseReviewDao.courseReviewDeleteOne(reviewIdx);
	}

	@Override
	public Map<String, Object> fileSelectStoredName(int reviewIdx) {
		// TODO Auto-generated method stub
		return courseReviewDao.fileSelectStoredName(reviewIdx);
	}

	@Override
	public int reviewSelectTotalCount(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		return courseReviewDao.reviewSelectTotalCount(searchOption, keyword);
	}

	
	//댓글
	@Override
	public int commentInsertOne(CommentVo commentVo) {
		// TODO Auto-generated method stub
		return courseReviewDao.commentInsertOne(commentVo);
	}

	@Override
	public List<CommentVo> commentSelectList(int reviewIdx, int start, int end) {
		// TODO Auto-generated method stub
		return courseReviewDao.commentSelectList(reviewIdx, start, end);
	}

	@Override
	public int commentDeleteOne(int commentIdx, int commentMemberIdx) {
		// TODO Auto-generated method stub
		return courseReviewDao.commentDeleteOne(commentIdx, commentMemberIdx);
	}

	@Override
	public int commentUpdateOne(CommentVo commentVo) {
		// TODO Auto-generated method stub
		return courseReviewDao.commentUpdateOne(commentVo);
	}

	@Override
	public int courseReviewDeleteList(List<String> reviewIdxList) {
		// TODO Auto-generated method stub
		courseReviewDao.commentDeleteList(reviewIdxList);
		courseReviewDao.fileDeleteList(reviewIdxList);
		return courseReviewDao.courseReviewDeleteList(reviewIdxList);
	}

	@Override
	public int reviewFindRNum(int reviewIdx) {
		// TODO Auto-generated method stub
		return courseReviewDao.reviewFindRNum(reviewIdx);
	}

	@Override
	public int reviewFindLastRowNum() {
		// TODO Auto-generated method stub
		return courseReviewDao.reviewFindLastRowNum();
	}

	@Override
	public int commentSelectTotalCount(int reviewIdx) {
		// TODO Auto-generated method stub
		return courseReviewDao.commentSelectTotalCount(reviewIdx);
	}

	@Override
	public List<String> reviewFindReadCount(List<String> reviewIdxList) {
		// TODO Auto-generated method stub
		return courseReviewDao.reviewFindReadCount(reviewIdxList);
	}

	@Override
	public List<String> reviewFindCmtNum(List<String> reviewIdxList) {
		// TODO Auto-generated method stub
		return courseReviewDao.reviewFindCmtNum(reviewIdxList);
	}

	
	
	
	

	
}
