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

import com.mybatis.service.EatlistService;
import com.mybatis.service.FoodService;
import com.mybatis.service.MemberService;
import com.mybatis.vo.Alrank;
import com.mybatis.vo.Eatlist;
import com.mybatis.vo.Food;


//@RestController = @Controller + @ResponseBody
//@Controller
@CrossOrigin(origins={"*"}, maxAge=6000)
@RestController
public class EatlistRestController {

	//http://localhost:8080/rest/customers
	
	@Autowired
	EatlistService service;
	
	@Autowired
	FoodService fservice;
	
	@Autowired
	MemberService mservice;

	@RequestMapping(value = "/Eatlist", method = RequestMethod.POST,
			produces= {"application/json;charset=euc-kr"})
	public Map insert(@RequestBody Eatlist b) {
		System.out.println(b);
		service.insert(b);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result", "insert success");
		return map;
	}
	
	@RequestMapping(value = "/Eatlist/{mcode}/{fcode}", method = RequestMethod.DELETE)
	public String delete(@PathVariable String mcode, @PathVariable String fcode) {
		service.delete(mcode, fcode);
		return "delete success";
	}
	
	@RequestMapping(value = "/Eatlist", method = RequestMethod.GET)
	public List<Eatlist> selectAll() {
		return service.selectAll();
	}
	/*
	@RequestMapping(value = "/Eatlist/{mcode}", method = RequestMethod.GET,
			produces= {"application/json;charset=euc-kr"})
	public List<String> selectMFoodList(@PathVariable String mcode) {
		return service.selectMFoodList(mcode);
	}*/
	
	@RequestMapping(value = "/Eatlist/{id}", method = RequestMethod.GET)
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
	
	@RequestMapping(value = "/Eatlist/get/{id}", method = RequestMethod.GET)
	public String eatlistGet(@PathVariable String id) {
		String mcode = mservice.searchMcodeById(id);
		System.out.println("mCODE 가져옴" + mcode);
		return mcode;
	}
	
	@RequestMapping(value = "/Eatlist/allergy/{id}", method = RequestMethod.GET)
    public List<Alrank> allergyFunc(@PathVariable String id) {
        List<Alrank> ret = new ArrayList<>();
        
        // mcode 가져오기
        String mcode = mservice.searchMcodeById(id);
        List<String> x = service.selectMFoodMaterial(mcode); // eatlist에 추가된 상품의 "원재료"
        List<String> y = mservice.allAllergy(id);     // "알러지 성분"
        
      //  Map<String, Alrank2> map = new Map<>();
        
        for (int i = 0; i < y.size(); i++) {
            int cnt = 0;
            
            for (int j = 0; j < x.size(); j++) {
                String z = x.get(j);
                if (z.contains(y.get(i))) {
                    cnt++;
                }
            }
            
            ret.add(new Alrank(y.get(i), cnt));
        }
        return ret;
    }
    
	@RequestMapping(value = "/Eatlist/getfood/{id}", method = RequestMethod.GET)
    public List<String> allergyName(@PathVariable String id) {
        List<String> ret = new ArrayList<>();
        
        // mcode 가져오기
        String mcode = mservice.searchMcodeById(id);
        List<String> food = service.selectMFoodList(mcode);
        List<String> x = service.selectMFoodMaterial(mcode); // eatlist에 추가된 상품의 "원재료"
        List<String> y = mservice.allAllergy(id);     // "알러지 성분"
        
      //  Map<String, Alrank2> map = new Map<>();
        
        for (int i = 0; i < y.size(); i++) {
            
            for (int j = 0; j < x.size(); j++) {
                String z = x.get(j);
                if (z.contains(y.get(i))) {
                	ret.add(food.get(j));
                }
            }
        }
        
        System.out.println("-----ret 결과-----");
        for (int i = 0; i < ret.size(); i++) {
			System.out.println(ret.get(i));
		}
        
        return ret;
    }
}
