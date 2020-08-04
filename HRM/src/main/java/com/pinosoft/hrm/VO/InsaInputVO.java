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
public class InsaInputVO {
	private int seq, sabun, sugst_money, current_salary;
	private String pjt_gbn_code, eqm_yn, work_area;
	private Date wrk_posb_day;
}
