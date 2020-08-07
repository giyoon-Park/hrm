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

@Alias("carrierVO")
@Data
public class InsaCarrierVO implements DateParser {
	private int cseq, sabun, rno;
	private String cmp_name_carrier, pos_gbn_code, respon_dept, work_contents, work_start_day, work_end_day;
	private Date work_start_day_sql, work_end_day_sql;
	
	@Override
	public void db_to_view_format() {
		this.work_start_day = FORM.format(work_end_day_sql);
		this.work_end_day = FORM.format(work_end_day_sql);
	}
}
