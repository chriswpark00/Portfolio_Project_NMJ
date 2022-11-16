package qna.project.nmj.controller;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import qna.project.nmj.ajax.dto.AjaxBoardQueryResult;
import qna.project.nmj.beans.C;
import qna.project.nmj.beans.FoodDTO;
import qna.project.nmj.beans.SpaceDTO;
import qna.project.nmj.beans.StoreDTO;
import qna.project.nmj.beans.dao.StoreMyPageDAO;
import qna.project.nmj.command.*;
import qna.project.nmj.security.PasswordEncoding;

@Controller
@RequestMapping(value="/store")
public class StoreMyPageController {

	private Command command;
	
	
//	0. 매장 회원 마이 페이지
	@RequestMapping(value="/storeMyPage.nmj")
	public String storeMyPage(Model model) {
		// TODO
		// store_uid값 Parameter로 받아오기 (회원 로그인 가능할 때 변경)
		int store_uid = 1;
		model.addAttribute("store_uid", store_uid);
		return "/store/storeMyPage";
	}
	
	
//	1. 회원 정보 수정
	// TODO
	
	
//	2. 매장 정보 수정
	@RequestMapping("/storeSettings.nmj")
	public String storeSettings(HttpSession session, Model model) {
		int store_uid = (int) session.getAttribute("store_uid");
		model.addAttribute("store_uid", store_uid);
		new StoreSettingsCommand().execute(model);
		model.addAttribute("nav", 6);
		return "/store/storeSettings";
	}
//	2-2. 매정 정보 수정 ok
	@RequestMapping(value="/storeSettingsOk.nmj", method = RequestMethod.POST)
	public String storeSettingsOk(@RequestParam("upload") MultipartFile upload, StoreDTO dto, Model model) {
		model.addAttribute("dto", dto);
		model.addAttribute("upload", upload);
		new StoreSettingsOkCommand().execute(model);
		return "/store/storeSettingsOk";
	}
	
	
//	3. 매장 정보 수정 요청
	@RequestMapping(value = "/storeSettingsRequest.nmj")
	public String storeSettingsRequest(HttpSession session, Model model) {
		int store_uid = (int) session.getAttribute("store_uid");
		model.addAttribute("store_uid", store_uid);
		new StoreSettingsCommand().execute(model);
		model.addAttribute("nav", 7);
		return "/store/storeSettingsRequest";
	}
//	3-1. 매장 주소 찾기
	@RequestMapping(value = "/addressPopup.nmj")
	public String addressPopup(HttpServletRequest request) {
		return "/store/addressPopup";
	}
//	3-2. 매장 주소 요청 ok
	@RequestMapping(value = "/storeSettingsRequestOk.nmj", method = RequestMethod.POST)
	public String storeSettingsRequestOk(@RequestParam("upload") MultipartFile upload, 
			StoreDTO dto, 
			String entY,
			String entX,
			Model model) {
		if(entY != null && entX != null && !entY.equals("") && !entX.equals("")) {
			dto.setStore_lat(Double.parseDouble(entY));
			dto.setStore_long(Double.parseDouble(entX));
		}
		model.addAttribute("upload", upload);
		model.addAttribute("dto", dto);
		new StoreSettingsRequestOkCommand().execute(model);
		return "/store/storeSettingsRequestOk";
	}
	
//	4. 음식 메뉴 관리
	@RequestMapping(value = "/storeMyFood.nmj")
	public String storeMyFood(HttpSession session, Model model) {
		int store_uid = (int)session.getAttribute("store_uid");
		model.addAttribute("store_uid", store_uid);
		model.addAttribute("nav", 4);
		
		return "/store/storeMyFood";
	}
//	4-1. 특정 음식 수정
	@RequestMapping(value = "/storeMyFoodUpdate.nmj")
	public String storeMyFoodUpdate(int food_uid, Model model) {
		StoreMyPageDAO dao = C.sqlSession.getMapper(StoreMyPageDAO.class);
		FoodDTO dto = dao.selectFoodByFoodUid(food_uid);
		model.addAttribute("dto", dto);
		model.addAttribute("nav", 4);
		return "/store/storeMyFoodUpdate";
	}
//	4-1-1. 특정 음식 수정 ok
	@RequestMapping(value = "/storeMyFoodUpdateOk.nmj", method = RequestMethod.POST)
	public String storeMyFoodUpdateOk(FoodDTO dto, Model model) {
		StoreMyPageDAO dao = C.sqlSession.getMapper(StoreMyPageDAO.class);
		int cnt = dao.updateFoodByFoodUid(dto);
		model.addAttribute("cnt", cnt);
		return "/store/storeMyFoodUpdateOk";
	}
//	4-2. 특정 음식 삭제
	@RequestMapping(value = "/storeMyFoodDelete.nmj")
	public String storeMyFoodDelete(int food_uid, Model model) {
		StoreMyPageDAO dao = C.sqlSession.getMapper(StoreMyPageDAO.class);
		int cnt = dao.deleteFoodByFoodUid(food_uid);
		model.addAttribute("cnt", cnt);
		return "/store/storeMyFoodDelete";
	}
//	4-3. 매장 음식 추가
	@RequestMapping(value = "/storeMyFoodInsert.nmj")
	public String storeMyFoodInsert(HttpSession session, Model model) {
		int store_uid = (int) session.getAttribute("store_uid");
		model.addAttribute("store_uid", store_uid);
		model.addAttribute("nav", 4);
		return "/store/storeMyFoodInsert";
	}
//	4-3-1. 매장 음식 추가 Ok
	@RequestMapping(value =  "/storeMyFoodInsertOk.nmj")
	public String storeMyFoodInsertOk(@RequestParam("upload") MultipartFile upload, 
			FoodDTO dto, Model model) {
		model.addAttribute("upload", upload);
		model.addAttribute("dto", dto);
		new StoreMyFoodInsertOkCommand().execute(model);
		return "/store/storeMyFoodInsertOk";
	}
	
//	5. 매장 공간 관리
	@RequestMapping(value="/storeMySpace.nmj")
	public String storeMySpace(Model model, HttpSession session) {
		int store_uid = (int)session.getAttribute("store_uid");
		model.addAttribute("store_uid", store_uid);
		command = new StoreMySpaceCommand();
		command.execute(model);
		model.addAttribute("nav", 3);
		return "/store/storeMySpace";
	}
	
	
//	6. 내 매장 리뷰 보기
	@RequestMapping(value="/storeMyReview.nmj")
	public String storeMyReview(Model model, HttpSession session) {
		int store_uid = (int)session.getAttribute("store_uid");
		model.addAttribute("store_uid", store_uid);
		command = new StoreMyReviewCommand();
		command.execute(model);
		model.addAttribute("nav", 5);
		return "store/storeMyReview";
	}

