package qna.project.nmj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import qna.project.nmj.command.UserRegServiceCommand;

@Controller
public class AjaxUserRegController {
	@Autowired
	private UserRegServiceCommand reg_service;

		// id 중복 체크 컨트롤러
		@RequestMapping(value = "/user/idCheck", method = RequestMethod.GET)
		@ResponseBody
		public int idCheck(@RequestParam("mb_id") String mb_id) {

			return reg_service.userIdCheck(mb_id);
		}
		
		// email 중복 체크 컨트롤러
		@RequestMapping(value = "/user/emailCheck", method = RequestMethod.GET)
		@ResponseBody
		public int emailCheck(@RequestParam("mb_email") String mb_email) {
			
			return reg_service.userEmailCheck(mb_email);
		}
		
		// 사업자등록번호 중복 체크 컨트롤러
		@RequestMapping(value = "/user/regNumCheck", method = RequestMethod.GET)
		@ResponseBody
		public int regNumCheck(@RequestParam("store_regNum") String store_regNum) {
			
			return reg_service.userRegNumCheck(store_regNum);
		}
		
		// 매장전화번호 중복 체크 컨트롤러
		@RequestMapping(value = "/user/telCheck", method = RequestMethod.GET)
		@ResponseBody
		public int telCheck(@RequestParam("store_tel") String store_tel) {
			
			return reg_service.userTelCheck(store_tel);
		}
}
