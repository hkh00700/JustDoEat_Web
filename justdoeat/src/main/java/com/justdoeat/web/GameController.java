package com.justdoeat.web;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import game.GameServiceImpl;



@Controller
public class GameController {
	
	@Autowired private GameServiceImpl service;
	
	/*
	@RequestMapping("/list.ga")
	 * public String login(HttpSession session) { session.setAttribute("category",
	 * "login"); return "game/roulette"; }
	 */
	@RequestMapping("/list.ga")
	public String eatSelectRandom(HttpServletRequest req, Model model ) {
		System.out.println("eatSelectRandom()");
		model.addAttribute("edtos", service.eatSelectRandom());
		return "game/roulette";
	
	
	
	
		/*
		 * @RequestMapping("/eatSelectRandom") // (value="/eatSelectRandom", method =
		 * {RequestMethod.GET, RequestMethod.POST}) public String
		 * eatSelectRandom(HttpServletRequest req, Model model ) {
		 * System.out.println("eatSelectRandom()"); model.addAttribute("edtos",
		 * service.eatSelectRandom()); return "game/roulette";
		 */
		
	}
	
	
	
	
}