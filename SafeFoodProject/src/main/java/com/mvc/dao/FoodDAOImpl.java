package com.mvc.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.mapper.FoodMapper;
import com.mvc.vo.Food;

@Repository
public class FoodDAOImpl implements FoodDAO{

	@Autowired
	FoodMapper Fmapper;
	
	@Override
	public List<Food> selectAll() {
		return Fmapper.selectAll();
	}

	@Override
	public List<Food> search(String name) {
		return Fmapper.search(name);
	}

	@Override
	public Food selectOne(String id) {
		return Fmapper.selectOne(id);
	}

	@Override
	public void insert(Food f) {
		Fmapper.insert(f);
	}

	@Override
	public void delete(String id) {
		Fmapper.delete(id);
	}

	@Override
	public String getIngredient(String f_id) {
		return Fmapper.getIngredient(f_id);
	}

	@Override
	public Food newFood() {
		return Fmapper.newFood();
	}

	@Override
	public List<Food> similarSearch(String f_name) {
		
		List<Food> allList = Fmapper.selectAll(); // 전체 음식리스트 불러오기
		
		List<Food> similar = new ArrayList<Food>();
		
		// 음식을 하나씩 돌면서, 유사한 단어가 있는지 체크하기. 한글자씩 비교해서 60%이상 일치하는 단어만 따로 저장후 return;
		for (int i = 0; i < allList.size(); i++) {
			
			Food f = allList.get(i);
			
			String[] origin = f.getName().split(""); // 원본 단어 한글자씩 자르기
			String[] arr = f_name.split(""); // 검색한 단어 한글자씩 자르기
			
			double length = origin.length; // 전체 글자 수
			double correct = 0.0; // 일치하는 수
			
			if(origin.length != arr.length) { // 같지 않을 때
				
				boolean[] chk = new boolean[origin.length];
				length = arr.length;
				
				for (int j = 0; j < arr.length; j++) {
					
					String s = arr[j];
					
					for (int k = 0; k < origin.length; k++) {
						
						if(s.equals(origin[k]) && !chk[k]) {
							chk[k] = true;
							correct++;
							break;
						}
						
					}
					
				}
				
			}
			
			else { // 같을 때
				for (int j = 0; j < origin.length; j++) {
					if(origin[j].equals(arr[j])) {
						correct++;
					}
				}
			}
			
			System.out.println("length : " + length);
			System.out.println("correct : " + correct);
			double percent = correct / length;
			System.out.println("percent : " + percent);
			if(percent >= 0.6) { // 일치확률이 60%이상 이면
				similar.add(f);
				System.out.println("--------추가!------------");
			}
			
		}
		
		return similar;
	}

	@Override
	public List<Food> Tsearch(String name, String tier) {
		System.out.println("sakjdkalsjdklasjdklas");
		return Fmapper.Tsearch(name, tier);
	}

	@Override
	public List<Food> TsimilarSearch(String f_name, String tier) {
		List<Food> allList = Fmapper.TselectAll2(tier); // 전체 음식리스트 불러오기
		System.out.println("TsimilarSearch : TselectAll 사이즈 " + allList.size() );
		List<Food> similar = new ArrayList<Food>();
		
		// 음식을 하나씩 돌면서, 유사한 단어가 있는지 체크하기. 한글자씩 비교해서 60%이상 일치하는 단어만 따로 저장후 return;
		for (int i = 0; i < allList.size(); i++) {
			
			Food f = allList.get(i);
			
			String[] origin = f.getName().split(""); // 원본 단어 한글자씩 자르기
			String[] arr = f_name.split(""); // 검색한 단어 한글자씩 자르기
			
			double length = origin.length; // 전체 글자 수
			double correct = 0.0; // 일치하는 수
			
			if(origin.length != arr.length) { // 같지 않을 때
				
				boolean[] chk = new boolean[origin.length];
				length = arr.length;
				
				for (int j = 0; j < arr.length; j++) {
					
					String s = arr[j];
					
					for (int k = 0; k < origin.length; k++) {
						
						if(s.equals(origin[k]) && !chk[k]) {
							chk[k] = true;
							correct++;
							break;
						}
						
					}
					
				}
				
			}
			
			else { // 같을 때
				for (int j = 0; j < origin.length; j++) {
					if(origin[j].equals(arr[j])) {
						correct++;
					}
				}
			}
			
			System.out.println("length : " + length);
			System.out.println("correct : " + correct);
			double percent = correct / length;
			System.out.println("percent : " + percent);
			if(percent >= 0.6) { // 일치확률이 60%이상 이면
				similar.add(f);
				System.out.println("--------추가!------------");
			}
			
		}
		return similar;
	}

	@Override
	public List<Food> TselectAll(String tier) {
		return Fmapper.TselectAll(tier);
	}

	@Override
	public Food TnewFood(String string) {
		return Fmapper.TnewFood(string);
	}

	@Override
	public List<Food> TselectAll2(String tier) {
		return Fmapper.TselectAll2(tier);
	}

}