package com.edu.reservation.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Date;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.edu.reservation.service.ReservationService;
import com.edu.reservation.vo.ReservationVo;
import com.edu.reservation.vo.TourVo;

@Controller
public class ReservationController {

	private static final Logger log = 
			LoggerFactory.getLogger(ReservationController.class);
	
	@Autowired
	private ReservationService reservationService;
	
	// 투어 전체 조회 화면
	@RequestMapping(value="/reservation/list.do", method=RequestMethod.GET)
	public String tourList(Model model) {
		log.debug("Welcome reservation tourList");
		List<TourVo> tourList = reservationService.tourSelectList();
		model.addAttribute("tourList", tourList);
		return "reservation/tourListView";
	}
	
	// 투어 상세 조회 화면
	@RequestMapping(value="/reservation/listOne.do", method=RequestMethod.GET)
	public String tourListOne(int tourNo, Model model) {
		log.debug("Welcome reservation tourListOne - {}", tourNo);
		TourVo tourVo = reservationService.tourSelectOne(tourNo);
		model.addAttribute("tourVo", tourVo);
		return "reservation/tourListOneView";
	}
	
	// 투어 예약 화면 (날짜 미선택)
	@RequestMapping(value="/reservation/reservation.do", method=RequestMethod.GET)
	public String tourReservation(int tourNo, Model model) {
		log.debug("Welcome reservation tourReservation - {}", tourNo);
		TourVo tourVo = reservationService.tourReservation(tourNo);
		model.addAttribute("tourVo", tourVo);
		return "reservation/tourReservationView";
	}
	
	// 투어 예약 화면 (날짜 선택)
	@RequestMapping(value="/reservation/reservationWithDate.do", method=RequestMethod.GET)
	public String tourReservation(int tourNo, String reserveTourDate, Model model) {
		log.debug("Welcome reservation tourReservationWithDate - {} {}", tourNo, reserveTourDate);
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("tourNo", tourNo);
		paramMap.put("reserveTourDate", reserveTourDate);
		TourVo tourVo = reservationService.tourReservation(paramMap);
		
		model.addAttribute("tourVo", tourVo);
		
		return "reservation/tourReservationWithDateView";
	}
	
	// 투어 예약 화면 (날짜 선택) 에서 입력한 input 2개 (selectedDateInput, selectedTourPeopleNumInput) 로 insert
	@RequestMapping(value="/reservation/reservationForm.do", method=RequestMethod.POST)
	public String tourReservationInsert(int tourNo, String memberNo, String reserveTourDate, int reserveApplyNum, int reservePrice, Model model) {
		log.debug("reservationForm이 수행되었습니다 tourNo"+ tourNo +"memberNo"+ memberNo);
		log.debug("Welcome reservation insert");
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("tourNo", tourNo);
		paramMap.put("memberNo", memberNo);
		paramMap.put("reserveTourDate", reserveTourDate);
		paramMap.put("reserveApplyNum", reserveApplyNum);
		paramMap.put("reservePrice", reservePrice);
		
		reservationService.tourReservationInsertOne(paramMap);
		
		model.addAttribute("tourNo",tourNo);
		model.addAttribute("memberNo",memberNo);
		model.addAttribute("reserveTourDate", reserveTourDate);
		model.addAttribute("reserveApplyNum",reserveApplyNum);
		model.addAttribute("reservePrice",reservePrice);
		
		return "redirect:/reservation/reservationCompleteShow.do";
	}
	
	// 투어 예약 완료 화면
	@RequestMapping(value="/reservation/reservationCompleteShow.do", method=RequestMethod.GET)
	public String tourReservationClear(@RequestParam(defaultValue = "0") int tourNo, String memberNo, String reserveTourDate
			,@RequestParam(defaultValue = "0") int reserveApplyNum, Model model) {
		System.out.println("reservationCompleteShow가 수행되었습니다 tourNo"+ tourNo +"memberNo"+ memberNo+ "reserveApplyNum"+reserveApplyNum);
		log.debug("Welcome reservation clear - "+ reserveTourDate+ reserveApplyNum);
		ReservationVo reservationVo = reservationService.reservationSelectNewestOne();
		
		model.addAttribute("reservationVo", reservationVo);
		// tourVo 정보를 받아오기 위해 select
		TourVo tourVo = reservationService.tourSelectOne(tourNo);
		model.addAttribute("tourVo", tourVo);
		
		return "reservation/tourReservationCompleteShowView";
	}
	
	// 여기부터 관리자 영역
	// [관리자] 투어 예약 일정 조회 달력 화면
	@RequestMapping(value="/reservation/reservationSchedule.do", method=RequestMethod.GET)
	public String tourReservationSchedule(Model model) {
		log.debug("Welcome reservation tourReservationSchedule");
		List<TourVo> tourReservationList = reservationService.tourReservationSelectList();
		model.addAttribute("tourReservationList", tourReservationList);
		
		// 투어 시간을 가져오기 위해 tourSelectList() 재사용
		List<TourVo> tourList = reservationService.tourSelectList();
		model.addAttribute("tourList", tourList);
		return "reservation/adminReservationScheduleView";
	} 
	
