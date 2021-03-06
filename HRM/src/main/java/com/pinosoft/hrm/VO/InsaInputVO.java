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

@Alias("inputVO")
@Data
public class InsaInputVO implements DateParser {
	private int iseq, sabun, sugst_money, current_salary, rno, startCont, endCont;
	private String pjt_gbn_code, eqm_yn, work_area, wrk_posb_day;
	private Date wrk_posb_day_sql;
	
	@Override
	public void db_to_view_format() {
		this.wrk_posb_day = FORM.format(wrk_posb_day_sql);
	}
}