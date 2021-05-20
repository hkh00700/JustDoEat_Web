package com.justdoeat.web;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import member.MemberServiceImpl;
import member.MemberVO;


@Controller

public class MemberController {
	
	@Autowired private MemberServiceImpl service;

	
	@RequestMapping("/login")
	public String login(HttpSession session) {
		session.setAttribute("category", "login");
		return "member/login";
	}
	
	

	@ResponseBody @RequestMapping("/eatLogin")
	public boolean login(String m_id, String m_pw, HttpSession session) {
		
		HashMap<String, String> map 
				= new HashMap<String, String>();
		map.put("m_id", m_id);
		map.put("m_pw", m_pw);
		MemberVO vo = service.member_login(map);
		
		session.setAttribute("loginInfo", vo);
		
		return vo==null ? false : true;
	}
	
	
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("category");

		session.removeAttribute("loginInfo");


			return "redirect:/";
	}
	
		
	
	
}
