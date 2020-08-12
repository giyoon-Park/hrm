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
	
	public int checkHP(String hp) {
		return sqlSession.selectOne("insaSQL.checkHP", hp);
	}
	
	public void regEmp(InsaVO insaVO) {
		sqlSession.insert("insaSQL.addEmp", insaVO);
	}
	
	public InsaVO getEmpInfo(int sabun) {
		return sqlSession.selectOne("insaSQL.getInsaInfo", sabun);
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
	
	public int cntEmps(InsaVO insaVO) {
		return sqlSession.selectOne("insaSQL.cntEmps", insaVO);
	}
	
	public List<InsaVO> getEmpList(InsaVO insaVO) {
		return sqlSession.selectList("insaSQL.getEmpList", insaVO);
	}
	
	public int cntInputs(InsaVO insaVO) {
		return sqlSession.selectOne("insaSQL.cntInputs", insaVO);
	}
	
	public List<InsaInputVO> getInputYNList(int sabun) {
		return sqlSession.selectList("insaSQL.input_YN_List", sabun);
	}
	
	public int cntCarriers(InsaVO insaVO) {
		return sqlSession.selectOne("insaSQL.cntCarriers", insaVO);
	}
	
	public List<InsaCarrierVO> getCarrierList(int sabun) {
		return sqlSession.selectList("insaSQL.carrierList", sabun);
	}
	
	public int cntAcads(InsaVO insaVO) {
		return sqlSession.selectOne("insaSQL.cntAcads", insaVO);
	}
	
	public List<InsaAcadVO> getAcadList(int sabun) {
		return sqlSession.selectList("insaSQL.acadList", sabun);
	}
	
	public void addInput(InsaInputVO inputVO) {
		sqlSession.insert("insaSQL.addInput", inputVO);
	}
	
	public void addCarrier(InsaCarrierVO carrierVO) {
		sqlSession.insert("insaSQL.addCarrier", carrierVO);
	}
	
	public void addAcad(InsaAcadVO acadVO) {
		sqlSession.insert("insaSQL.addAcad", acadVO);
	}
	
	public void editInputInfo(InsaInputVO inputVO) {
		sqlSession.update("insaSQL.editInputInfo", inputVO);
	}
	
	public void editCarrier(InsaCarrierVO carrierVO) {
		sqlSession.update("insaSQL.editCarrier", carrierVO);
	}
	
	public void editAcad(InsaAcadVO acadVO) {
		sqlSession.update("insaSQL.editAcad", acadVO);
	}
	
	public void copyInputToDel(InsaInputVO inputVO) {
		sqlSession.insert("insaSQL.copyInputToDel", inputVO);
	}
	
	public void copyCarrierToDel(InsaCarrierVO carrierVO) {
		sqlSession.insert("insaSQL.copyCarrierToDel", carrierVO);
	}
	
	public void copyAcadToDel(InsaAcadVO acadVO) {
		sqlSession.insert("insaSQL.copyAcadToDel", acadVO);
	}
	
	public void delInput(InsaInputVO inputVO) {
		sqlSession.delete("insaSQL.delInput", inputVO);
	}
	
	public void delCarrier(InsaCarrierVO carrierVO) {
		sqlSession.delete("insaSQL.delCarrier", carrierVO);
	}
	
	public void delAcad(InsaAcadVO acadVO) {
		sqlSession.delete("insaSQL.delAcad", acadVO);
	}
}