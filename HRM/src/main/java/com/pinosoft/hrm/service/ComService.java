package com.pinosoft.hrm.service;

/**
 * 
 * @author	박기윤
 * @since	2020.07.31
 * @version	v.1.0
 *
 */

import org.springframework.beans.factory.annotation.*;
import com.pinosoft.hrm.DAO.*;
import com.pinosoft.hrm.VO.*;
import java.util.*;

public class ComService {
	@Autowired
	InsaDAO dao;
	
	public List<InsaVO> getComList() {
		List<InsaVO> list = dao.getComList();
		return list;
	}
}
