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
import java.text.ParseException;

@Alias("carrierVO")
@Data
public class InsaCarrierVO implements DateParser {
	private int seq, sabun, rno;
	private String cmp_name_carrier, pos_gbn_code, respon_dept, work_contents, work_start_day, work_end_day;
	private Date work_start_sql_day, work_end_sql_day;
	
	@Override
	public void db_to_view_format() {
		this.work_start_day = FORM.format(work_end_sql_day);
		this.work_end_day = FORM.format(work_end_sql_day);
	}
	@Override
	public void view_to_db_parse() {
		try {
			this.work_start_sql_day = (Date) FORM.parse(work_start_day);
			this.work_end_sql_day = (Date) FORM.parse(work_end_day);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