	@RequestMapping(value="/storeMySpaceImg.nmj")
	public String storeMySpaceImg(Model model, HttpSession session) {
		int store_uid = (int)session.getAttribute("store_uid");
		model.addAttribute("store_uid", store_uid);
		command = new StoreMySpaceImgCommand();
		command.execute(model);		
		return "store/storeMySpaceImg";
	}
	
	@RequestMapping(value="/storeImgDetail.nmj")
	public String storeImgDetail(Model model, int space_uid) {
		model.addAttribute("nav", 3);
		model.addAttribute("space_uid", space_uid);
		command = new StoreImgDetailCommand(); 
		command.execute(model);
		return "store/storeImgDetail";
	}
	
	@RequestMapping(value="/storeMySpaceImgInsert.nmj")
	public String StoreMySpaceImgInsert(Model model, String space_uid) {
		model.addAttribute("space_uid", space_uid);	
		return "store/storeMySpaceImgInsert";
	}
	
	@RequestMapping(value="/storeMySpaceImgInsertOk.nmj")
	public String StoreMySpaceImgInsertOk(Model model, int[] space_uid, @RequestParam("upload") MultipartFile upload) {
		model.addAttribute("space_uid", space_uid);
		model.addAttribute("upload", upload);
		command = new storeMySpaceImgInsertCommand();
		command.execute(model);
		return "store/storeMySpaceImgInsertOk";
	}
	
	@RequestMapping(value="/storeMySpaceImgDelete.nmj")
	public String storeMySpaceImgDelete(Model model, int space_img_uid, int space_uid ) {
		model.addAttribute("space_img_uid", space_img_uid);
		model.addAttribute("space_uid", space_uid);
		command = new StoreMySpaceImgDeleteCommand();
		command.execute(model);
		return "store/storeMySpaceImgDelete";
	}
}
