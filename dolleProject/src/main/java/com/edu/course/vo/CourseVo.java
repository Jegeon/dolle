package com.edu.course.vo;

public class CourseVo {
	
	private int course_idx;
	private int town_idx;
	private String course_name;
	private int course_rating;
	
	public CourseVo() {
		
	}
	
	public CourseVo(int course_idx, int town_idx, String course_name, int course_rating) {
		super();
		this.course_idx = course_idx;
		this.town_idx = town_idx;
		this.course_name = course_name;
		this.course_rating = course_rating;
	}
	
	public int getCourse_idx() {
		return course_idx;
	}
	public void setCourse_idx(int course_idx) {
		this.course_idx = course_idx;
	}
	public int getTown_idx() {
		return town_idx;
	}
	public void setTown_idx(int town_idx) {
		this.town_idx = town_idx;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	public int getCourse_rating() {
		return course_rating;
	}
	public void setCourse_rating(int course_rating) {
		this.course_rating = course_rating;
	}
	
	@Override
	public String toString() {
		return "Course [course_idx=" + course_idx + ", town_idx=" + town_idx + ", course_name=" + course_name
				+ ", course_rating=" + course_rating + "]";
	}	
	
}
