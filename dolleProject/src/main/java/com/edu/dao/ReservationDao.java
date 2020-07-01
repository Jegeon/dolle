package com.edu.dao;

import java.util.List;
import java.util.Map;

import com.edu.vo.MemberVo;
import com.edu.vo.ReservationVo;
import com.edu.vo.TourVo;

public interface ReservationDao {

	public List<TourVo> tourSelectList();
	public TourVo tourSelectOne(int tourNo);
	public TourVo tourSelectAllFromOne(int tourNo);
	public TourVo tourAndReservationSelectAllFromOne(Map<String, Object> paramMap);

}
