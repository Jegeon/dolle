package com.edu.reservation.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.edu.reservation.dao.ReservationDao;
import com.edu.reservation.vo.ClosedDayVo;
import com.edu.reservation.vo.ReservationVo;
import com.edu.reservation.vo.TourFileUtils;
import com.edu.reservation.vo.TourFileVo;
import com.edu.reservation.vo.TourVo;

@Service
public class ReservationServiceImpl implements ReservationService{

	@Autowired
	public ReservationDao reservationDao;
	
	@Resource(name="tourFileUtils")
	private TourFileUtils tourFileUtils;

	@Override
	public List<TourVo> tourSelectList() {
		return reservationDao.tourSelectList();
	}

	@Override
	public TourFileVo tourSelectOne(int tourNo) {
		return reservationDao.tourSelectOne(tourNo);
	}

	@Override
	public TourFileVo tourReservation(int tourNo) {
		return reservationDao.tourSelectAllFromOne(tourNo);
	}

	@Override
	public TourFileVo tourReservation(Map<String, Object> paramMap) {
		return reservationDao.tourAndReservationSelectAllFromOne(paramMap);
	}

	@Override
	public int tourReservationInsertOne(Map<String, Object> paramMap) {
		return reservationDao.tourReservationInsertOne(paramMap);
	}

	@Override
	public ReservationVo reservationSelectNewestOne() {
		return reservationDao.reservationSelectNewestOne();
	}

	@Override
	public List<TourVo> tourReservationSelectList() {
		return reservationDao.tourReservationSelectList();
	}

	@Override
	public List<TourVo> tourReservationSelectListAll(String searchOption, String keyword, int start, int end) {
		return reservationDao.tourReservationSelectListAll(searchOption, keyword, start, end);
	}

	@Override
	public List<TourVo> tourReservationSelectListPaid(String searchOption, String keyword, int start, int end) {
		return reservationDao.tourReservationSelectListPaid(searchOption, keyword, start, end);
	}
	
	@Override
	public List<TourVo> tourReservationSelectListCanceled(String searchOption, String keyword, int start, int end) {
		return reservationDao.tourReservationSelectListCanceled(searchOption, keyword, start, end);
	}
	
	@Override
	public void tourUpdateOne(Map<String, Object> paramMap, MultipartHttpServletRequest multipartHttpServletRequest
			, int fileIdx) {
		
		int tourIdx = (int) paramMap.get("tourNo");
		System.out.println(tourIdx);
		try {
			Map<String, Object> tempFileMap 
			= reservationDao.fileSelectStoredName(tourIdx);
			
			System.out.println(tempFileMap.get("TOUR_STORED_FILE_NAME"));
			
			List<Map<String, Object>> fileList = 
				tourFileUtils.parseInsertFileInfo(tourIdx
					, multipartHttpServletRequest);
			
			// 오로지 하나만 관리 수정
			if(fileList.isEmpty() == false) {
				System.out.println("0");
				
				if(tempFileMap != null) {
					System.out.println("1");
					reservationDao.fileDeleteOne(tourIdx);
					
					for (Map<String, Object> map : fileList) {
						System.out.println("4");
						reservationDao.fileInsertOne(map);
					}
					
					System.out.println("5");
					tourFileUtils.parseUpdateFileInfo(tempFileMap);
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
					
					System.out.println(tempFileMap.get("TOUR_STORED_FILE_NAME"));
				}
			}
			reservationDao.tourUpdateOne(paramMap);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("문제 생기면 처리할꺼 정하자");
			System.out.println("일단 여긴 파일 처리 중 문제 발생한 거야");
			e.printStackTrace();
		}
	}

	@Override
	public void tourDeleteOne(int tourIdx) {
		// 걱정되는 부분 원래는 tourNo였음
		reservationDao.fileDeleteOne(tourIdx);
		reservationDao.tourDeleteOne(tourIdx);
	}

	@Override
	public void tourInsertOne(Map<String, Object> paramMap
			, MultipartHttpServletRequest multipartHttpServletRequest) {
		reservationDao.tourInsertOne(paramMap);
		
		int newestIdx = reservationDao.tourNewestSelectIdx();
		
		int tourIdx = newestIdx;
		System.out.println("**************tourIdx"+tourIdx+"************");
		try {
			List<Map<String, Object>> fileList = 
				tourFileUtils.parseInsertFileInfo(tourIdx
					, multipartHttpServletRequest);
			
			for (int i = 0; i < fileList.size(); i++) {
				reservationDao.fileInsertOne(fileList.get(i));
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("문제 생기면 처리할꺼 정하자");
			System.out.println("일단 여긴 파일 처리 중 문제 발생한 거야");
			e.printStackTrace();
		}
	}
	
	// 아름누나 페이징
	@Override
	public int reservationSelectTotalCount(String searchOption, String keyword) {
		return reservationDao.reservationSelectTotalCount(searchOption, keyword);
	}

	// 다중 시작
	@Override
	public int reservationConfirmList(List<String> checkIdxList) {
		return reservationDao.reservationConfirmList(checkIdxList);
	}

	@Override
	public int reservationCancelList(List<String> checkIdxList) {
		return reservationDao.reservationCancelList(checkIdxList);
	}
	
	@Override
	public int reservationDeleteList(List<String> checkIdxList) {
		return reservationDao.reservationDeleteList(checkIdxList);
	}
	// 다중 끝

	@Override
	public ClosedDayVo tourClosedDaySelectOne() {
		return reservationDao.tourClosedDaySelectOne();
	}

	@Override
	public int tourClosedDayUpdateOne(Map<String, Object> paramMap) {
		return reservationDao.tourClosedDayUpdateOne(paramMap);
	}
	
	// 아름 파일
	// reviewNewestSelectIdx
	@Override
	public int tourNewestSelectIdx() {
		// TODO Auto-generated method stub
		return reservationDao.tourNewestSelectIdx();
	}
	
	@Override
	public Map<String, Object> fileSelectStoredName(int tourIdx) {
		// TODO Auto-generated method stub
		return reservationDao.fileSelectStoredName(tourIdx);
	}

	@Override
	public int fileUpdateOne(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return reservationDao.fileUpdateOne(map);
	}

}
