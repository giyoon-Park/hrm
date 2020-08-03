package com.pinosoft.hrm.VO;

/**
 * 
 * @author	박기윤
 * @since	2020.08.03
 * @version	v.1.0
 *
 */

import lombok.*;

import org.apache.ibatis.type.*;
import org.springframework.web.multipart.*;

@Alias("imgVO")
@Data
public class ImgVO {
	private MultipartFile profileimg, cmp_reg_img, resume_img;
}
