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
		
		List<Food> allList = Fmapper.selectAll(); // ��ü ���ĸ���Ʈ �ҷ�����
		
		List<Food> similar = new ArrayList<Food>();
		
		// ������ �ϳ��� ���鼭, ������ �ܾ �ִ��� üũ�ϱ�. �ѱ��ھ� ���ؼ� 60%�̻� ��ġ�ϴ� �ܾ ���� ������ return;
		for (int i = 0; i < allList.size(); i++) {
			
			Food f = allList.get(i);
			
			String[] origin = f.getName().split(""); // ���� �ܾ� �ѱ��ھ� �ڸ���
			String[] arr = f_name.split(""); // �˻��� �ܾ� �ѱ��ھ� �ڸ���
			
			double length = origin.length; // ��ü ���� ��
			double correct = 0.0; // ��ġ�ϴ� ��
			
			if(origin.length != arr.length) { // ���� ���� ��
				
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
			
			else { // ���� ��
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
			if(percent >= 0.6) { // ��ġȮ���� 60%�̻� �̸�
				similar.add(f);
				System.out.println("--------�߰�!------------");
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
		List<Food> allList = Fmapper.TselectAll2(tier); // ��ü ���ĸ���Ʈ �ҷ�����
		System.out.println("TsimilarSearch : TselectAll ������ " + allList.size() );
		List<Food> similar = new ArrayList<Food>();
		
		// ������ �ϳ��� ���鼭, ������ �ܾ �ִ��� üũ�ϱ�. �ѱ��ھ� ���ؼ� 60%�̻� ��ġ�ϴ� �ܾ ���� ������ return;
		for (int i = 0; i < allList.size(); i++) {
			
			Food f = allList.get(i);
			
			String[] origin = f.getName().split(""); // ���� �ܾ� �ѱ��ھ� �ڸ���
			String[] arr = f_name.split(""); // �˻��� �ܾ� �ѱ��ھ� �ڸ���
			
			double length = origin.length; // ��ü ���� ��
			double correct = 0.0; // ��ġ�ϴ� ��
			
			if(origin.length != arr.length) { // ���� ���� ��
				
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
			
			else { // ���� ��
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
			if(percent >= 0.6) { // ��ġȮ���� 60%�̻� �̸�
				similar.add(f);
				System.out.println("--------�߰�!------------");
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