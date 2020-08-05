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
	
	public InsaVO getEmpInfo(InsaVO insaVO) {
		return sqlSession.selectOne("insaSQL.getInsaInfo", insaVO);
	}
	
	public void editEmp(InsaVO insaVO) {
		sqlSession.update("insaSQL.editEmpInfo", insaVO);
	}
	
	public void copyEmpToDel(InsaVO insaVO) {
		sqlSession.insert("insaSQL.copyEmpToDel", insaVO);
	}
	
	public void delEmp(InsaVO insaVO) {
		sqlSession.delete("insaSQL.delEmp", insaVO);
	}
	
	public List<InsaVO> getEmpList(InsaVO insaVO) {
		return sqlSession.selectList("insaSQL.getEmpList", insaVO);
	}
	
	public List<InsaInputVO> getInputYNList(InsaVO insaVO) {
		return sqlSession.selectList("insaSQL.input_YN_List", insaVO);
	}
	
	public List<InsaCarrierVO> getCarrierList(InsaVO insaVO) {
		return sqlSession.selectList("insaSQL.carrierList", insaVO);
	}
	
	public List<InsaAcadVO> getAcadList(InsaVO insaVO) {
		return sqlSession.selectList("insaSQL.acadList", insaVO);
	}
}