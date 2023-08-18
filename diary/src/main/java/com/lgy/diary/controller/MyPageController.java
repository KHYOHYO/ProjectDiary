package com.lgy.diary.controller;
//마이페이지
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lgy.diary.dto.MemDto;
import com.lgy.diary.service.MyPageService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MyPageController {
	
	@Autowired
	private MyPageService myPageService;
	
	/* 마이페이지 */
	@RequestMapping("/myPage")
	public String myPageView(@RequestParam("id") String id, Model model,@RequestParam HashMap<String, String> param) {
		log.info("$$$$"+id);
		log.info("@#@#"+param);
		MemDto dto = myPageService.myPageView(param);
		model.addAttribute("myPage", dto);
		return "loginRegister/myPage";
	}
	
	/* 마이페이지 수정 */
	@RequestMapping("/myPageModify")
	public String myPageModify(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# myPageModify");
	    log.info("@@@###"+ param);
	    
	    param.put("id", param.get("id"));
	    param.put("pwd", param.get("pwd"));
	    myPageService.myPageModify(param);
	    
	    log.info("@# myPageView");
	    MemDto dto = myPageService.myPageView(param);
	    log.info("@#@#dto"+dto);
		model.addAttribute("myPage", dto);
		return "loginRegister/myPage";
	}
	
	/* 회원 탈퇴 페이지 */
	@RequestMapping("/memberDeleteView")
	public String memberDeleteView(@RequestParam HashMap<String, String> param, Model model, MemDto dto){
		log.info("@@@### memberDeleteView"+param);
		model.addAttribute("id", param.get("id"));
		model.addAttribute("pwd", dto.getPwd());
		return "loginRegister/memberDeleteView";
	}
		
	/* 회원 탈퇴 */
	@RequestMapping("/memberDelete")
	public String memberDelete(@RequestParam HashMap<String, String> param, RedirectAttributes attr, HttpSession session){
			
		log.info("@memberDelete###param"+param);
		MemDto dto = myPageService.memberPassword(param);

		log.info("@###dto"+dto);
		String pwd = dto.getPwd();

		String check_pwd = param.get("pwd");
		log.info("@###check_pwd=>"+check_pwd);
		if (pwd.equals(check_pwd)) {
			myPageService.memberDelete(param);
			session.invalidate();
			return "redirect:/main";
		}
		
			attr.addAttribute("id", param.get("id"));
			return "redirect:/loginRegister/memberDeleteView";
		}
}