package com.rest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


//@RestController = @Controller + @ResponseBody
//@Controller
@RestController
public class HomeController {
	
	//localhost:8080/rest/users
	/*@RequestMapping(value = "/users", method = RequestMethod.GET)
	@ResponseBody //������ �������� �����ִ� json������ �����͸� �ڹ� ��ü�� ��ȯ���� �޶�� ������̼�
	public String home() {
		
		return "home";
	}*/
	
	@RequestMapping(value = "/users", method = RequestMethod.GET)
	public String allUsers() {
		
		return "all users";
	}
	
	@RequestMapping(value = "/users/{id}", method = RequestMethod.GET)
	public String oneUser(@PathVariable String id) {
		
		return "one user : " + id;
	}
	
	@RequestMapping(value = "/users/{id}", method = RequestMethod.DELETE)
	public String deleteUser(@PathVariable String id) {
		
		return "delete user : " + id;
	}
	
	@RequestMapping(value = "/users", method = RequestMethod.POST)
	public String insertUser() {
		
		return "insert user";
	}
	
	@RequestMapping(value = "/users", method = RequestMethod.PUT)
	public String updateUser() {
		
		return "update user";
	}
}
