package com.justdoeat.web;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonArray;

import admin.CustomerServicelmp;
import admin.CustomerVO;
import admin.RestrantServiceImp;
import admin.RestrantVO;
import common.CommonService;

@Controller
public class AdminController {
	
	@Autowired private CustomerServicelmp service;
	@Autowired private RestrantServiceImp rservice;
	@Autowired private CommonService common;

	@RequestMapping("/list.ad")
	public String admin(HttpSession session ) {
		session.setAttribute("category", "ad");
		return "admin/list";
		
	}
	
	//가게 정보 삭제
	@RequestMapping("/r_delete.ad")
	public String s_delete(int r_uq) {
		rservice.ad_restrant_delete(r_uq);
		return "redirect:store.ad";
	}
	
	//가게 정보 수정
	@RequestMapping("/s_modify.ad")
	public String s_modify(RestrantVO vo) {
		rservice.ad_rstrant_modify(vo);
		return"redirect:store.ad";
	}
	
	//가게 상세목록
	@RequestMapping("/s_detail.ad")
	public String s_detail(int r_uq, Model model) {
		model.addAttribute("vo", rservice.ad_restrant_detail(r_uq));
		RestrantVO vo = rservice.ad_restrant_detail(r_uq);
		model.addAttribute("list", service.customer_detail(vo.getM_uq()));
		return "admin/s_detail";
	}
	
	@RequestMapping("/store.ad")
	public String storelist(HttpSession session, Model model ) {
		session.setAttribute("ad_category", "store");
		model.addAttribute("vo", rservice.ad_restrant_list());
		
		return "admin/s_list";
	}
	
	//가게 회원가입 및 DB등록
	@RequestMapping("/rinsert.ad")
	public String rInsert( RestrantVO vo, HttpSession session, MultipartFile imgpath) {
		System.out.println("여기는 들어왔는지.");
		
		 //첨부파일이 있는 경우 파일을 업로드 
		if (!imgpath.isEmpty()) {
				vo.setR_imgpath(common.r_fileUpload(imgpath, session));
			}

			RestrantVO vo2 = new RestrantVO();
			try {
				System.out.println("두번쨰");
				vo2 = common.getJsonData(vo.getR_address());
				System.out.println("세번쨰");
				vo.setR_latitude(vo2.getR_hardness());
				vo.setR_hardness(vo2.getR_latitude());
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
			System.out.println(vo.getR_hardness() + "y값");
			rservice.restrant_join(vo);
		 
		 //나중에 마이페이지로 가게 수정
		 
			
			return "home";
	}
	
	//가게 회원가입 페이지
	@RequestMapping("/restrantJoin.ad")
	public String restrantaddr(int m_uq, Model model) {
		CustomerVO vo = service.customer_detail(m_uq);
		model.addAttribute("vo", vo);
		return "member/restrantJoin";
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
