package com.justdoeat.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MapController {
	
	@RequestMapping("/map")
	public String mapview() {
		return "map";
	}
	
}
