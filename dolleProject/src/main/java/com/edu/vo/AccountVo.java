package com.edu.vo;

import java.util.Date;

public class AccountVo {
	
	private int accNo;
	private int townNo;
	private String accNumber;
	private String accBank;
	private String accDepositor;
	
	public AccountVo(int accNo, int townNo, String accNumber, String accBank, String accDepositor) {
		super();
		this.accNo = accNo;
		this.townNo = townNo;
		this.accNumber = accNumber;
		this.accBank = accBank;
		this.accDepositor = accDepositor;
	}

	public AccountVo() {
		super();
	}

	public int getAccNo() {
		return accNo;
	}

	public void setAccNo(int accNo) {
		this.accNo = accNo;
	}

	public int getTownNo() {
		return townNo;
	}

	public void setTownNo(int townNo) {
		this.townNo = townNo;
	}

	public String getAccNumber() {
		return accNumber;
	}

	public void setAccNumber(String accNumber) {
		this.accNumber = accNumber;
	}

	public String getAccBank() {
		return accBank;
	}

	public void setAccBank(String accBank) {
		this.accBank = accBank;
	}

	public String getAccDepositor() {
		return accDepositor;
	}

	public void setAccDepositor(String accDepositor) {
		this.accDepositor = accDepositor;
	}

	@Override
	public String toString() {
		return "AccountVo [accNo=" + accNo + ", townNo=" + townNo + ", accNumber=" + accNumber + ", accBank=" + accBank
				+ ", accDepositor=" + accDepositor + "]";
	}
	
}
