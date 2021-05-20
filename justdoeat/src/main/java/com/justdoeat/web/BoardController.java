package com.justdoeat.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import board.BoardPage;
import board.BoardServiceImpl;
import board.BoardVO;
import common.CommonService;
import member.MemberVO;

@Controller
public class BoardController {
	@Autowired private BoardServiceImpl service;
	@Autowired private CommonService common;
	
	
	
//	
//	@ResponseBody @RequestMapping("/download.bo")
//	public vono download(int no, HttpSession session
//							, HttpServletResponse response) {
//		BoardVO vo = service.board_detail(no);
//		common.fileDownload(session, response
//					, vo.getFilename(), vo.getFilepath());
//	}
	
	@RequestMapping("/detail.bo")
	public String detail(int no, Model model) {
		service.board_read(no);
		model.addAttribute("vo", service.board_detail(no));
		model.addAttribute("crlf", "\r\n");
		model.addAttribute("page", page);
		return "board/detail";
	}
	
	
	@RequestMapping("/insert.bo")
	public String insert(BoardVO vo, HttpSession session
							, MultipartFile file) {
		if( ! file.isEmpty() ) {
			vo.setS_photo( file.getOriginalFilename() );
			vo.setS_photo_path( 
				common.fileUpload("board", file, session) );
		}
		vo.setWriter( 
			((MemberVO)session.getAttribute("loginInfo")).getM_id() 
		);
		service.board_insert(vo);
		return "redirect:list.bo";
	}
	
	
	
	@RequestMapping("/new.bo")
	public String board() {
		return "board/new";
	}
	
	
	@Autowired private BoardPage page;
	@RequestMapping("/list.bo")
	public String list(HttpSession session
			, @RequestParam(defaultValue="10") int pageList
			, @RequestParam(defaultValue="list") String viewType
			, String search, String keyword
			, @RequestParam(defaultValue="1") int curPage
			, Model model) {
		session.setAttribute("category", "bo");
		page.setCurPage(curPage);
		page.setSearch(search);
		page.setKeyword(keyword);
		page.setPageList(pageList);
		page.setViewType(viewType);
		model.addAttribute("page", service.board_list(page));
		return "board/list";
	}
	
}
