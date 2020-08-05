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

@Alias("inputVO")
@Data
public class InsaInputVO {
	private int seq, sabun, sugst_money, current_salary;
	private String pjt_gbn_code, eqm_yn, work_area, wrk_posb_day;
	private Date wrk_posb_sql_day;
	
	SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd");
	
	public void setWrk_posb_day() {
		this.wrk_posb_day = form.format(wrk_posb_sql_day);
	}
	
	public void setWrk_posb_sql_day() {
		try {
			this.wrk_posb_sql_day = (Date) form.parse(wrk_posb_day);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}