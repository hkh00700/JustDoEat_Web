package com.justdoeat.web;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

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

import admin.AllergyService;
import admin.AllergyServiceImp;
import admin.AllergyVO;
import admin.CustomerServicelmp;
import admin.CustomerVO;
import admin.RestrantServiceImp;
import admin.RestrantVO;
import board.BoardDAO;
import board.BoardServiceImpl;
import board.BoardVO;
import common.CommonService;

@Controller
public class AdminController {
	
	@Autowired private CustomerServicelmp service;
	@Autowired private RestrantServiceImp rservice;
	@Autowired private CommonService common;
	@Autowired private AllergyServiceImp aservice;
	@Autowired private BoardServiceImpl bservice;
	
	@RequestMapping("/list.ad")
	public String admin(HttpSession session ) {
		session.setAttribute("category", "ad");
		return "admin/list";
	}
	
	
	
	//공지글 띄우
	@RequestMapping("/chk.ad")
	public String chk(BoardVO vo) {
		vo.setNotice("Y");
		bservice.board_update(vo);
		return"redirect:notice.ad";
	}
	
	//공지글 해제하기
	@RequestMapping("/nochk.ad")
	public String nochk(BoardVO vo) {
		vo.setNotice("N");
		System.out.println(vo.getNotice());
		bservice.board_update(vo);
		return"redirect:notice.ad";
	}
	
	//공지글 수정하고 띄우기
	@RequestMapping("/noinsert.ad")
	public String noinsert_ad(BoardVO vo) {
		bservice.board_update(vo);
		return "redirect:notice.ad";
	}
	
	//공지글 수정하기
	@RequestMapping("/nomodify.ad")
	public String nomodify_ad(Model model, int no) {
		model.addAttribute("vo", bservice.board_detail(no));
		return "admin/modifyList";
	}
	
	//공지글 띄우기
	@RequestMapping("/notice.ad")
	public String notice_ad(HttpSession session, Model model) {
		session.setAttribute("ad_category", "notice");
		model.addAttribute("vo", bservice.board_detail(1));
		return "admin/noticelist";
	}
	
	//알레르기 검색하기
	@RequestMapping("/a_search")
	public String a_search(Model model,String search, String keyword) {
		AllergyVO list = new AllergyVO();
		list.setSearch(search);
		list.setKeyword(keyword);
		
		model.addAttribute("vo", aservice.search_allergy(list));
		model.addAttribute("search", list);
		return "admin/allergy";
	}
	
	//알레르기 순위 매기기
	@ResponseBody @RequestMapping("/allergyrand.ad")
	public void allrank() {
		List<String> list =aservice.allergyrank();
		String allergy = null;
		for(int i = 0; i < list.size(); i++) {
			allergy += "," + list.get(i);
		}
		
		String[] allergylist = allergy.split(",");
		for(int i = 0; i < allergylist.length; i++) {
			System.out.println(allergylist[i]);
		}
		
	}
	
	//알레르기 삭제
	@RequestMapping("/allergydelete.ad")
	public String admindelete(String a_material) {
		aservice.allergy_delete(a_material);
		return "redirect:allergy.ad";
	}

	
	//알레르기 수정
	@RequestMapping("/allergyinsert.ad")
	public String allergyinsert(String a_material, String a_category) {
		AllergyVO vo = new AllergyVO();
		vo.setA_category(a_category);
		vo.setA_material(a_material);
		
		aservice.allergy_update(vo);
		return"redirect:allergy.ad";
	}

	//알레르기 삽입
	@RequestMapping("/allergyadd.ad")
	public String allergyadd(String material, String category) {
		AllergyVO vo = new AllergyVO();
		vo.setA_category(category);
		vo.setA_material(material);
		aservice.allergy_insert(vo);
		return"redirect:allergy.ad";
	}
	
	@RequestMapping("/allergy.ad")
	public String allergy(HttpSession session, Model model) {
		session.setAttribute("ad_category", "allergy");
		model.addAttribute("vo", aservice.allergy_list());
		return"admin/allergy";

	}
	
	//가게 상제 정보 검색
	@RequestMapping("/r_search")
	public String r_search(String search, String keyword, Model model) {
		RestrantVO list = new RestrantVO();
		list.setSearch(search);
		list.setKeyword(keyword);
		
		model.addAttribute("vo", rservice.ad_restrant_search(list));
		model.addAttribute("search", list);
		
		
		return"admin/s_list";
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
	
	//가게정보
	@RequestMapping("/store.ad")
	public String storelist(HttpSession session, Model model ) {
		session.setAttribute("ad_category", "store");
		model.addAttribute("all", rservice.ad_restrant());
		model.addAttribute("toady_r", rservice.today_rstrant());
		
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
