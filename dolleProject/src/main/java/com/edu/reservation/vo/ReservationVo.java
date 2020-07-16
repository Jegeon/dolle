package com.edu.reservation.vo;

import java.util.Date;

public class ReservationVo {
	
	private int reserveNo;
	private int tourNo;
	private String tourName;
	private int memberNo;
	private String memberName;
	private String memberEmail;
	private int memberAge;
	private Date reserveTourDate;
	private String reserveTourDay;
	private int reserveApplyNum;
	private int reserveApplyNumSum;
	private int reserveTourPeopleNum;
	private int reservePrice;
	private Date reserveApplyDate;
	private Date reserveDepositDate;
	private String reserveDepositState;
	
	public ReservationVo(int reserveNo, int tourNo, String tourName, int memberNo, String memberName,
			String memberEmail, int memberAge, Date reserveTourDate, String reserveTourDay, int reserveApplyNum,
			int reserveApplyNumSum, int reserveTourPeopleNum, int reservePrice, Date reserveApplyDate,
			Date reserveDepositDate, String reserveDepositState) {
		super();
		this.reserveNo = reserveNo;
		this.tourNo = tourNo;
		this.tourName = tourName;
		this.memberNo = memberNo;
		this.memberName = memberName;
		this.memberEmail = memberEmail;
		this.memberAge = memberAge;
		this.reserveTourDate = reserveTourDate;
		this.reserveTourDay = reserveTourDay;
		this.reserveApplyNum = reserveApplyNum;
		this.reserveApplyNumSum = reserveApplyNumSum;
		this.reserveTourPeopleNum = reserveTourPeopleNum;
		this.reservePrice = reservePrice;
		this.reserveApplyDate = reserveApplyDate;
		this.reserveDepositDate = reserveDepositDate;
		this.reserveDepositState = reserveDepositState;
	}

	public ReservationVo() {
		super();
	}

	public int getReserveNo() {
		return reserveNo;
	}

	public void setReserveNo(int reserveNo) {
		this.reserveNo = reserveNo;
	}

	public int getTourNo() {
		return tourNo;
	}

	public void setTourNo(int tourNo) {
		this.tourNo = tourNo;
	}

	public String getTourName() {
		return tourName;
	}

	public void setTourName(String tourName) {
		this.tourName = tourName;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public int getMemberAge() {
		return memberAge;
	}

	public void setMemberAge(int memberAge) {
		this.memberAge = memberAge;
	}

	public Date getReserveTourDate() {
		return reserveTourDate;
	}

	public void setReserveTourDate(Date reserveTourDate) {
		this.reserveTourDate = reserveTourDate;
	}

	public String getReserveTourDay() {
		return reserveTourDay;
	}

	public void setReserveTourDay(String reserveTourDay) {
		this.reserveTourDay = reserveTourDay;
	}

	public int getReserveApplyNum() {
		return reserveApplyNum;
	}

	public void setReserveApplyNum(int reserveApplyNum) {
		this.reserveApplyNum = reserveApplyNum;
	}

	public int getReserveApplyNumSum() {
		return reserveApplyNumSum;
	}

	public void setReserveApplyNumSum(int reserveApplyNumSum) {
		this.reserveApplyNumSum = reserveApplyNumSum;
	}

	public int getReserveTourPeopleNum() {
		return reserveTourPeopleNum;
	}

	public void setReserveTourPeopleNum(int reserveTourPeopleNum) {
		this.reserveTourPeopleNum = reserveTourPeopleNum;
	}

	public int getReservePrice() {
		return reservePrice;
	}

	public void setReservePrice(int reservePrice) {
		this.reservePrice = reservePrice;
	}

	public Date getReserveApplyDate() {
		return reserveApplyDate;
	}

	public void setReserveApplyDate(Date reserveApplyDate) {
		this.reserveApplyDate = reserveApplyDate;
	}

	public Date getReserveDepositDate() {
		return reserveDepositDate;
	}

	public void setReserveDepositDate(Date reserveDepositDate) {
		this.reserveDepositDate = reserveDepositDate;
	}

	public String getReserveDepositState() {
		return reserveDepositState;
	}

	public void setReserveDepositState(String reserveDepositState) {
		this.reserveDepositState = reserveDepositState;
	}

	@Override
	public String toString() {
		return "ReservationVo [reserveNo=" + reserveNo + ", tourNo=" + tourNo + ", tourName=" + tourName + ", memberNo="
				+ memberNo + ", memberName=" + memberName + ", memberEmail=" + memberEmail + ", memberAge=" + memberAge
				+ ", reserveTourDate=" + reserveTourDate + ", reserveTourDay=" + reserveTourDay + ", reserveApplyNum="
				+ reserveApplyNum + ", reserveApplyNumSum=" + reserveApplyNumSum + ", reserveTourPeopleNum="
				+ reserveTourPeopleNum + ", reservePrice=" + reservePrice + ", reserveApplyDate=" + reserveApplyDate
				+ ", reserveDepositDate=" + reserveDepositDate + ", reserveDepositState=" + reserveDepositState + "]";
	}
	
}
