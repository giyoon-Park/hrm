package com.pinosoft.hrm.VO;

/**
 * 
 * @author	박기윤
 * @since	2020.08.13
 * @version	v.1.0
 *
 */

import java.util.*;
import org.apache.ibatis.type.*;
import lombok.*;

@Alias("gridVO")
@Data
public class jqGridVO {
	private int page, records, total;
	private List<Map<String, Object>> rows = new ArrayList<Map<String,Object>>();
}
