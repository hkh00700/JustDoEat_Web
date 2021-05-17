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
		//화면에서 입력한 아이디/비번이 일치하는 회원정보가 DB에 존재하는지
		//판단하여 존재하면 로그인처리, 
		//       존재하지 않으면 아이디나 비번이 불일치
		HashMap<String, String> map 
				= new HashMap<String, String>();
		map.put("m_id", m_id);
		map.put("m_pw", m_pw);
		MemberVO vo = service.member_login(map);
		//로그인 정보를 세션에 담는다.
		session.setAttribute("loginInfo", vo);
		
		return vo==null ? false : true;
	}
	
	
	//로그아웃처리 요청
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("category");
		
		//카카오로그인한 경우 카카오계정도 함께 로그아웃
//		String social 
//				= ((MemberVO)session.getAttribute("loginInfo"))
//					.getSocial_type();
		
		session.removeAttribute("loginInfo");

//		if( social!=null && social.equals("kakao")) {
//			//curl -v -X GET "https://kauth.kakao.com/oauth/logout?
//			//client_id={YOUR_REST_API_KEY}
//			//&logout_redirect_uri={YOUR_LOGOUT_REDIRECT_URI}"
//			StringBuffer url = new StringBuffer(
//					"https://kauth.kakao.com/oauth/logout?");
//			url.append("client_id=").append(kakao_client_id);
//			url.append("&logout_redirect_uri=")
//						.append("http://localhost/smart");
//			return "redirect:" + url.toString();
//		}else
			return "redirect:/";
	}
	
		
	
	
}
