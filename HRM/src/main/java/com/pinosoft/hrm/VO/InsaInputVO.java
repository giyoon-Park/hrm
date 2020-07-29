package com.pinosoft.hrm.VO;

/**
 * 
 * @author	박기윤
 * @since	2020.07.29
 * @version	v.1.0
 *
 */

import org.apache.ibatis.type.*;
import java.sql.*;

@Alias("input")
public class InsaInputVO {
	private int seq, sabun, sugst_money, current_salary;
	private String pjt_gbn_code, eqm_yn, work_area;
	private Date wrk_posb_day;
	
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
	public int getSugst_money() {
		return sugst_money;
	}
	public void setSugst_money(int sugst_money) {
		this.sugst_money = sugst_money;
	}
	public int getCurrent_salary() {
		return current_salary;
	}
	public void setCurrent_salary(int current_salary) {
		this.current_salary = current_salary;
	}
	public String getPjt_gbn_code() {
		return pjt_gbn_code;
	}
	public void setPjt_gbn_code(String pjt_gbn_code) {
		this.pjt_gbn_code = pjt_gbn_code;
	}
	public String getEqm_yn() {
		return eqm_yn;
	}
	public void setEqm_yn(String eqm_yn) {
		this.eqm_yn = eqm_yn;
	}
	public String getWork_area() {
		return work_area;
	}
	public void setWork_area(String work_area) {
		this.work_area = work_area;
	}
	public Date getWrk_posb_day() {
		return wrk_posb_day;
	}
	public void setWrk_posb_day(Date wrk_posb_day) {
		this.wrk_posb_day = wrk_posb_day;
	}
	@Override
	public String toString() {
		return "InsaInputVO [seq=" + seq + ", sabun=" + sabun + ", sugst_money=" + sugst_money + ", current_salary="
				+ current_salary + ", pjt_gbn_code=" + pjt_gbn_code + ", eqm_yn=" + eqm_yn + ", work_area=" + work_area
				+ ", wrk_posb_day=" + wrk_posb_day + "]";
	}
}
