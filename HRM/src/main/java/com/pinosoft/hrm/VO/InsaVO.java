package com.pinosoft.hrm.VO;

/**
 * 
 * @author	박기윤
 * @since	2020.07.29
 * @version	v.1.0
 *
 */

import org.apache.ibatis.type.*;
import lombok.*;
import java.sql.*;
import java.text.*;

@Alias("insaVO")
@Data
public class InsaVO {
	private int sabun, years, salary;
	private String put_yn, name, reg_no, phone, hp, carrier, pos_gbn_code, sex, email,
					zip, addr1, addr2, dept_code, join_gbn_code, cmp_reg_image,
					id, pwd, kosa_reg_yn, kosa_gbn_code, mil_yn, mil_type, mil_level,
					job_type, gart_level, self_intro, crm_name, profile, join_yn,
					ori_profile, ori_cmp_reg_img,ori_carrier,
					join_day, retire_day, mil_startdate, mil_enddate;
	private Date join_sql_day, retire_sql_day, mil_sql_startdate, mil_sql_enddate;
	
	SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd");

	public void setJoin_day() {
		this.join_day = form.format(join_sql_day);
	}
	
	public void setRetire_day() {
		this.retire_day = form.format(retire_sql_day);
	}
	
	public void setMil_startdate() {
		this.mil_startdate = form.format(mil_sql_startdate);
	}
	
	public void setMil_enddate() {
		this.mil_enddate = form.format(mil_sql_enddate);
	}
	
	public void setJoin_sql_day() {
		try {
			this.join_sql_day = (Date) form.parse(join_day);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void setRetire_sql_day() {
		try {
			this.retire_sql_day = (Date) form.parse(retire_day);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void setMil_sql_startdate() {
		try {
			this.mil_sql_startdate = (Date) form.parse(mil_startdate);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void setMil_sql_enddate() {
		try {
			this.mil_sql_enddate = (Date) form.parse(mil_enddate);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}