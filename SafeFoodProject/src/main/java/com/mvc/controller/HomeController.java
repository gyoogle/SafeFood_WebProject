package com.mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.mvc.service.EatlistService;
import com.mvc.service.FoodService;
import com.mvc.service.MemberService;
import com.mvc.service.SaveService;
import com.mvc.vo.Eatlist;
import com.mvc.vo.Food;
import com.mvc.vo.Member;
import com.mvc.vo.Save;

//@CrossOrigin(origins={"*"}, maxAge=6000)
@Controller
public class HomeController {
	
	@Autowired
	FoodService fservice;
	@Autowired
	MemberService mservice;
	@Autowired
	EatlistService eservice;
	@Autowired
	SaveService sservice;
	
	@RequestMapping(value = "/main.safefood", method = RequestMethod.GET)
	public String main(Model m, HttpServletRequest req, HttpServletResponse res, HttpSession session) {
		String id = (String) session.getAttribute("id");
		String log = (String) session.getAttribute("log");
		
		if (log != null) {
			
			System.out.println("로그인 실패");
			
			res.setContentType("text/html; charset=euc-kr");
			 
			PrintWriter out;
			try {
				out = res.getWriter();
				out.println("<script>alert('아이디 혹은 비밀번호가 일치하지 않습니다.');</script>");
				
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
			session.setAttribute("log", null);
		}
		
		if (id == null) {
//			System.out.println("id가 Null인 메인 페이지");
			
			Food f1 = eservice.ThotFood("1");
			Food f2 = fservice.TnewFood("1");
			
			if (f1 ==  null) {
				f1 = fservice.selectOne("1");
			}
			req.setAttribute("f1", f1);
			req.setAttribute("f2", f2);
			
//			System.out.println("id가 null인 경우 성공");
		}
		
		else {
			String tier = mservice.getTier((String)session.getAttribute("id"));
//			System.out.println("id가 Null이 아닌 메인 페이지");
			
			Food f1 = eservice.ThotFood(tier);
			Food f2 = fservice.TnewFood(tier);
			
			if (f1 ==  null) {
				f1 = fservice.selectOne("1");
			}
			
			req.setAttribute("f1", f1);
			req.setAttribute("f2", f2);
			
//			System.out.println("id가 있는 경우 성공");
		}
		return "main";
	}
	
	@RequestMapping(value = "/list.safefood", method = RequestMethod.GET)
	public String list(Model m, HttpServletRequest req, HttpSession session) {
		
		String tier = mservice.getTier((String)session.getAttribute("id"));
		System.out.println("homeController 아이디 : " + (String)session.getAttribute("id") );
		System.out.println("tier : " + tier);
		
//		List<Food> list = fservice.selectAll();
//		List<Food> best = eservice.selectBest();
		
		List<Food> onelist = fservice.TselectAll("1");
		List<Food> twolist = fservice.TselectAll("2");
		List<Food> threelist = fservice.TselectAll("3");
		
		System.out.println("onelist : " + onelist.size());
		System.out.println("twolist : " + twolist.size());
		System.out.println("threelist : " + threelist.size());
		
		List<Food> best = eservice.TselectBest(tier);
		
		//m.addAttribute("list", list);
		
		req.setAttribute("tier", tier);
		req.setAttribute("onelist", onelist);
		if(tier.equals("2") || tier.equals("3"))
			req.setAttribute("twolist", twolist);
		if(tier.equals("3"))
			req.setAttribute("threelist", threelist);
		req.setAttribute("best", best);
		
		return "list";
	}
	
	@RequestMapping(value="/read.safefood", method = RequestMethod.GET)
	public String read(Model m, HttpServletRequest req, HttpSession session) {
		
		// 클릭된 FOOD 아이디 받은 후 정보 
		String f_id = req.getParameter("f_id");
		Food f = fservice.selectOne(f_id);
		String result = fservice.getIngredient(f_id);
		
		System.out.println("f_id : " + f_id);
		System.out.println("food : " + f);
		System.out.println("result : " + result);
		
		// 로그인이 되어 있는 상태라면.
		if (session.getAttribute("id") != null) {

			// 멤버 정보를 받아오기
			String id = (String) session.getAttribute("id");
			
			ArrayList<String> x = mservice.allAllergy(id);
			for (int i = 0; i < x.size(); i++) {
				String alle = x.get(i);
				result = result.replace(alle, "<span style='color: red;'>"+ alle +"</span>");
			}
		}
		
		req.setAttribute("f", f);
		req.setAttribute("detail", result);
		
		return "read";
	}
	
	@RequestMapping(value="/create.safefood", method = RequestMethod.GET)
	public String create(Model m, HttpServletRequest req) {
		try {
			req.setCharacterEncoding("euc-kr");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		return "create";
	}
	
	@RequestMapping(value="/delete.safefood", method = RequestMethod.GET)
	public String delete(Model m, HttpServletRequest req ) {
		String f_id = req.getParameter("f_id");
		mservice.delete(f_id);
		
		List<Food> list = fservice.selectAll();
		req.setAttribute("list", list);
		
		return "redirect:/list.jsp";
	}
	
	
	@RequestMapping(value="/search.safefood", method= RequestMethod.POST)
	public String search(Model m, HttpServletRequest req, HttpSession session) {
		String f_name = req.getParameter("search");
		String new_name = "%"+f_name+"%";
		String tier = mservice.getTier((String)session.getAttribute("id"));
		System.out.println("검색하는 사람 티어 : " + tier);
		
//		List<Food> list = fservice.search(new_name);
		List<Food> list = fservice.Tsearch(new_name, tier);
		System.out.println("초기 검색 결과 사이즈 : " + list.size());
		
		if(list.size() == 0) { // 검색한 결과가 없을 때, 유사한 단어가 있는지 체크하기
//			List<Food> similar = fservice.similarSearch(f_name);
			List<Food> similar = fservice.TsimilarSearch(f_name, tier);
			
			req.setAttribute("list", similar);
			req.setAttribute("size", list.size());
			req.setAttribute("search", f_name);
			req.setAttribute("leng", similar.size());
		}
		else {
			req.setAttribute("list", list);
			req.setAttribute("size", list.size());
			req.setAttribute("search", f_name);
		}
		
		return "searchResult";
	}
	
	
	@RequestMapping(value="modifyForm.safefood", method= RequestMethod.GET)
	public String modifyForm(Model m, HttpServletRequest req) {
		
		String f_id = req.getParameter("f_id");
		Food f = fservice.selectOne(f_id);
		
		req.setAttribute("f", f);
		
		return "modifyForm";
	}
	
	@RequestMapping(value="join.safefood", method= RequestMethod.GET)
	public String join(Model m, HttpServletRequest req) {
		return "join";
	}
	
	@RequestMapping(value="/myPage.safefood", method = RequestMethod.GET)
    public String myPage(Model m, HttpServletRequest req, HttpServletResponse res) {
        HttpSession session = req.getSession();
        String id = (String)session.getAttribute("id");
        
        Member m1 = mservice.searchById(id);

        req.setAttribute("id", m1.getId());
        req.setAttribute("password", m1.getPassword());
        req.setAttribute("name", m1.getName());
        req.setAttribute("allergy", m1.getAllergy());
        
        return "myPage2";
    }
	
	@RequestMapping(value = "/login.safefood", method = RequestMethod.POST)
	public String loginProcess(HttpSession session, HttpServletRequest req, HttpServletResponse res, String id, String pass) {
		
		System.out.println(id + "," + pass);
		
		int chk = mservice.loginSuccess(id, pass);
		
		System.out.println("chk = " + chk);
		
		String log = "false";
		
		if(chk >= 1 ) { // 로그인 가능
			session.setAttribute("id", id);
		} else {
			session.setAttribute("log", log);
		}
		
		return "redirect:/main.safefood";
	}
	
	@RequestMapping(value = "/logout.safefood", method = RequestMethod.GET)
	public String logout(HttpSession session, String id, String pass) {
		session.setAttribute("id", null);
		return "redirect:/main.safefood";
	}
	
	@RequestMapping(value="/joinSuccess.safefood", method = RequestMethod.POST)
	public String joinSuccess(Model m, HttpServletRequest req, HttpServletResponse res) {
		String id = req.getParameter("id");
		String password = req.getParameter("password");
		String name = req.getParameter("name");
		String[] allergy = req.getParameterValues("allergy");
		
		ArrayList<String> list = new ArrayList<String>();
		for (int i = 0; i < allergy.length; i++) {
			list.add(allergy[i]);
		}
		
		mservice.add(new Member(id, password, name, list, "1"));
		
//		Member m1 = mservice.searchById(id);
//		m1.setAllergy(list);
//		m.addAttribute("member", m1);
		return "joinSuccess";
	}
	
	@RequestMapping(value="/viewList.safefood", method = RequestMethod.GET)
	public String viewList(Model m) {
		List<Food> list = fservice.selectAll();
		m.addAttribute("list", list);
		return "list";
	}
	
	@RequestMapping(value="/infoChange.safefood", method = RequestMethod.GET)
	public String infoChange(Model m, HttpServletRequest req, HttpServletResponse res) {
		String id = req.getParameter("id");
		System.out.println("id : " + id);
		Member m1 = mservice.searchById(id);
		m.addAttribute("member", m1);
		System.out.println("infoChange");
		return "infoChange";
	}
	
	@RequestMapping(value="/changeSave.safefood", method = RequestMethod.POST)
	public String changeSave(Model m, HttpSession session, HttpServletRequest req, HttpServletResponse res) {
		String id = req.getParameter("id");
		String password = req.getParameter("password");
		String name = req.getParameter("name");
		String[] allergy = req.getParameterValues("allergy");
		String tier = mservice.getTier((String)session.getAttribute("id"));
		
		ArrayList<String> x = new ArrayList<String>();
		for (int i = 0; i < allergy.length; i++) {
			System.out.println("해당 알러지 : " + allergy[i]);
			x.add(allergy[i]);
		}
		
		String mcode = mservice.searchMcodeById(id);
		// 추가된 부분 ========
		ArrayList<String> y = sservice.getcode(mcode);
        System.out.println("찜하기 제품 갯수 : " + y.size());
        ArrayList<String> z = eservice.getcode(mcode);
		// =================
		
		mservice.delete(mcode);
		mservice.add(new Member(id, password, name, x, tier));
		mservice.updateByMcode(mcode, id);
		
		// 추가된 부분 ========
        sservice.setcode(mcode, y);
        eservice.setcode(mcode, z);
		// 추가 끝
		
		
		Member colum = mservice.searchById(id);
		m.addAttribute("member", colum);
		
		return "redirect:/main.safefood";
	}
	
	@RequestMapping(value="/findPass.safefood", method = RequestMethod.GET)
	public String findPass(Model m) {
		return "findPass";
	}
	
	@RequestMapping(value="/findPassProcess.safefood", method = RequestMethod.POST)
	public String findPassProcess(Model m, HttpServletRequest req, HttpServletResponse res) {
		String id = req.getParameter("id");
		String password = req.getParameter("password");
		String name = req.getParameter("name");
		Member m1 = mservice.searchById(id);
		if(m1 != null) {
			if(m1.getName().equals(name)) {
				mservice.changePassword(id, password);
			}
			
			System.out.println("비밀번호 변경 완료");
		}
		m.addAttribute("member", m1);
		return "redirect:/main.safefood";
	}
	
	@RequestMapping(value="/qna.safefood", method = RequestMethod.GET)
	public String qna(Model m) {
		return "qna";
	}
	
	@RequestMapping(value = "/eat.safefood", method = RequestMethod.GET)
	public String eat(Model m, String id, String fnum, HttpSession session, HttpServletRequest req) {
		
		String mcode = mservice.searchMcodeById(id);
		System.out.println("controller mcode 확인 : " + mcode);
		
        eservice.insert(new Eatlist(fnum, mcode));
        
        session.setAttribute("mcode", mcode);

        return "redirect:/myPage2.safefood";
	}
	
	@RequestMapping(value = "/save.safefood", method = RequestMethod.GET)
	public String save(Model m, String id, String fnum, HttpSession session, HttpServletRequest req) {
		
		String mcode = mservice.searchMcodeById(id);
		System.out.println("controller mcode 확인 : " + mcode);
		
        sservice.insert(new Save(fnum, mcode));
        
        session.setAttribute("mcode", mcode);
        
        return "redirect:/myPage2.safefood";
     }
	
	@RequestMapping(value = "/myPage2.safefood", method = RequestMethod.GET)
	public String myPage() {
		return "redirect:/list.safefood";
	}
	
	@RequestMapping(value = "/quiz.safefood", method = RequestMethod.GET)
	public String quiz(HttpServletRequest req) {
		HttpSession session = req.getSession();
        String id = (String)session.getAttribute("id");
        
        Member m1 = mservice.searchById(id);

        req.setAttribute("id", m1.getId());
		return "quiz";
	}
	
	
//	// 에러처리
//	@ExceptionHandler(Exception.class)
//	public String errorHandler() {
//		return "Error";
//	}

}
