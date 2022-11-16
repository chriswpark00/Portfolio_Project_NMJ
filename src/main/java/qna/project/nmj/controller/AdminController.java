package qna.project.nmj.controller;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.MemberDTO;
import qna.project.nmj.command.*;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		C.sqlSession = sqlSession;
	}
	
	private Command command;
	
	@RequestMapping("/adminMember.nmj")
	public String memberlist(Model model) {
		command = new AdminMemberListCommand();
		command.execute(model);
		return "admin/adminMember";	
	}
	
	@RequestMapping(value = "/adminSearchMember.nmj", method = RequestMethod.POST)
	public String memberSearchList(int searchOption, String search, Model model) {
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("search", search);
		command = new AdminMemberSearchListCommand();
		command.execute(model);
		return "admin/adminMember";	
	}
	
	@RequestMapping(value = "/deleteMember.nmj")
	public String deleteMember(int mb_uid, Model model) {
		model.addAttribute("mb_uid", mb_uid);
		new AdminMemberDeleteCommand().execute(model);
		return "admin/deleteMember";
	}
	
	@RequestMapping(value = "/deleteStoreMember.nmj")
	public String deleteStoreMember(int mb_uid, Model model) {
		model.addAttribute("mb_uid", mb_uid);
		new AdminMemberDeleteCommand().execute(model);
		return "admin/deleteStoreMember";
	}
	
	@RequestMapping("/adminStore.nmj")
	public String storeMemberlist(Model model) {
		command = new AdminStoreListCommand();
		command.execute(model);
		return "admin/adminStore";	
	}
	
	@RequestMapping("/adminSelectStore.nmj")
	public String storeTypelist(int store_type, Model model) {
		model.addAttribute("store_type", store_type);
		command = new AdminNStoreListCommand();
		command.execute(model);
		return "admin/adminStore";	
	}
	
	@RequestMapping(value = "/adminSearchStore.nmj", method = RequestMethod.POST)
	public String storeMemberSearchList(int searchOption, String search, Model model) {
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("search", search);
		command = new AdminStoreSearchListCommand();
		command.execute(model);
		return "admin/adminStore";	
	}
	
	@RequestMapping(value = "/adminMemberInfo.nmj")
	public String MemberInfo(int mb_uid, Model model) {
		model.addAttribute("mb_uid", mb_uid);
		new AdminMemberInfoCommand().execute(model);
		return "admin/adminMemberInfo";
	}
	
	@RequestMapping(value = "/adminStoreInfo.nmj")
	public String StoreMemberInfo(int mb_uid, Model model) {
		model.addAttribute("mb_uid", mb_uid);
		new AdminStoreInfoCommand().execute(model);
		return "admin/adminStoreInfo";
	}
	
	@RequestMapping("/adminCommunity.nmj")
	public String communityList(Model model) {
		command = new AdminCommunityListCommand();
		command.execute(model);
		return "admin/adminCommunity";	
	}
	
	@RequestMapping("/adminCommunity2.nmj")
	public String communityList2(Model model) {
		command = new AdminCommunityListCommand2();
		command.execute(model);
		return "admin/adminCommunity2";	
	}
	
	@RequestMapping(value = "/adminSearchCommunity.nmj", method = RequestMethod.POST)
	public String reviewSearchList(int searchOption, String search, Model model) {
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("search", search);
		command = new AdminReviewSearchListCommand();
		command.execute(model);
		if(searchOption == 1 || searchOption == 2) {
			return "admin/adminCommunity";	
		} else {
			return "admin/adminReply";	
		}
	}
	
	@RequestMapping(value = "/adminSearchCommunity2.nmj", method = RequestMethod.POST)
	public String reviewSearchList2(int searchOption, String search, Model model) {
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("search", search);
		command = new AdminReviewSearchListCommand2();
		command.execute(model);
		if(searchOption == 1 || searchOption == 2) {
			return "admin/adminCommunity2";	
		} else {
			return "admin/adminReply";	
		}
	}
	
	@RequestMapping("/adminReply.nmj")
	public String replyList(Model model) {
		command = new AdminReplyListCommand();
		command.execute(model);
		return "admin/adminReply";	
	}
	
	@RequestMapping(value = "/adminCommunityInfo.nmj")
	public String CommunityInfo(int review_uid, Model model) {
		model.addAttribute("review_uid", review_uid);
		new AdminCommunityInfoCommand().execute(model);
		return "admin/adminCommunityInfo";
	}
	
	@RequestMapping(value = "/deleteReview.nmj")
	public String deleteReview(int review_uid, Model model) {
		model.addAttribute("review_uid", review_uid);
		new AdminReviewDeleteCommand().execute(model);
		return "admin/deleteReview";
	}

	@RequestMapping(value = "/deleteReply.nmj")
	public String deleteReply(int reply_uid, Model model) {
		model.addAttribute("reply_uid", reply_uid);
		new AdminReplyDeleteCommand().execute(model);
		return "admin/deleteReply";
	}
	
	@RequestMapping("/adminCS.nmj")
	public String customerServiceList(Model model) {
		command = new AdminCSListCommand();
		command.execute(model);
		return "admin/adminCS";
	}
	
	@RequestMapping(value = "/adminCSreject.nmj")
	public String rejectCS(int request_uid, int mb_uid, Model model) {
		model.addAttribute("request_uid", request_uid);
		model.addAttribute("mb_uid", mb_uid);
		new AdminRejectCSCommand().execute(model);
		return "admin/rejectCS";
	}
	
	@RequestMapping(value = "/adminCSreject2.nmj")
	public String rejectCS(int request_uid, Model model) {
		model.addAttribute("request_uid", request_uid);
		new AdminRejectCSCommand2().execute(model);
		return "admin/rejectCS";
	}
	
	@RequestMapping(value = "/adminCSsolve.nmj")
	public String solveCS(int request_uid, Model model) {
		model.addAttribute("request_uid", request_uid);
		new AdminSolveCSCommand().execute(model);
		return "admin/solveCS";
	}
	
	@RequestMapping(value = "/adminStoreRQ.nmj")
	public String acceptStoreSignUp(int request_uid, Model model) {
		model.addAttribute("request_uid", request_uid);
		new AdminStoreAcceptCommand().execute(model);
		return "admin/adminStoreRQ";
	}
	
	@RequestMapping(value = "/adminStoreRQ2.nmj")
	public String acceptStoreUpdate(int request_uid, Model model) {
		model.addAttribute("request_uid", request_uid);
		new AdminStoreAcceptUpdateCommand().execute(model);
		return "admin/adminStoreRQ2";
	}
	
	@RequestMapping(value = "/adminCommunityRQ.nmj")
	public String reportCommunity(int request_uid, Model model) {
		model.addAttribute("request_uid", request_uid);
		new AdminCommunityReportCommand().execute(model);
		return "admin/adminCommunityRQ";
	}
	
	@RequestMapping(value = "/adminReplyRQ.nmj")
	public String reportReply(int request_uid, Model model) {
		model.addAttribute("request_uid", request_uid);
		new AdminReplyReportCommand().execute(model);
		return "admin/adminReplyRQ";
	}
	
	@RequestMapping(value = "/deleteReview2.nmj")
	public String deleteReview2(int review_uid, int request_uid, Model model) {
		model.addAttribute("review_uid", review_uid);
		model.addAttribute("request_uid", request_uid);
		new AdminReviewDeleteCommand2().execute(model);
		return "admin/deleteReview2";
	}
	
	@RequestMapping(value = "/deleteReply2.nmj")
	public String deleteReply2(int reply_uid, int request_uid, Model model) {
		model.addAttribute("reply_uid", reply_uid);
		model.addAttribute("request_uid", request_uid);
		new AdminReplyDeleteCommand2().execute(model);
		return "admin/deleteReply2";
	}
	
	
	@RequestMapping(value = "/adminAccept.nmj")
	public String acceptStoreOk(int mb_uid, int request_uid, Model model) {
		model.addAttribute("mb_uid", mb_uid);
		model.addAttribute("request_uid", request_uid);
		new AdminStoreAcceptOkCommand().execute(model);
		return "admin/acceptStore";
	}
	
	@RequestMapping(value = "/adminAcceptStoreUpdate.nmj")
	public String acceptStoreUpdateOk(@Param("store_uid") int store_uid, @Param("request_uid") int request_uid, @Param("store_name") String store_name, @Param("store_address") String store_address, @Param("store_regNum") String store_regNum, @Param("store_regImg_org") String store_regImg_org, @Param("store_regImg_sav") String store_regImg_sav, @Param("store_type") int store_type, @Param("store_dtype") int store_dtype, @Param("store_lat") double store_lat, @Param("store_long") double store_long, Model model) {
		model.addAttribute("store_uid", store_uid);
		model.addAttribute("request_uid", request_uid);
		model.addAttribute("store_name", store_name);
		model.addAttribute("store_address", store_address);
		model.addAttribute("store_regNum", store_regNum);
		model.addAttribute("store_regImg_org", store_regImg_org);
		model.addAttribute("store_regImg_sav", store_regImg_sav);
		model.addAttribute("store_type", store_type);
		model.addAttribute("store_dtype", store_dtype);
		model.addAttribute("store_lat", store_lat);
		model.addAttribute("store_long", store_long);
		new AdminStoreAcceptOk2Command().execute(model);
		return "admin/acceptStore";
	}
	
	@RequestMapping("/adminNotice.nmj")
	public String noticelist(Model model) {
		command = new AdminNoticeListCommand();
		command.execute(model);
		return "admin/adminNotice";	
	}
	
	@RequestMapping("/adminEvent.nmj")
	public String eventlist(Model model) {
		command = new AdminEventListCommand();
		command.execute(model);
		return "admin/adminEvent";	
	}
	
	@RequestMapping("/adminNoticeWrite.nmj")
	public String noticewrite(Model model) {
		return "admin/adminNoticeWrite";	
	}
	
	@RequestMapping("/adminEventWrite.nmj")
	public String eventwrite(Model model) {
		return "admin/adminEventWrite";	
	}
	
	@PostMapping(value = "/adminNoticeWriteOk.nmj")
	public String noticewriteOk(String notice_subject, String notice_content, Model model) {
		model.addAttribute("notice_subject", notice_subject);
		model.addAttribute("notice_content", notice_content);
		command = new AdminWriteNoticeCommand();
		command.execute(model);
		return "admin/writeNoticeOk";	
	}
	
	@PostMapping(value = "/adminEventWriteOk.nmj")
	public String eventwriteOk(String notice_subject, String notice_content, String notice_startDate, String notice_endDate, Model model) {
		model.addAttribute("notice_subject", notice_subject);
		model.addAttribute("notice_content", notice_content);
		model.addAttribute("notice_startDate", notice_startDate);
		model.addAttribute("notice_endDate", notice_endDate);
		command = new AdminWriteEventCommand();
		command.execute(model);
		return "admin/writeEventOk";	
	}
	
	@RequestMapping("/adminNoticeInfo.nmj")
	public String noticeinfo(int notice_uid, Model model) {
		model.addAttribute("notice_uid", notice_uid);
		command = new AdminNoticeInfoCommand();
		command.execute(model);
		return "admin/adminNoticeInfo";	
	}
	
	@RequestMapping("/adminNoticeDelete.nmj")
	public String noticedelete(int notice_uid, Model model) {
		model.addAttribute("notice_uid", notice_uid);
		command = new AdminNoticeDeleteCommand();
		command.execute(model);
		return "admin/deleteNotice";	
	}
	
	@RequestMapping("/adminEventDelete.nmj")
	public String eventdelete(int notice_uid, Model model) {
		model.addAttribute("notice_uid", notice_uid);
		command = new AdminNoticeDeleteCommand();
		command.execute(model);
		return "admin/deleteEvent";	
	}
	
	@RequestMapping("/adminNoticeUpdate.nmj")
	public String noticeupdate(int notice_uid, Model model) {
		model.addAttribute("notice_uid", notice_uid);
		command = new AdminNoticeSelectCommand();
		command.execute(model);
		return "admin/adminNoticeUpdate";	
	}
	
	@RequestMapping("/adminEventUpdate.nmj")
	public String eventupdate(int notice_uid, Model model) {
		model.addAttribute("notice_uid", notice_uid);
		command = new AdminNoticeSelectCommand();
		command.execute(model);
		return "admin/adminEventUpdate";	
	}
	
	@PostMapping(value = "/adminNoticeUpdateOk.nmj")
	public String noticeupdateOk(@Param("notice_uid") int notice_uid, @Param("notice_subject") String notice_subject, @Param("notice_content") String notice_content, Model model) {
		model.addAttribute("notice_uid", notice_uid);
		model.addAttribute("notice_subject", notice_subject);
		model.addAttribute("notice_content", notice_content);
		command = new AdminUpdateNoticeCommand();
		command.execute(model);
		return "admin/updateNoticeOk";	
	}
	
	@PostMapping(value = "/adminEventUpdateOk.nmj")
	public String eventeupdateOk(@Param("notice_uid") int notice_uid, @Param("notice_subject") String notice_subject, @Param("notice_content") String notice_content, @Param("notice_startDate") String notice_startDate, @Param("notice_endDate") String notice_endDate, Model model) {
		model.addAttribute("notice_uid", notice_uid);
		model.addAttribute("notice_subject", notice_subject);
		model.addAttribute("notice_content", notice_content);
		model.addAttribute("notice_startDate", notice_startDate);
		model.addAttribute("notice_endDate", notice_endDate);
		command = new AdminUpdateEventCommand();
		command.execute(model);
		return "admin/updateNoticeOk";	
	}

}
