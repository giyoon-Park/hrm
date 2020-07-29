package com.pinosoft.hrm.VO;

/**
 * 
 * @author	박기윤
 * @since	2020.07.29
 * @version	v.1.0
 *
 */

import org.apache.ibatis.type.*;

@Alias("acad")
public class InsaAcadVO {
	private int seq, sabun, gart_year, gart_month;
	private String major_stud_gbn, gart_level, school_name;
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getSabun() {
		return sabun;
	}
	public void setSabun(int sabun) {
		this.sabun = sabun;
	}
	public int getGart_year() {
		return gart_year;
	}
	public void setGart_year(int gart_year) {
		this.gart_year = gart_year;
	}
	public int getGart_month() {
		return gart_month;
	}
	public void setGart_month(int gart_month) {
		this.gart_month = gart_month;
	}
	public String getMajor_stud_gbn() {
		return major_stud_gbn;
	}
	public void setMajor_stud_gbn(String major_stud_gbn) {
		this.major_stud_gbn = major_stud_gbn;
	}
	public String getGart_level() {
		return gart_level;
	}
	public void setGart_level(String gart_level) {
		this.gart_level = gart_level;
	}
	public String getSchool_name() {
		return school_name;
	}
	public void setSchool_name(String school_name) {
		this.school_name = school_name;
	}
	@Override
	public String toString() {
		return "InsaAcadVO [seq=" + seq + ", sabun=" + sabun + ", gart_year=" + gart_year + ", gart_month=" + gart_month
				+ ", major_stud_gbn=" + major_stud_gbn + ", gart_level=" + gart_level + ", school_name=" + school_name
				+ "]";
	}
}
