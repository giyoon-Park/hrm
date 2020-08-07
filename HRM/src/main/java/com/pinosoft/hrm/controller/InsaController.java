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
import javax.servlet.http.*;

@Controller
public class InsaController {
	@Autowired
	ComService comSrvc;
	
	// 메인페이지
	@RequestMapping("/index.do")
	public ModelAndView showMain(ModelAndView mv) {
		String view = "jsp/index";
		mv.setViewName(view);
		return mv;
	}
	
	// 직원 리스트페이지
	@RequestMapping("/insaListForm.do")
	public ModelAndView showSearchList(ModelAndView mv) {
		String view = "jsp/insaListForm";
		List<InsaComVO> list = comSrvc.getComList();
		
		mv.addObject("COMLIST", list);
		mv.setViewName(view);
		return mv;
	}
	
	// 직원 조회리스트
	@RequestMapping("/emp.search")
	@ResponseBody
	public HashMap<String, Object> showSearchList(InsaVO insaVO, PageUtil page) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int totalCont = comSrvc.cntEmp(insaVO);
		page = comSrvc.pageSetting(insaVO, page, totalCont);
		List<InsaVO> list = comSrvc.empList(insaVO, page);
		map.put("LIST", list);
		map.put("PAGE", page);
		return map;
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
	
	// 아이디 체크
	@RequestMapping("/id.ck")
	@ResponseBody
	public int checkID(String id) {
		int cnt = comSrvc.checkID(id);
		
		return cnt;
	}
	
	// 직원 수정페이지
	@RequestMapping("/insaUpdateForm.do/{sabun}")
	public ModelAndView showUpdateForm(ModelAndView mv, @RequestParam("ssabun") @PathVariable int sabun) {
		String view = "jsp/insaUpdateForm";
		List<InsaComVO> list = comSrvc.getComList();
		InsaVO insaVO = comSrvc.empInfo(sabun);
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		List<InsaInputVO> inputList = comSrvc.empInputList(sabun);
		List<InsaAcadVO> acadList = comSrvc.empAcadList(sabun);
		List<InsaCarrierVO> carrierList = comSrvc.empCarrierList(sabun);
		
		map.put("input", comSrvc.cntInputs(insaVO));
		map.put("carrier", comSrvc.cntCarriers(insaVO));
		map.put("acad", comSrvc.cntAcads(insaVO));
		
		mv.addObject("COMLIST", list);
		mv.addObject("EMPINFO", insaVO);
		mv.addObject("INPUTLIST", inputList);
		mv.addObject("ACADLIST", acadList);
		mv.addObject("CARRIERLIST", carrierList);
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
		
		req.setAttribute("sabun", sabun);
		mv.setView(new RedirectView("/hrm/insaUpdateForm.do"));
		return mv;
	}
}
