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

@Alias("insaVO")
@Data
public class InsaVO implements DateParser {
	private int sabun, years, salary, rno, startCont, endCont;
	private String put_yn, name, reg_no, phone, hp, carrier, pos_gbn_code, sex, email,
					zip, addr1, addr2, dept_code, join_gbn_code, cmp_reg_image,
					id, pwd, kosa_reg_yn, kosa_gbn_code, mil_yn, mil_type, mil_level,
					job_type, gart_level, self_intro, crm_name, profile, join_yn,
					ori_profile, ori_cmp_reg_img,ori_carrier,
					join_day, retire_day, mil_startdate, mil_enddate;
	private Date join_sql_day, retire_sql_day, mil_sql_startdate, mil_sql_enddate;
	
	@Override
	public void db_to_view_format() {
		this.join_day = FORM.format(join_sql_day);
		this.retire_day = FORM.format(retire_sql_day);
		this.mil_startdate = FORM.format(retire_sql_day);
		this.mil_enddate = FORM.format(retire_sql_day);
	}
	@Override
	public void view_to_db_parse() {
		try {
			this.join_sql_day = (Date) FORM.parse(join_day);
			this.retire_sql_day = (Date) FORM.parse(retire_day);
			this.mil_sql_startdate = (Date) FORM.parse(mil_startdate);
			this.mil_sql_enddate = (Date) FORM.parse(mil_enddate);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}