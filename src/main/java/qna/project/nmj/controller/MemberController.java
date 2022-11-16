package qna.project.nmj.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import qna.project.nmj.beans.MemberDTO;
import qna.project.nmj.beans.StoreDTO;
import qna.project.nmj.command.FindStoreGetCommand;
import qna.project.nmj.command.LoginCommand;
import qna.project.nmj.command.MainCommand;
import qna.project.nmj.command.MbFindIdOkCommand;
import qna.project.nmj.command.MbFindPwOkCommand;
import qna.project.nmj.command.SignUpCustomerOkCommand;
import qna.project.nmj.command.SignUpStoreOkCommand;
import qna.project.nmj.command.SignUpStoreRegOkCommand;
import qna.project.nmj.command.StoreDetailCommand;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	// 아이디 비밀번호 찾기
	@RequestMapping("/findIdPw.nmj")
	public void findIdPw(Model model) {
		model.addAttribute("nav", 0);
	}
	
	// 아이디 찾기
	@RequestMapping(value = "/findIdOk.nmj", method = RequestMethod.POST)
	public String findIdOk(String mb_name, String mb_email, Model model) {
		model.addAttribute("nav", 0);
		model.addAttribute("mb_name", mb_name);
		System.out.println("Controller " + mb_name);
		model.addAttribute("mb_email", mb_email);
		System.out.println("Controller " + mb_email);
		new MbFindIdOkCommand().execute(model);
		return "/member/findIdOk";
	}
	
	// 비밀번호 찾기
	@RequestMapping("/findPwOk.nmj")
	public String findPwOk(String mb_id, String mb_name, String mb_email, Model model) {
		model.addAttribute("nav", 0);
		model.addAttribute("mb_id", mb_id);
		System.out.println("Controller " + mb_id);
		model.addAttribute("mb_name", mb_name);
		System.out.println("Controller " + mb_name);
		model.addAttribute("mb_email", mb_email);
		System.out.println("Controller " + mb_email);
		new MbFindPwOkCommand().execute(model);
		return "/member/findPwOk";
	}
	
	// 매장 찾기 페이지
	@GetMapping("/findStore.nmj")
	public String findStoreGet(int store_type, Model model) {
		model.addAttribute("store_type", store_type);
		new FindStoreGetCommand().execute(model);
		model.addAttribute("nav", store_type+1);
		
		return "/member/findStore";
	}
	
	
	
	@RequestMapping("storeDetail.nmj")
	public String storeDetail(int store_uid, Model model, HttpSession session) {
		int mb_uid = 0;
		
		if(session.getAttribute("mb_uid") != null){
			mb_uid = (Integer)session.getAttribute("mb_uid");						
		}
		
		model.addAttribute("mb_uid", mb_uid);
		model.addAttribute("nav", 0);
		model.addAttribute("store_uid", store_uid);
		new StoreDetailCommand().execute(model);
		return "/member/storeDetail";
	}
	
	
	@RequestMapping("main.nmj")
	public String main(Model model) {
		new MainCommand().execute(model);
		model.addAttribute("nav", 1);
		return "/member/main";
	}
	
	
	
	
	
	
	
	
	// 회원가입
	// 회원타입 선택
	@RequestMapping("/signUpType.nmj")
	public void signUpType(Model model) {
		model.addAttribute("nav", 0);
		
	}
	
	// 일반회원 약관동의 양식
	@RequestMapping("/signUpTerms.nmj")
	public void signUpTerms(Model model) {
		model.addAttribute("nav", 0);
	}
	
	// 매장회원 약관동의 양식
	@RequestMapping("/signUpTerms2.nmj")
	public void signUpTerms2(Model model) {
		model.addAttribute("nav", 0);
	}
	
	// 회원가입 양식
	@RequestMapping("/signUpCustomer.nmj")
	public void signUpCustomer(Model model) {
		model.addAttribute("nav", 0);
	}
	
	// 회원가입 양식
	@RequestMapping("/signUpStore.nmj")
	public void signUpStore(Model model) {
		model.addAttribute("nav", 0);
	}
	
	// 일반회원가입
	@RequestMapping("/signUpCustomerOk.nmj")
	public String signUpCustomerOk(MemberDTO dto, Model model) {
		model.addAttribute("dto", dto);
		new SignUpCustomerOkCommand().execute(model);
		return "/member/signUpCustomerOk";
	}
	
	// 매장회원가입
	@RequestMapping("/signUpStoreOk.nmj")
	public String signUpStoreOk(MemberDTO dto, Model model) {
		model.addAttribute("dto", dto);
		new SignUpStoreOkCommand().execute(model);
		return "/member/signUpStoreOk";
	}
	
	// 매장회원 매장정보 양식
	@RequestMapping("/signUpStoreReg.nmj")
	public void signUpStoreReg(Model model) {
		model.addAttribute("nav", 0);
	}
	
	// 매장회원 매장정보 요청
	@RequestMapping("/signUpStoreRegOk.nmj")
	public String signUpStoreRegOk(
			@RequestParam("storeImg") MultipartFile storeImg, 
			@RequestParam("storeRegImg") MultipartFile storeRegImg, 
			StoreDTO dto, 
			String entY,
			String entX,
			Model model) {
		if(entY != null || entY.equals("") || entX != null || entX.equals("")) {
			dto.setStore_lat(Double.parseDouble(entY));
			dto.setStore_long(Double.parseDouble(entX));
		}
		model.addAttribute("dto", dto);
		model.addAttribute("storeImg", storeImg);
		model.addAttribute("storeRegImg", storeRegImg);
		new SignUpStoreRegOkCommand().execute(model);
		return "/member/signUpStoreRegOk";
	}
	
	// 로그인
	@RequestMapping("/login.nmj")
	public String login(Model model) {
		model.addAttribute("nav", 0);
		return "/member/login";
	}
	
	// 로그인 ok
	@RequestMapping("/loginOk.nmj")
	public String loginOk(Model model, String mb_id, String mb_pw, HttpSession session) {
		model.addAttribute("mb_id", mb_id);
		model.addAttribute("mb_pw", mb_pw);
		new LoginCommand().execute(model);
		int mb_uid = (Integer)model.getAttribute("mb_uid");
		if(mb_uid != 0) {
			session.setAttribute("mb_uid", mb_uid);
			System.out.println(mb_uid);
		}
		System.out.println((Integer)session.getAttribute("mb_uid"));
		int type = (Integer)model.getAttribute("type");
		//model.addAttribute("mb_type", type);
		session.setAttribute("mb_type", type);
		System.out.println(type);
		if(type == 2) {
			int store_uid = (Integer)model.getAttribute("store_uid");
			session.setAttribute("store_uid", store_uid);
		}
		return "/member/loginOk";
	}
	
	@RequestMapping("/logout.nmj")
	public String logout(HttpSession session) {
		session.invalidate();
		return "/member/logout";
	}
}
