package com.edu.reservation.vo;

import java.util.Date;

public class TourVo {

	private int tourNo;
	private int townNo;
	private String tourName;
	private Date tourStartDate;
	private Date tourEndDate;
	
	// 휴무일 테이블에서 가져온 내용 시작
	private Date tourClosedStartDate;
	private Date tourClosedEndDate;
	private String tourClosedContent;
	// 휴무일 테이블에서 가져온 내용 끝
	
	private String tourStartTime;
	private String tourEndTime;
	private int tourPrice;
	private int tourPeopleNum;
	private String tourStartingPoint;
	private String tourContent;
	private Date tourCreDate;
	private Date tourModDate;
	private String tourDel;
	private int tourPossibleNum;
	private int tourReservedNum;
	
	// 계좌 관리 테이블 시작
	private String tourAccountNum;
	private String tourBank;
	private String tourDepositor;
	// 계좌 관리 테이블 시작
	
	// memberNo, reserveTourDate 관련 부분 시작
	private int memberNo;
	private String reserveTourDate;
	private int reserveApplyNum;
	// memberNo, reserveTourDate 관련 부분 끝
	public TourVo(int tourNo, int townNo, String tourName, Date tourStartDate, Date tourEndDate,
			Date tourClosedStartDate, Date tourClosedEndDate, String tourClosedContent, String tourStartTime,
			String tourEndTime, int tourPrice, int tourPeopleNum, String tourStartingPoint, String tourContent,
			Date tourCreDate, Date tourModDate, String tourDel, int tourPossibleNum, int tourReservedNum,
			String tourAccountNum, String tourBank, String tourDepositor, int memberNo, String reserveTourDate,
			int reserveApplyNum) {
		super();
		this.tourNo = tourNo;
		this.townNo = townNo;
		this.tourName = tourName;
		this.tourStartDate = tourStartDate;
		this.tourEndDate = tourEndDate;
		this.tourClosedStartDate = tourClosedStartDate;
		this.tourClosedEndDate = tourClosedEndDate;
		this.tourClosedContent = tourClosedContent;
		this.tourStartTime = tourStartTime;
		this.tourEndTime = tourEndTime;
		this.tourPrice = tourPrice;
		this.tourPeopleNum = tourPeopleNum;
		this.tourStartingPoint = tourStartingPoint;
		this.tourContent = tourContent;
		this.tourCreDate = tourCreDate;
		this.tourModDate = tourModDate;
		this.tourDel = tourDel;
		this.tourPossibleNum = tourPossibleNum;
		this.tourReservedNum = tourReservedNum;
		this.tourAccountNum = tourAccountNum;
		this.tourBank = tourBank;
		this.tourDepositor = tourDepositor;
		this.memberNo = memberNo;
		this.reserveTourDate = reserveTourDate;
		this.reserveApplyNum = reserveApplyNum;
	}
	public TourVo() {
		super();
	}
	public int getTourNo() {
		return tourNo;
	}
	public void setTourNo(int tourNo) {
		this.tourNo = tourNo;
	}
	public int getTownNo() {
		return townNo;
	}
	public void setTownNo(int townNo) {
		this.townNo = townNo;
	}
	public String getTourName() {
		return tourName;
	}
	public void setTourName(String tourName) {
		this.tourName = tourName;
	}
	public Date getTourStartDate() {
		return tourStartDate;
	}
	public void setTourStartDate(Date tourStartDate) {
		this.tourStartDate = tourStartDate;
	}
	public Date getTourEndDate() {
		return tourEndDate;
	}
	public void setTourEndDate(Date tourEndDate) {
		this.tourEndDate = tourEndDate;
	}
	public Date getTourClosedStartDate() {
		return tourClosedStartDate;
	}
	public void setTourClosedStartDate(Date tourClosedStartDate) {
		this.tourClosedStartDate = tourClosedStartDate;
	}
	public Date getTourClosedEndDate() {
		return tourClosedEndDate;
	}
	public void setTourClosedEndDate(Date tourClosedEndDate) {
		this.tourClosedEndDate = tourClosedEndDate;
	}
	public String getTourClosedContent() {
		return tourClosedContent;
	}
	public void setTourClosedContent(String tourClosedContent) {
		this.tourClosedContent = tourClosedContent;
	}
	public String getTourStartTime() {
		return tourStartTime;
	}
	public void setTourStartTime(String tourStartTime) {
		this.tourStartTime = tourStartTime;
	}
	public String getTourEndTime() {
		return tourEndTime;
	}
	public void setTourEndTime(String tourEndTime) {
		this.tourEndTime = tourEndTime;
	}
	public int getTourPrice() {
		return tourPrice;
	}
	public void setTourPrice(int tourPrice) {
		this.tourPrice = tourPrice;
	}
	public int getTourPeopleNum() {
		return tourPeopleNum;
	}
	public void setTourPeopleNum(int tourPeopleNum) {
		this.tourPeopleNum = tourPeopleNum;
	}
	public String getTourStartingPoint() {
		return tourStartingPoint;
	}
	public void setTourStartingPoint(String tourStartingPoint) {
		this.tourStartingPoint = tourStartingPoint;
	}
	public String getTourContent() {
		return tourContent;
	}
	public void setTourContent(String tourContent) {
		this.tourContent = tourContent;
	}
	public Date getTourCreDate() {
		return tourCreDate;
	}
	public void setTourCreDate(Date tourCreDate) {
		this.tourCreDate = tourCreDate;
	}
	public Date getTourModDate() {
		return tourModDate;
	}
	public void setTourModDate(Date tourModDate) {
		this.tourModDate = tourModDate;
	}
	public String getTourDel() {
		return tourDel;
	}
	public void setTourDel(String tourDel) {
		this.tourDel = tourDel;
	}
	public int getTourPossibleNum() {
		return tourPossibleNum;
	}
	public void setTourPossibleNum(int tourPossibleNum) {
		this.tourPossibleNum = tourPossibleNum;
	}
	public int getTourReservedNum() {
		return tourReservedNum;
	}
	public void setTourReservedNum(int tourReservedNum) {
		this.tourReservedNum = tourReservedNum;
	}
	public String getTourAccountNum() {
		return tourAccountNum;
	}
	public void setTourAccountNum(String tourAccountNum) {
		this.tourAccountNum = tourAccountNum;
	}
	public String getTourBank() {
		return tourBank;
	}
	public void setTourBank(String tourBank) {
		this.tourBank = tourBank;
	}
	public String getTourDepositor() {
		return tourDepositor;
	}
	public void setTourDepositor(String tourDepositor) {
		this.tourDepositor = tourDepositor;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getReserveTourDate() {
		return reserveTourDate;
	}
	public void setReserveTourDate(String reserveTourDate) {
		this.reserveTourDate = reserveTourDate;
	}
	public int getReserveApplyNum() {
		return reserveApplyNum;
	}
	public void setReserveApplyNum(int reserveApplyNum) {
		this.reserveApplyNum = reserveApplyNum;
	}
	@Override
	public String toString() {
		return "TourVo [tourNo=" + tourNo + ", townNo=" + townNo + ", tourName=" + tourName + ", tourStartDate="
				+ tourStartDate + ", tourEndDate=" + tourEndDate + ", tourClosedStartDate=" + tourClosedStartDate
				+ ", tourClosedEndDate=" + tourClosedEndDate + ", tourClosedContent=" + tourClosedContent
				+ ", tourStartTime=" + tourStartTime + ", tourEndTime=" + tourEndTime + ", tourPrice=" + tourPrice
				+ ", tourPeopleNum=" + tourPeopleNum + ", tourStartingPoint=" + tourStartingPoint + ", tourContent="
				+ tourContent + ", tourCreDate=" + tourCreDate + ", tourModDate=" + tourModDate + ", tourDel=" + tourDel
				+ ", tourPossibleNum=" + tourPossibleNum + ", tourReservedNum=" + tourReservedNum + ", tourAccountNum="
				+ tourAccountNum + ", tourBank=" + tourBank + ", tourDepositor=" + tourDepositor + ", memberNo="
				+ memberNo + ", reserveTourDate=" + reserveTourDate + ", reserveApplyNum=" + reserveApplyNum + "]";
	}

	
}
