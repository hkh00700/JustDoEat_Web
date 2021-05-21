package com.justdoeat.web;

import java.io.File;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	
	
	//방명록 삭제처리 요청
	@RequestMapping("/delete.bo")
	public String delete(int no, HttpSession session, Model model) {
		//첨부파일이 있는 글을 삭제한 경우 해당 파일을 삭제
		BoardVO vo = service.board_detail(no);
		if( vo.getS_photo()!=null ) {
			String uuid = session.getServletContext().getRealPath("resources")
				+ "/" + vo.getS_photo_path();
			File file = new File(uuid);
			if( file.exists() ) file.delete();
		}
		
		//해당 글을 DB에서 삭제한 후 목록화면으로 연결
		service.board_delete(no);
		
		model.addAttribute("url", "list.bo");
		model.addAttribute("page", page);
		return "board/redirect";
	}
	
	
	//방명록 수정저장처리 요청
	@RequestMapping("/update.bo")
	public String update(BoardVO vo, MultipartFile file
						, String attach, Model model
						, HttpSession session) {
		//변경전 방명록 정보를 조회
		BoardVO board = service.board_detail(vo.getNo());
		String uuid = session.getServletContext().getRealPath("resources")
					+ "/" + board.getS_photo_path();
		//첨부파일이 있는 경우
		if( !file.isEmpty() ) {
			vo.setS_photo( file.getOriginalFilename() );
			vo.setS_photo_path( common.fileUpload("board", file, session));
			
			//변경해서 첨부한 경우
			if( board.getS_photo()!=null ) {
				File f = new File(uuid);
				if( f.exists() ) f.delete();
			}
		}else { //첨부파일이 없는 경우
			if( !attach.isEmpty() ) {  //원래첨부된 파일을 사용하는 경우
				vo.setS_photo( board.getS_photo() );
				vo.setS_photo_path( board.getS_photo_path() );
			}else {
				//원래첨부파일이 있었다면 해당파일을 삭제
				if( board.getS_photo()!=null ) {
					File f = new File(uuid);
					if( f.exists() ) f.delete();
				}
			}
		}
		
		//화면에서 변경입력한 정보를 DB에 변경저장한 후 상세화면으로 연결
		service.board_update(vo);
		
		model.addAttribute("no", vo.getNo());
		model.addAttribute("url", "detail.bo");
		return "board/redirect";
//		return "redirect:detail.bo?no=" + vo.getNo();
	}
	
	
	//방명록 수정화면 요청
	@RequestMapping("/modify.bo")
	public String modify(int no, Model model) {
		//해당 글의 정보를 DB에서 조회해와 수정화면에 출력
		model.addAttribute("vo", service.board_detail(no));
		return "board/modify";
	}
	
	
	//방명록 첨부파일 다운로드처리 요청
	@ResponseBody @RequestMapping("/download.bo")
	public void download(int no, HttpSession session
							, HttpServletResponse response) {
		BoardVO vo = service.board_detail(no);
		common.fileDownload(session, response
					, vo.getS_photo(), vo.getS_photo_path());
	}
	
	
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
