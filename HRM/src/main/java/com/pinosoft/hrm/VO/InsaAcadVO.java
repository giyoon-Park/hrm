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

@Alias("acadVO")
@Data
public class InsaAcadVO {
	private int aseq, sabun, gart_year, gart_month, rno;
	private String major_stud_gbn, gart_level, school_name;
}
