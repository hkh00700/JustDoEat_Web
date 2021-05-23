package com.justdoeat.web;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import recommand.RecommandDTO;
import recommand.RecommandServiceimpl;


@Controller
public class HomeController {
	@Autowired private RecommandServiceimpl service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session, Model model) {
		//session.setAttribute("category", "");
		//session.removeAttribute("category");
		String s = null;
		
		//숫자 랜덤으로 뽑기
		while(s == null) {
		int ran = (int)(Math.random()*17) + 1;
		if(ran < 10) {
			s = "0" + ran;
		} else if( ran == 0 ){
			ran = ran + 10;
			s = String.valueOf(ran);
		}
		
		}
		
		
		System.out.println(s + "테이블 숫자값");
		RecommandDTO dto = service.recommand_food(s);
		System.out.println(dto.getFood() + " : 음식이름 ");
		System.out.println(dto.getMaterial() + " : 재료값 ");
		String food = dto.getFood();
		model.addAttribute("food", food);
		return "home";
	}
	
}
