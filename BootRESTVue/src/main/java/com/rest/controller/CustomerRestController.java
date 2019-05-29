package com.rest.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.mybatis.service.CustomerService;
import com.mybatis.vo.Customer;

//@RestController = @Controller + @ResponseBody
//@Controller
@RestController
public class CustomerRestController {
	
	//localhost:8080/rest/users
	/*@RequestMapping(value = "/users", method = RequestMethod.GET)
	@ResponseBody
	public String home() {
		
		return "home";
	}*/
	
	//http://localhost:8080/rest/customers
	
	@Autowired
	CustomerService service;
	
	@RequestMapping(value = "/customers", method = RequestMethod.GET)
	public List<Customer> allCustomers() {
		
		return service.selectAll();
	}
	
	@RequestMapping(value = "/customers/{num}", method = RequestMethod.GET)
	public Customer oneUser(@PathVariable String num) {
		
		return service.selectOne(num);
	}
	
	@RequestMapping(value = "/customers/{num}", method = RequestMethod.DELETE)
	public String deleteUser(@PathVariable String num) {
		service.delete(num);
		return "delete success";
	}
	
	@RequestMapping(value = "/customers", method = RequestMethod.POST,
			produces= {"application/json;charset=euc-kr"})
	public Map insertUser(@RequestBody Customer c) {
		service.insert(c);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result", "insert success");
		return map;
	}
	
	@RequestMapping(value = "/customers", method = RequestMethod.PUT,
			produces= {"application/json;charset=euc-kr"})
	public Map updateUser(@RequestBody Customer c) {
		service.update(c);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result", "update success");
		
		return map;
	}
}