	// [관리자] 투어 예약 현황 전체 조회 화면
	@RequestMapping(value="/reservation/reservationListAll.do", method=RequestMethod.GET)
	public String tourReservationListAll(Model model) {
		log.debug("Welcome reservation tourReservationListAll");
		List<TourVo> tourReservationListAll = reservationService.tourReservationSelectListAll();
		
		model.addAttribute("tourReservationListAll", tourReservationListAll);
		return "reservation/adminReservationListAllView";
	} 
	
	// [관리자] 투어 예약 게시판 CRUD 전체 조회
	@RequestMapping(value="/reservation/reservationPage.do", method=RequestMethod.GET)
	public String tourReservationBoard(Model model) {
		log.debug("Welcome reservation tourReservationBoard");
		
		// 회원에서 사용했던  tourSelectList() 재사용
		List<TourVo> tourList = reservationService.tourSelectList();
		model.addAttribute("tourList", tourList);
		return "reservation/adminReservationPageView";
	} 
	
	// [관리자] 투어 예약 게시판 CRUD 전체 조회 - 상세(하나만 선택)
	@RequestMapping(value="/reservation/reservationPageDetail.do", method=RequestMethod.GET)
	public String tourReservationBoardDetail(int tourNo, Model model) {
		log.debug("Welcome reservation tourReservationBoardDetail");
		
		// 회원에서 사용했던  tourSelectOne() 재사용
		TourVo tourVo = reservationService.tourSelectOne(tourNo);
		model.addAttribute("tourVo", tourVo);
		return "reservation/adminReservationPageDetailView";
	} 
	
	// [관리자] 투어 예약 게시판 CRUD 전체 조회 - 상세(하나만 선택) - 업데이트
	@RequestMapping(value="/reservation/reservationPageUpdate.do", method=RequestMethod.GET)
	public String tourReservationBoardUpdate(int tourNo, Model model) {
		log.debug("Welcome reservation tourReservationBoardUpdate");
		
		// 회원, 상세 조회에서 사용했던  tourSelectOne() 재사용
		TourVo tourVo = reservationService.tourSelectOne(tourNo);
		model.addAttribute("tourVo", tourVo);
		return "reservation/adminReservationPageUpdateForm";
	} 
	
	// [관리자] 투어 예약 게시판 CRUD 전체 조회 - 상세(하나만 선택) - 업데이트 - 업데이트Ctr
	// 원래 TourVo tourVo 하려다 날짜에서 문제가 생겨서 각각 쪼갬
	// 그에 대한 원본
	//	@RequestMapping(value="/reservation/reservationPageUpdateCtr.do", method={RequestMethod.POST, RequestMethod.GET})
	//	public String tourReservationBoardUpdateCtr(TourVo tourVo, Model model) {
	//	log.debug("Welcome reservation tourReservationBoardUpdateCtr");
	//	System.out.println(tourVo);
	//	reservationService.tourUpdateOne(tourVo);
	//	return "redirect:/reservation/reservationPage.do";
	//	}
	@RequestMapping(value="/reservation/reservationPageUpdateCtr.do", method={RequestMethod.POST, RequestMethod.GET})
	public String tourReservationBoardUpdateCtr(String tourName, String tourStartDate, String tourEndDate,
			String tourStartTime, String tourEndTime, int tourPeopleNum, int tourPrice, String tourStartingPoint,
			String tourContent, int tourNo, Model model) {
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("tourName", tourName);
		paramMap.put("tourStartDate", tourStartDate);
		paramMap.put("tourEndDate", tourEndDate);
		paramMap.put("tourStartTime", tourStartTime);
		paramMap.put("tourEndTime", tourEndTime);
		paramMap.put("tourPeopleNum", tourPeopleNum);
		paramMap.put("tourPrice", tourPrice);
		paramMap.put("tourStartingPoint", tourStartingPoint);
		paramMap.put("tourContent", tourContent);
		paramMap.put("tourNo", tourNo);
		
		log.debug("Welcome reservation tourReservationBoardUpdateCtr");
		reservationService.tourUpdateOne(paramMap);
		return "redirect:/reservation/reservationPage.do";
	}
	
	// [관리자] 투어 예약 게시판 CRUD 전체 조회 - 상세(하나만 선택) - 삭제
	@RequestMapping(value="/reservation/reservationPageDelete.do", method=RequestMethod.GET)
	public String tourReservationBoardDelete(int tourNo, Model model) {
		log.debug("Welcome reservation tourReservationBoardDelete");
		
		reservationService.tourDeleteOne(tourNo);
		
		return "redirect:/reservation/reservationPage.do";
	} 
	
}
