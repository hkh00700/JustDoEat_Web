package com.justdoeat.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import admin.CustomerServicelmp;
import admin.CustomerVO;

@Controller
public class AdminController {
	
	@Autowired private CustomerServicelmp service;

	@RequestMapping("/list.ad")
	public String admin(HttpSession session ) {
		session.setAttribute("category", "ad");
		return "admin/list";
		
	}
	
	//회원 검색
	@RequestMapping("/search.ad")
	public String search(HttpSession session, Model model, String search, String keyword) {
		CustomerVO vo = new CustomerVO();
		vo.setSearch(search);
		vo.setKeyword(keyword);
		
		model.addAttribute("list", service.customer_search(vo));
		return "admin/member";
	}
	//회원 삭제
	@RequestMapping("/delete.ad")
	public String delete(HttpSession session, int m_uq) {
		service.customer_delete(m_uq);
		return "redirect:member.ad";
	}
	
	//회원 수정
	@RequestMapping("/update.ad")
	public String update(CustomerVO vo) {
		service.customer_update(vo);
		return "redirect:member.ad";
	}
	
	
	//회원상세화면 조회
	@RequestMapping("/detail.ad")
	public String member_detail(HttpSession session, Model model, int m_uq) {
		System.out.println(m_uq);
		model.addAttribute("vo", service.customer_detail(m_uq));
		return "admin/detail";
	}
	
	//회원전체목록 조회
	@RequestMapping("/member.ad")
	public String member_ad(HttpSession session, Model model) {
		session.setAttribute("ad_category", "member");
		model.addAttribute("list", service.customer_list());
		
		return"admin/member";
	}
}
