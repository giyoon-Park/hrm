package com.pinosoft.hrm.controller;

/**
 * 
 * @author	박기윤
 * @since	2020.07.28
 * @version	v.1.0
 *
 */

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.view.*;
import com.pinosoft.hrm.VO.*;
import com.pinosoft.hrm.service.*;
import com.pinosoft.hrm.util.*;
import java.util.*;
//import java.util.logging.*;
import javax.servlet.http.*;

@Controller
public class InsaController {
	@Autowired
	ComService comSrvc;
	
//	static Logger logger = Logger.getLogger("InsaController.class");
	
	// 메인페이지
	@RequestMapping("/index.do")
	public ModelAndView showMain(ModelAndView mv) {
		String view = "jsp/index";
		mv.setViewName(view);
		return mv;
	}
	
	// 직원 리스트페이지
	@RequestMapping("/insaListForm.do")
	public ModelAndView showSearchList(ModelAndView mv, InsaVO insaVO, PageUtil page) {
		String view = "jsp/insaListForm";
		List<InsaComVO> list = comSrvc.getComList();
		int totalCont = comSrvc.cntEmp(insaVO);
		page = comSrvc.pageSetting(insaVO, page, totalCont);
		List<InsaVO> result = comSrvc.empList(insaVO, page);
		
		mv.addObject("COMLIST", list);
		mv.addObject("PARAM", insaVO);
		mv.addObject("PAGE", page);
		mv.addObject("LIST", result);
		mv.setViewName(view);
		return mv;
	}
	
	// 직원 등록페이지
	@RequestMapping("/insaInputForm.do")
	public ModelAndView showInputForm(ModelAndView mv) {
		String view = "jsp/insaInputForm";
		List<InsaComVO> list = comSrvc.getComList();
		
		mv.addObject("COMLIST", list);
		mv.setViewName(view);
		return mv;
	}
	
	// 직원 등록 처리
	@RequestMapping("/regProc.do")
	public ModelAndView regProc(ModelAndView mv, InsaVO insaVO, ImgVO imgVO, HttpSession session) {
		insaVO = comSrvc.uploadImg(insaVO, imgVO, session);
		comSrvc.regEmp(insaVO);
		
		mv.setView(new RedirectView("/hrm/insaInputForm.do"));
		return mv;
	}
	
	// 아이디 중복 체크
	@RequestMapping("/id.ck")
	@ResponseBody
	public int checkID(String id) {
		int cnt = comSrvc.checkID(id);
		
		return cnt;
	}
	
	// 핸드폰 번호 중복 체크
	@RequestMapping("/hp.ck")
	@ResponseBody
	public int checkHP(String hp) {
		int cnt = comSrvc.checkHP(hp);
		
		return cnt;
	}
	
	// 직원 수정페이지
	@RequestMapping("/insaUpdateForm.do")
	public ModelAndView showUpdateForm(ModelAndView mv, @RequestParam int eno) {
		String view = "jsp/insaUpdateForm";
		List<InsaComVO> comlist = comSrvc.getComList();
		InsaVO insaVO = comSrvc.empInfo(eno);
		insaVO = comSrvc.splitAt(insaVO);
		insaVO = comSrvc.placeComma(insaVO);
		
		int inputs = comSrvc.cntInputs(insaVO);
		int acads = comSrvc.cntAcads(insaVO);
		int carriers = comSrvc.cntCarriers(insaVO);
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("inputs", inputs);
		map.put("acads", acads);
		map.put("carriers", carriers);
		
		List<InsaInputVO> inputlist = comSrvc.empInputList(eno);
		List<InsaAcadVO> acadlist = comSrvc.empAcadList(eno);
		List<InsaCarrierVO> carrierlist = comSrvc.empCarrierList(eno);
		
		mv.addObject("COMLIST", comlist);
		mv.addObject("PARAM", insaVO);
		mv.addObject("INPUT", inputlist);
		mv.addObject("ACAD", acadlist);
		mv.addObject("CARRIER", carrierlist);
		mv.addObject("COUNTS", map);
		mv.setViewName(view);
		return mv;
	}
	
	// 직원 기본 정보 수정 처리
	@RequestMapping("/insaUpdateProc.do")
	public ModelAndView insaUpdateProc(ModelAndView mv, InsaVO insaVO, ImgVO imgVO, HttpServletRequest req) {
		int sabun = insaVO.getSabun();
		HttpSession session = req.getSession();
		
		insaVO = comSrvc.uploadImg(insaVO, imgVO, session);
		comSrvc.editEmpInfo(insaVO);
		
		mv.setView(new RedirectView("/hrm/insaUpdateForm.do?eno=" + sabun));
		return mv;
	}
	
	// 직원 정보 삭제 처리
	@RequestMapping("/insaDeleteProc.do")
	public ModelAndView insaDeleteProc(ModelAndView mv, InsaVO insaVO) {
		comSrvc.delEmp(insaVO);
		mv.setView(new RedirectView("/hrm/index.do"));
		return mv;
	}
}
