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
public class InsaCarrierVO {
	private int seq, sabun;
	private String cmp_name_carrier, pos_gbn_code, respon_dept, work_contents;
	private Date work_start_day, work_end_day;
}
