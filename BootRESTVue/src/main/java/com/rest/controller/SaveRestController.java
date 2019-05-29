package com.rest.controller;

import java.util.ArrayList;
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

import com.mybatis.service.FoodService;
import com.mybatis.service.MemberService;
import com.mybatis.service.SaveService;
import com.mybatis.vo.Food;
import com.mybatis.vo.Nutri;
import com.mybatis.vo.Save;


@CrossOrigin(origins={"*"}, maxAge=6000)
@RestController
public class SaveRestController {
	
	@Autowired
	SaveService service;
	
	@Autowired
	FoodService fservice;
	
	@Autowired
	MemberService mservice;
	
	@RequestMapping(value = "/save", method = RequestMethod.POST,
			produces= {"application/json;charset=euc-kr"})
	public Map insert(@RequestBody Save b) {
		System.out.println(b);
		service.insert(b);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result", "insert success");
		return map;
	}
	
	@RequestMapping(value = "/save/{fcode}/{mcode}", method = RequestMethod.DELETE)
	public String delete(@PathVariable String fcode, @PathVariable String mcode) {
		service.delete(fcode, mcode);
		System.out.println("delete 수행됨");
		return "delete success";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.GET)
	public List<Save> selectAll() {
		return service.selectAll();
	}
	
	@RequestMapping(value = "/save/get/{id}", method = RequestMethod.GET)
	public String saveGet(@PathVariable String id) {
		String mcode = mservice.searchMcodeById(id);
		System.out.println("mCODE 가져옴" + mcode);
		return mcode;
	}

	@RequestMapping(value = "/save/{id}", method = RequestMethod.GET)
	public List<Food> FoodList(@PathVariable String id) {
		
		String mcode = mservice.searchMcodeById(id);
		System.out.println("eatlist controller");
		System.out.println("mcode : " + mcode);
		
		List<String> list = service.selectMFoodList(mcode);
		
		System.out.println("list size : " + list.size());
		
		List<Food> flist = new ArrayList<>();
		
		System.out.println("넣기 전 : " + flist.size());
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
			flist.add(fservice.selectOne(list.get(i)));
		}
		
		System.out.println("넣은 후 : " + flist.size());
		
		for (int i = 0; i < flist.size(); i++) {
			System.out.println(flist.get(i));
		}
		
		return flist;
	}
	
	@RequestMapping(value = "/save/nutri/{id}", method = RequestMethod.GET)
	public List<Nutri> NutriList(@PathVariable String id) {
		String mcode = mservice.searchMcodeById(id);
		List<String> list = service.selectMFoodList(mcode);
		System.out.println("확인=======================================");
		
		List<Food> foods = new ArrayList<Food>();
		
		for (int i = 0; i < list.size(); i++) {
			foods.add(fservice.selectOne(list.get(i)));
		}
		
		double cal = 0;
		double car = 0;
		double pro = 0;
		double fat = 0;
		
		List<Nutri> ret = new ArrayList<Nutri>();
		for (int i = 0; i < foods.size(); i++) {
			cal += (Math.round(Double.parseDouble(foods.get(i).getCalory()) * 100) / 100.0);
			car += (Math.round(Double.parseDouble(foods.get(i).getCarbo()) * 100) / 100.0);
			pro += (Math.round(Double.parseDouble(foods.get(i).getProtein()) * 100) / 100.0);
			fat += (Math.round(Double.parseDouble(foods.get(i).getFat()) * 100) / 100.0);
		}
		
		ret.add(new Nutri("calorie", cal, 2100, 2600));
		ret.add(new Nutri("carbo", car, 500, 500));
		ret.add(new Nutri("protein", pro, 50, 65));
		ret.add(new Nutri("fat", fat, 25, 25));
		
		// 인쇄
		for (int i = 0; i < ret.size(); i++) {
			System.out.println("데이터 확인");
			System.out.println(ret.get(i));
		}
		
		return ret;
	}
}