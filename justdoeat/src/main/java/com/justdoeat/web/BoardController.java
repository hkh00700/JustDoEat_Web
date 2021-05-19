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
//	//방명록 첨부파일 다운로드처리 요청
//	@ResponseBody @RequestMapping("/download.bo")
//	public vono download(int no, HttpSession session
//							, HttpServletResponse response) {
//		BoardVO vo = service.board_detail(no);
//		common.fileDownload(session, response
//					, vo.getFilename(), vo.getFilepath());
//	}
	
	//방명록 상세화면 요청
	@RequestMapping("/detail.bo")
	public String detail(int no, Model model) {
		//선택한 글의 정보를 DB에서 조회해와 상세화면에 출력
		service.board_read(no);
		model.addAttribute("vo", service.board_detail(no));
		model.addAttribute("crlf", "\r\n");
		model.addAttribute("page", page);
		return "board/detail";
	}
	
	
	//신규 방명록 글 저장처리 요청
	@RequestMapping("/insert.bo")
	public String insert(BoardVO vo, HttpSession session
							, MultipartFile file) {
		//첨부파일이 있는 경우 파일을 업로드
		if( ! file.isEmpty() ) {
			vo.setS_photo( file.getOriginalFilename() );
			vo.setS_photo_path( 
				common.fileUpload("board", file, session) );
		}
		//화면에서 입력한 정보를 DB에 저장한 후 목록화면으로 연결
		vo.setWriter( 
			((MemberVO)session.getAttribute("loginInfo")).getM_id() 
		);
		service.board_insert(vo);
		return "redirect:list.bo";
	}
	
	
	
	//신규 방명록쓰기 화면 요청
	@RequestMapping("/new.bo")
	public String board() {
		return "board/new";
	}
	
	
	@Autowired private BoardPage page;
	//방명록 목록화면 요청
	@RequestMapping("/list.bo")
	public String list(HttpSession session
			, @RequestParam(defaultValue="10") int pageList
			, @RequestParam(defaultValue="list") String viewType
			, String search, String keyword
			, @RequestParam(defaultValue="1") int curPage
			, Model model) {
		session.setAttribute("category", "bo");
		//DB에서 방명록 정보를 조회해와 목록화면에 출력 
		page.setCurPage(curPage);
		page.setSearch(search);
		page.setKeyword(keyword);
		page.setPageList(pageList);
		page.setViewType(viewType);
		model.addAttribute("page", service.board_list(page));
		return "board/list";
	}
	
}
