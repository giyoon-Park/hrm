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

@Alias("carrier")
public class InsaCarrierVO {
	private int seq, sabun;
	private String cmp_name_carrier, pos_gbn_code, respon_dept, work_contents;
	private Date work_start_day, work_end_day;
	
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
	public String getCmp_name_carrier() {
		return cmp_name_carrier;
	}
	public void setCmp_name_carrier(String cmp_name_carrier) {
		this.cmp_name_carrier = cmp_name_carrier;
	}
	public String getPos_gbn_code() {
		return pos_gbn_code;
	}
	public void setPos_gbn_code(String pos_gbn_code) {
		this.pos_gbn_code = pos_gbn_code;
	}
	public String getRespon_dept() {
		return respon_dept;
	}
	public void setRespon_dept(String respon_dept) {
		this.respon_dept = respon_dept;
	}
	public String getWork_contents() {
		return work_contents;
	}
	public void setWork_contents(String work_contents) {
		this.work_contents = work_contents;
	}
	public Date getWork_start_day() {
		return work_start_day;
	}
	public void setWork_start_day(Date work_start_day) {
		this.work_start_day = work_start_day;
	}
	public Date getWork_end_day() {
		return work_end_day;
	}
	public void setWork_end_day(Date work_end_day) {
		this.work_end_day = work_end_day;
	}
	@Override
	public String toString() {
		return "InsaCarrierVO [seq=" + seq + ", sabun=" + sabun + ", cmp_name_carrier=" + cmp_name_carrier
				+ ", pos_gbn_code=" + pos_gbn_code + ", respon_dept=" + respon_dept + ", work_contents=" + work_contents
				+ ", work_start_day=" + work_start_day + ", work_end_day=" + work_end_day + "]";
	}
}
