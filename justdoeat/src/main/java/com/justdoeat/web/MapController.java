package com.justdoeat.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MapController {
	
	@RequestMapping("/search.map")
	public String mapSearch(HttpSession session, String food, Model model) {
		System.out.println("food : " + food);
		model.addAttribute("food", food);
		return "map";
	}
	
	@RequestMapping("/map")
	public String mapview() {
		return "map";
	}
	
}
