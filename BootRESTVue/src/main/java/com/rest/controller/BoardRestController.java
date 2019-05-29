package com.rest.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.mybatis.service.BoardService;
import com.mybatis.service.MemberService;
import com.mybatis.vo.Board;
import com.mybatis.vo.Member;
import com.mybatis.vo.passwordResult;


//@RestController = @Controller + @ResponseBody
//@Controller
@CrossOrigin(origins={"*"}, maxAge=6000)
@RestController
public class BoardRestController {
	
	//localhost:8080/rest/users
	/*@RequestMapping(value = "/users", method = RequestMethod.GET)
	@ResponseBody //json
	public String home() {
		
		return "home";
	}*/
	
	//http://localhost:8080/rest/customers
	
	@Autowired
	BoardService service;
	
	@Autowired
	MemberService mservice;
	
	@RequestMapping(value = "/articles", method = RequestMethod.GET)
	public List<Board> allArticles() {
		
		return service.selectAll();
	}
	
	@RequestMapping(value = "/articles/{num}", method = RequestMethod.GET)
	public Board oneArticle(@PathVariable String num) {
		return service.selectOne(num);
	}
	
	@RequestMapping(value = "/articles/{find}/{val}", method = RequestMethod.GET)
	public List<Board> search(@PathVariable String find,@PathVariable String val) {
		String newval = "%" + val + "%";
		if(find.equals("title")) {
			return service.findByTitle(newval);
		}
		else {
			return service.findByName(newval);
		}
		
	}
	
	@RequestMapping(value = "/articles/{num}", method = RequestMethod.DELETE)
	public String deleteArticle(@PathVariable String num) {
		service.delete(num);
		return "delete success";
	}
	
	@RequestMapping(value = "/articles", method = RequestMethod.POST,
			produces= {"application/json;charset=euc-kr"})
	public Map insertArticle(@RequestBody Board b) {
		service.insert(b);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result", "insert success");
		return map;
	}
	
	@RequestMapping(value = "/articles", method = RequestMethod.PUT,
			produces= {"application/json;charset=euc-kr"})
	public Map updateArticle(@RequestBody Board b) {
		service.modify(b);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result", "update success");
		
		return map;
	}
	
	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public ArrayList<Member> allMember() {
		return mservice.search();
	}
	
	@RequestMapping(value = "/member/{id}", method = RequestMethod.GET)
	public Member oneMember(@PathVariable String id) {
		return mservice.searchById(id);
	}
	
	@RequestMapping(value = "/member/tierchange/{id}/{tier}", method = RequestMethod.GET)
    public void tierchange(@PathVariable String id, @PathVariable String tier) {
        System.out.println("id : " + id + " / tier : " + tier);
        mservice.updateTier(id, tier);
    }
	
	@RequestMapping(value = "/member/pwcheck/{id}/{name}", method = RequestMethod.GET)
	public passwordResult pwcheck(@PathVariable String id, @PathVariable String name) {
		Member a = mservice.searchById(id);
		
		System.out.println("실제 이름 : " + a.getName());
		System.out.println("입력 이름 : " + name);
		
		if (a.getName().equals(name)) {

			System.out.println("controller correct");
			return new passwordResult("correct");
		}
		else {
			System.out.println("controller incorrect");
			return new passwordResult("incorrect");
		}
	}
	
	@RequestMapping(value="/member/pwchange/{id}/{pass}", method= RequestMethod.GET)
    public void passChange(@PathVariable String id, @PathVariable String pass) {
        System.out.println("현재 아이디 : " + id);
        System.out.println("현재 패스워드 : " + pass);
        mservice.updateBypass(id, pass);
    }
	
	@RequestMapping(value = "articles/passConfirm/{num}/{passNow}", method = RequestMethod.GET)
	public passwordResult passConfirm(@PathVariable String num, @PathVariable String passNow) {
		Board cur = service.selectOne(num);
		String password = cur.getPass();
		
		System.out.println("입력 받은 패스워드 : " + passNow);
		System.out.println("실제 패스워드 : " + password);
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		if (password.equals(passNow)) {
			System.out.println("correct");
			return new passwordResult("correct");
		}
		else {
			System.out.println("incorrect");
			return new passwordResult("incorrect");

		}
	}
}
