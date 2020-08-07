package com.pinosoft.hrm.VO;

/**
 * 
 * @author	박기윤
 * @since	2020.08.06
 * @version	v.1.0
 *
 */

import java.text.*;

public interface DateParser {
	SimpleDateFormat FORM = new SimpleDateFormat("yyyy-MM-dd");
	public void db_to_view_format();
}
