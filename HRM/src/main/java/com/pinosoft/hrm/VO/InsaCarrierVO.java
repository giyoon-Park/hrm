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

@Alias("carrierVO")
@Data
public class InsaCarrierVO {
	private int seq, sabun;
	private String cmp_name_carrier, pos_gbn_code, respon_dept, work_contents, work_start_day, work_end_day;
	private Date work_start_sql_day, work_end_sql_day;
	
	SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd");
	
	public void setWork_start_day() {
		this.work_start_day = form.format(work_start_sql_day);
	}
	
	public void setWork_end_day() {
		this.work_end_day = form.format(work_end_sql_day);
	}
	
	public void setWork_start_sql_day() {
		try {
			this.work_start_sql_day = (Date) form.parse(work_start_day);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void setWork_end_sql_day() {
		try {
			this.work_end_sql_day = (Date) form.parse(work_end_day);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
