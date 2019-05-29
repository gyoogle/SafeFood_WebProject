package com.rest.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.mybatis.service.EmpService;
import com.mybatis.vo.Emp;

//@RestController = @Controller + @ResponseBody
//@Controller
@CrossOrigin(origins={"*"}, maxAge=6000)
@RestController
public class EmpRestController {
	
	@Autowired
	EmpService service;
	
	//http://localhost:8080/rest/Emps
	@RequestMapping(value = "/emps", method = RequestMethod.GET)
	public List<Emp> allEmps() {
		System.out.println("1111");
		return service.selectAll();
	}

	@RequestMapping(value = "/emps/{id}", method = RequestMethod.GET)
	public Emp oneEmp(@PathVariable String id) {
		return service.selectOne(id);
	}
	
	@RequestMapping(value = "/emps/id/{id}", method = RequestMethod.GET)
	public Emp findEmpById(@PathVariable String id) {
		return service.selectOne(id);
	}

	@RequestMapping(value = "/emps/name/{name}", method = RequestMethod.GET)
	public List<Emp> findEmpByName(@PathVariable String name) {
		return service.findByName(name);
	}
	/*
	, headers= {"Content-type=application/json"}*/
	@RequestMapping(value = "/emps", method = RequestMethod.POST,produces= {"application/json;charset=euc-kr"})
	public Map insertUsers(@RequestBody Emp c) {//@ResponseBody:Request
		service.insert(c);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result", "insert success");
		return map;
	}
}
