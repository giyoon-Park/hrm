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
	
	// 각 선택지에 필요한 항목을 불러오는 함수
	public List<InsaComVO> getComList() {
		List<InsaComVO> list = dao.getComList();
		return list;
	}
	
	// 아이디 체크 함수
	public int checkID(String id) {
		int cnt = 0;
		cnt = dao.checkID(id);
		return cnt;
	}
	
	// 날짜 view용(String 타입)으로 변환 함수
	public DateParser dbToViewString(DateParser vo) {
		vo.db_to_view_format();
		return vo;
	}
	
	// 직원 등록 처리 함수
	public void regEmp(InsaVO insaVO) {
		dao.regEmp(insaVO);
	}
	
	// 이미지를 저장할 함수
	public InsaVO uploadImg(InsaVO insaVO,ImgVO imgVO, HttpSession session) {
		if(!imgVO.getProfileimg().isEmpty()) {
			HashMap<String, String> map = uploadfile.getNames(session, imgVO.getProfileimg(), "profile");
			insaVO.setOri_profile(map.get("oriname"));
			insaVO.setProfile(map.get("savename"));
		}
		if(!imgVO.getCmp_reg_img().isEmpty()) {
			HashMap<String, String> map = uploadfile.getNames(session, imgVO.getCmp_reg_img(), "cmp_reg");
			insaVO.setOri_cmp_reg_img(map.get("oriname"));
			insaVO.setCmp_reg_image(map.get("savename"));
		}
		if(!imgVO.getResume_img().isEmpty()) {
			HashMap<String, String> map = uploadfile.getNames(session, imgVO.getResume_img(), "carrier");
			insaVO.setOri_carrier(map.get("oriname"));
			insaVO.setCarrier(map.get("savename"));
		}
		
		return insaVO;
	}
	
	// 직원 조회 페이지에서 검색 결과와 일치하는 직원 수를 불러오는 함수
	public int cntEmp(InsaVO insaVO) {
		return dao.cntEmps(insaVO);
	}
	
	public PageUtil pageSetting(InsaVO insaVO, PageUtil page, int totalCont) {
		if(page.getNowPage() == 0) {
			page.setNowPage(1);
		}
		
		int totalCount = totalCont;
		page.setPage(page.getNowPage(), totalCount);
		
		return page;
	}
	
	// 직원 조회 페이지에서 검색 결과와 일치하는 직원 목록을 불러오는 함수
	public List<InsaVO> empList(InsaVO insaVO, PageUtil page) {
		insaVO.setStartCont(page.getStartCont());
		insaVO.setEndCont(page.getEndCont());
		
		List<InsaVO> list = dao.getEmpList(insaVO);
		
		for (InsaVO vo : list) {
			vo = (InsaVO) dbToViewString(vo);
		}
		
		return list;
	}
	
	// 특정 직원의 정보를 불러오는 함수
	public InsaVO empInfo(int sabun) {
		InsaVO insaVO = dao.getEmpInfo(sabun);
		insaVO = (InsaVO)dbToViewString(insaVO);
		return insaVO;
	}
	
	// 특정 직원의 정보를 수정하는 함수
	public void editEmpInfo(InsaVO insaVO) {
		dao.editEmp(insaVO);
	}
	
	// 특정 직원의 투입 가능 정보 수를 불러오는 함수
	public int cntInputs(InsaVO insaVO) {
		return dao.cntInputs(insaVO);
	}
	
	// 특정 직원의 투입 가능 정보 리스트를 불러오는 함수
	public List<InsaInputVO> empInputList(int sabun) {
		List<InsaInputVO> list = dao.getInputYNList(sabun);
		
		for (InsaInputVO insaInputVO : list) {
			insaInputVO = (InsaInputVO)dbToViewString(insaInputVO);
		}
		
		return list;
	}
	
	// 특정 직원의 학력사항 정보 수를 불러오는 함수
	public int cntAcads(InsaVO insaVO) {
		return dao.cntAcads(insaVO);
	}
	
	// 특정 직원의 학력사항 리스트를 불러오는 함수
	public List<InsaAcadVO> empAcadList(int sabun) {
		List<InsaAcadVO> list = dao.getAcadList(sabun);
		return list;
	}
	
	// 특정 직원의 경력사항 정보 수를 불러오는 함수
	public int cntCarriers(InsaVO insaVO) {
		return dao.cntCarriers(insaVO);
	}
	
	// 특정 직원의 경력사항 리스트를 불러오는 함수
	public List<InsaCarrierVO> empCarrierList(int sabun) {
		List<InsaCarrierVO> list = dao.getCarrierList(sabun);
		
		for (InsaCarrierVO insaCarrierVO : list) {
			insaCarrierVO = (InsaCarrierVO)dbToViewString(insaCarrierVO);
		}
		
		return list;
	}
	
	// 직원의 투입 가능 정보를 추가하는 함수
	public void addInputCol(InsaInputVO inputVO) {
		dao.addInput(inputVO);
	}
	
	// 직원의 학력사항 정보를 추가하는 함수
	public void addAcadCol(InsaAcadVO acadVO) {
		dao.addAcad(acadVO);
	}
	
	// 직원의 경력사항 정보를 추가하는 함수
	public void addCarrierCol(InsaCarrierVO carrierVO) {
		dao.addCarrier(carrierVO);
	}
	
	// 직원의 투입 가능 정보를 수정하는 함수
	public void editInputInfo(InsaInputVO inputVO) {
		dao.editInputInfo(inputVO);
	}
	
	// 직원의 학력사항 정보를 수정하는 함수
	public void editAcad(InsaAcadVO acadVO) {
		dao.addAcad(acadVO);
	}
	
	// 직원의 경력사항 정보를 수정하는 함수
	public void editCarrier(InsaCarrierVO carrierVO) {
		dao.editCarrier(carrierVO);
	}
	
	// 직원의 전체 정보를 삭제하는 함수
	public void delEmp(InsaVO insaVO) {
		InsaInputVO input = new InsaInputVO();
		InsaCarrierVO carrier = new InsaCarrierVO();
		InsaAcadVO acad = new InsaAcadVO();
		
		input.setSabun(insaVO.getSabun());
		carrier.setSabun(insaVO.getSabun());
		acad.setSabun(insaVO.getSabun());
		
		dao.copyInputToDel(input);
		dao.copyCarrierToDel(carrier);
		dao.copyAcadToDel(acad);
		dao.copyEmpToDel(insaVO);
		
		dao.delInput(input);
		dao.delCarrier(carrier);
		dao.delAcad(acad);
		dao.delEmp(insaVO);
	}
	
	// 직원의 투입 가능 정보를 삭제하는 함수
	public void delInputCol(InsaInputVO inputVO) {
		dao.copyInputToDel(inputVO);
		dao.delInput(inputVO);
	}
	
	// 직원의 학력사항 정보를 삭제하는 함수
	public void delAcadCol(InsaAcadVO acadVO) {
		dao.copyAcadToDel(acadVO);
		dao.delAcad(acadVO);
	}
	
	// 직원의 경력사항 정보를 삭제하는 함수
	public void delCarrierCol(InsaCarrierVO carrierVO) {
		dao.copyCarrierToDel(carrierVO);
		dao.delCarrier(carrierVO);
	}
}