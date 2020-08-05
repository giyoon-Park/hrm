package com.pinosoft.hrm.service;

/**
 * 
 * @author	박기윤
 * @since	2020.07.31
 * @version	v.1.0
 *
 */

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import com.pinosoft.hrm.DAO.*;
import com.pinosoft.hrm.VO.*;
import com.pinosoft.hrm.util.*;
import java.util.*;
import javax.servlet.http.*;

@Service
public class ComService {
	@Autowired
	InsaDAO dao;
	@Autowired
	FileUtil uploadfile;
	
	public List<InsaComVO> getComList() {
		List<InsaComVO> list = dao.getComList();
		return list;
	}
	
	public int checkID(String id) {
		int cnt = 0;
		cnt = dao.checkID(id);
		
		return cnt;
	}
	
	public void regEmp(InsaVO insaVO) {
		dao.regEmp(insaVO);
	}
	
	public InsaVO uploadImg(InsaVO insaVO,ImgVO imgVO, HttpSession session) {
		if(imgVO.getProfileimg() != null) {
			HashMap<String, String> map = uploadfile.getNames(session, imgVO.getProfileimg(), "profile");
			insaVO.setOri_profile(map.get("oriname"));
			insaVO.setProfile(map.get("savename"));
		}
		if(imgVO.getCmp_reg_img() != null) {
			HashMap<String, String> map = uploadfile.getNames(session, imgVO.getCmp_reg_img(), "cmp_reg");
			insaVO.setOri_cmp_reg_img(map.get("oriname"));
			insaVO.setCmp_reg_image(map.get("savename"));
		}
		if(imgVO.getResume_img() != null) {
			HashMap<String, String> map = uploadfile.getNames(session, imgVO.getResume_img(), "carrier");
			insaVO.setOri_carrier(map.get("oriname"));
			insaVO.setCarrier(map.get("savename"));
		}
		
		return insaVO;
	}
}