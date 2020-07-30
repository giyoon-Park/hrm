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

@Alias("com")
@Data
public class InsaComVO {
	private String gubun, code, name, note;
}
