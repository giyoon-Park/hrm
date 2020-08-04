package com.pinosoft.hrm.DAO;

/**
 * @author	박기윤
 * @since	2020.07.31
 * @version	v.1.0
 * 
 */

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import java.util.*;
import com.pinosoft.hrm.VO.*;

public class InsaDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List<InsaComVO> getComList() {
		return sqlSession.selectList("insaSQL.getComList");
	}
	
	public int checkID(String id) {
		return sqlSession.selectOne("insaSQL.checkID", id);
	}
	
	public void regEmp(InsaVO insaVO) {
		sqlSession.insert("insaSQL.addEmp", insaVO);
	}
}
