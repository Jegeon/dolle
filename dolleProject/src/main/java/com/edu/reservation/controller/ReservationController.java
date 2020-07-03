package com.edu.reservation.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	// 투어 예약 완료 화면
	@RequestMapping(value="/reservation/reservationClear.do", method=RequestMethod.GET)
	public String tourReservationClear(int tourNo, String memberNo, String reserveTourDate, int reserveApplyNum, Model model) {
		log.debug("Welcome reservation clear - {} {}", reserveTourDate, reserveApplyNum);
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("tourNo", tourNo);
		paramMap.put("memberNo", memberNo);
		paramMap.put("reserveTourDate", reserveTourDate);
		paramMap.put("reserveApplyNum", reserveApplyNum);
		TourVo tourVo = reservationService.tourSelectOne(tourNo);
		model.addAttribute("tourVo", tourVo);
		reservationService.tourReservationClear(paramMap);
		ReservationVo reservationVo = reservationService.reservationSelectNewestOne();
		model.addAttribute("reservationVo", reservationVo);
		return "reservation/tourReservationClearView";
	}
}
