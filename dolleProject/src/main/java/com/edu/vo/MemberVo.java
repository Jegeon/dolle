package com.edu.vo;

import java.util.Date;

public class MemberVo {

	private int no;
	private String name;
	private String email;
	private String nickname;
	private String password;
	private String phone;
	private Date birthdate;
	private String national;
	private Date createDate;
	private Date modifiedDate;
	private String grade;
	private String del;
	private String tempPassword;
	
	public MemberVo(int no, String name, String email, String nickname, String password, String phone, Date birthdate,
			String national, Date createDate, Date modifiedDate, String grade, String del, String tempPassword) {
		super();
		this.no = no;
		this.name = name;
		this.email = email;
		this.nickname = nickname;
		this.password = password;
		this.phone = phone;
		this.birthdate = birthdate;
		this.national = national;
		this.createDate = createDate;
		this.modifiedDate = modifiedDate;
		this.grade = grade;
		this.del = del;
		this.tempPassword = tempPassword;
	}

	public MemberVo() {
		super();
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}

	public String getNational() {
		return national;
	}

	public void setNational(String national) {
		this.national = national;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getDel() {
		return del;
	}

	public void setDel(String del) {
		this.del = del;
	}

	public String getTempPassword() {
		return tempPassword;
	}

	public void setTempPassword(String tempPassword) {
		this.tempPassword = tempPassword;
	}

	@Override
	public String toString() {
		return "MemberVo [no=" + no + ", name=" + name + ", email=" + email + ", nickname=" + nickname + ", password="
				+ password + ", phone=" + phone + ", birthdate=" + birthdate + ", national=" + national
				+ ", createDate=" + createDate + ", modifiedDate=" + modifiedDate + ", grade=" + grade + ", del=" + del
				+ ", tempPassword=" + tempPassword + "]";
	}
	
}
