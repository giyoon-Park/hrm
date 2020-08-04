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
		
		mv.clear();
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
	@RequestMapping("/insaUpdateForm.do")
	public ModelAndView showUpdateForm(ModelAndView mv, InsaVO insaVO, InsaAcadVO acadVO, InsaCarrierVO carrierVO, InsaInputVO inputVO) {
		String view = "jsp/insaUpdateForm";
		List<InsaComVO> list = comSrvc.getComList();
		
		mv.addObject("COMLIST", list);
		mv.setViewName(view);
		return mv;
	}
}
