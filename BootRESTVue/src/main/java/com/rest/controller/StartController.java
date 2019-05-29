package com.rest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class StartController {
	
	@RequestMapping(value = "/start", method = RequestMethod.GET)
	public String start() {
		return "customerRestService"; //jsp파일 명. view 이름
	}
	
}
