package com.edu.vo;

import java.util.Date;

public class ReservationVo {
	
	private int reserveNo;
	private int tourNo;
	private int memberNo;
	private int closedNo;
	private Date reserveTourDate;
	private int reserveApplyNum;
	private int reservePrice;
	private Date reserveApplyDate;
	private Date reserveDepositDate;
	private String reserveDepositState;
	
	public ReservationVo(int reserveNo, int tourNo, int memberNo, int closedNo, Date reserveTourDate,
			int reserveApplyNum, int reservePrice, Date reserveApplyDate, Date reserveDepositDate,
			String reserveDepositState) {
		super();
		this.reserveNo = reserveNo;
		this.tourNo = tourNo;
		this.memberNo = memberNo;
		this.closedNo = closedNo;
		this.reserveTourDate = reserveTourDate;
		this.reserveApplyNum = reserveApplyNum;
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
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getClosedNo() {
		return closedNo;
	}
	public void setClosedNo(int closedNo) {
		this.closedNo = closedNo;
	}
	public Date getReserveTourDate() {
		return reserveTourDate;
	}
	public void setReserveTourDate(Date reserveTourDate) {
		this.reserveTourDate = reserveTourDate;
	}
	public int getReserveApplyNum() {
		return reserveApplyNum;
	}
	public void setReserveApplyNum(int reserveApplyNum) {
		this.reserveApplyNum = reserveApplyNum;
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
		return "ReservationVo [reserveNo=" + reserveNo + ", tourNo=" + tourNo + ", memberNo=" + memberNo + ", closedNo="
				+ closedNo + ", reserveTourDate=" + reserveTourDate + ", reserveApplyNum=" + reserveApplyNum
				+ ", reservePrice=" + reservePrice + ", reserveApplyDate=" + reserveApplyDate + ", reserveDepositDate="
				+ reserveDepositDate + ", reserveDepositState=" + reserveDepositState + "]";
	}
	
}
