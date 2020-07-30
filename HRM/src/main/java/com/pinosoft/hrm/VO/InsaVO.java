package com.pinosoft.hrm.VO;

/**
 * 
 * @author	박기윤
 * @since	2020.07.29
 * @version	v.1.0
 *
 */

import org.apache.ibatis.type.*;
import org.springframework.web.multipart.*;
import lombok.*;
import java.sql.*;

@Alias("insa")
@Data
public class InsaVO {
	private int sabun, years, salary;
	private String put_yn, name, reg_no, phone, hp, carrier, pos_gbn_code, sex, email, zip, addr1, addr2, dept_code, join_gbn_code,
					id, pwd, kosa_reg_yn, kosa_gbn_code, mil_yn, mil_type, mil_level, job_type, gart_level, self_intro, crm_name, profile, join_yn;
	private Date join_day, retire_day, mil_startdate, mil_enddate;
	private MultipartFile[] file;
}
