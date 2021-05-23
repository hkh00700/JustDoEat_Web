package com.justdoeat.web;

import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import common.CommonService;
import member.MemberDTO;
import member.MemberServiceImpl;
import member.MemberVO;


@Controller

public class MemberController {
	
	@Autowired private MemberServiceImpl service;
	private String naver_client_id = "114sQ5mbj3x9mYKxZzTG";
	private String kakao_client_id = "23131123459d1706b5e9208981fae0b6";
	
	//마이페이지 이동
	@RequestMapping("/mypage")
	public String mypage() {
		return "member/mypage";
	}
	


		

	//카카오로그인 요청
	@RequestMapping("/kakaoLogin")
	public String kakaoLogin(HttpSession session) {

		
		String state = UUID.randomUUID().toString();
		session.setAttribute("state", state);
		
		StringBuffer url = new StringBuffer(
			"https://kauth.kakao.com/oauth/authorize?response_type=code");
		url.append("&client_id=").append(kakao_client_id);
		url.append("&redirect_uri=")
			.append("http://localhost:9090/web/kakaocallback");
		url.append("&state=").append(state);
		
		return "redirect:" + url.toString();
	}
	
	@RequestMapping("/kakaocallback")
	public String kakaocallback(HttpSession session, String state
			, @RequestParam(required = false) String code
			, @RequestParam(required = false) String error) {
		
		String token = (String)session.getAttribute("state");
		if( !token.equals(state) || error!=null ) {
			return "redirect:/";
		}
			
		StringBuffer url = new StringBuffer(
			"https://kauth.kakao.com/oauth/token?grant_type=authorization_code");
		url.append("&client_id=").append(kakao_client_id);
		url.append("&code=").append(code);
		
		JSONObject json = new JSONObject( common.requestAPI(url) );
		String token_type = json.getString("token_type");
		String access_token = json.getString("access_token");
		
		url = new StringBuffer(
				"https://kapi.kakao.com/v2/user/me");
		json = new JSONObject ( 
			common.requestAPI(url, token_type + " " + access_token) );
		
		if( !json.isEmpty() ) {
			MemberVO vo = new MemberVO();
			
			json = json.getJSONObject("kakao_account");
			
			vo.setM_nickname( json.getJSONObject("profile").getString("nickname")   );
			vo.setM_email( json.getString("email") );
			vo.setM_gender( json.getString("gender")
								.equals("female") ? "여" : "남" );
		
			
			if( service.member_social_id(vo) )
				service.member_social_update(vo);
			else {
				
				service.member_social_insert(vo);
			}
			session.setAttribute("loginInfo", vo);
		}
		
		return "redirect:/";
	}
	
	
		@RequestMapping("/navercallback")
		public String naverCallback(HttpSession session, String state
					, @RequestParam(required = false) String code 
					, @RequestParam(required = false) String error) {

		
			String token = (String)session.getAttribute("state");
			if( !token.equals(state) || error!=null ) {
				return "redirect:/";
			}
			
			StringBuffer url = new StringBuffer(
				"https://nid.naver.com/oauth2.0/token?grant_type=authorization_code");
			url.append("&client_id=").append(naver_client_id);
			url.append("&client_secret=").append("Qr9JX2hDbR");
			url.append("&code=").append(code);
			url.append("&state=").append(state);
			JSONObject json = new JSONObject( common.requestAPI(url) );
			String access_token = json.getString("access_token");
			String token_type = json.getString("token_type");
			
			url = new StringBuffer(
					"https://openapi.naver.com/v1/nid/me");
			json = new JSONObject(common.requestAPI(url, token_type + " " + access_token));
			if( json.getString("resultcode").equals("00") ) {
			
				json = json.getJSONObject("response");
				System.out.println("json : " + json);
				MemberVO vo = new MemberVO();
				vo.setM_gender( json.getString("gender").equals("F") 
						? "�뿬" : "�궓");
				vo.setM_nickname(json.getString("nickname"));
				vo.setM_name( json.has("name") ? json.getString("name") : "" );
				vo.setM_id(json.getString("id"));
				vo.setM_email(json.getString("email") );
				
				if( service.member_social_id(vo) ) 
					service.member_social_update(vo);
				else  
					service.member_social_insert(vo);
				
				session.setAttribute("loginInfo", vo);
			}
			
			return "redirect:/";
		}
		
	@Autowired private CommonService common;
	
	@RequestMapping("/naverLogin")
	public String naverlogin(HttpSession session) {
		
		String state = UUID.randomUUID().toString();
		session.setAttribute("state", state);
		
		StringBuffer url = new StringBuffer(
			"https://nid.naver.com/oauth2.0/authorize?response_type=code");
		url.append("&client_id=").append(naver_client_id);
		url.append("&state=").append(state);
		url.append("&redirect_uri=")
			.append("http://localhost:9090/web/navercallback");
		
		return "redirect:" + url.toString();
	}


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
		System.out.println("아이디 비번: "+ m_id + m_pw);
		MemberVO vo = service.member_login(map);
		System.out.println("vo : " + vo);
		System.out.println(vo.getM_nickname());
		session.setAttribute("loginInfo", vo);

		System.out.println(vo.getM_nickname());

		return vo==null ? false : true;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("category");

		session.removeAttribute("loginInfo");

			return "redirect:/";
	}
	
	@ResponseBody @RequestMapping("/id_check")
	public boolean id_check(String id) {
		return service.member_id_check(id);
	}
	
	@ResponseBody @RequestMapping(value="/join"
						, produces="text/html; charset=utf-8" )
	public String join(MemberVO vo, HttpServletRequest request
							, HttpSession session) {
		StringBuffer msg = new StringBuffer(
				"<script type='text/javascript'>");
		
		service.member_join(vo);
		if( service.member_join(vo)==1 ) {
			msg.append("alert('�쉶�썝媛��엯�쓣 異뺥븯�빀�땲�떎^^'); location='"
							+ request.getContextPath() + "'; ");
		}else {
			msg.append("alert('�쉶�썝媛��엯 �떎�뙣�뀪�뀪'); location='member'; ");	
		}
		msg.append("</script>");
		return msg.toString();
	}
	
	
	@RequestMapping("/memberjoin")
	public String member(HttpSession session) {
		session.setAttribute("category", "join");
		return "member/join";
	}
		
	
	
}
