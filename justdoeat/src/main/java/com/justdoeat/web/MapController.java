package com.justdoeat.web;


import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MapController {
	
	@RequestMapping("/search.map")
	public String searchMap(String food, Model model, HttpSession session, HttpServletRequest req) {
		System.out.println("맵 음식 : " + food );
		model.addAttribute("food", food);
		req.setAttribute(food, "food");
		return "map";
	}
	
	@RequestMapping("/map")
	public String mapview() {
		return "map";
	}
	
}
