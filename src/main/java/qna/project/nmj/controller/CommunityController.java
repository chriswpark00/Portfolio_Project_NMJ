package qna.project.nmj.controller;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import qna.project.nmj.beans.AjaxBoardList;
import qna.project.nmj.beans.C;
import qna.project.nmj.beans.ReviewJoinDTO;
import qna.project.nmj.beans.dao.ReviewDAO;
import qna.project.nmj.command.*;

@Controller
@RequestMapping("/community")
public class CommunityController {
	
	private SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		C.sqlSession = sqlSession;
	}
	
	private Command command;

	@RequestMapping("/writeReview.nmj")
	public String writeReview(int mb_uid, Model model) {
		model.addAttribute("nav", 5);
		model.addAttribute("mb_uid", mb_uid);
		new CommunityWriteCommand().execute(model);
		return "community/writeReview";
	}
	
	@RequestMapping("/writeReview2.nmj")
	public String writeReview2(int mb_uid, Model model) {
		model.addAttribute("nav", 5);
		model.addAttribute("mb_uid", mb_uid);
		new CommunityWriteCommand().execute(model);
		return "community/writeReview2";
	}
	
	@PostMapping(value = "/writeReviewOk.nmj")
	public String insertReviewOk(int mb_uid, int store_uid, String review_content, int review_rate, Model model) {
		model.addAttribute("mb_uid", mb_uid);
		model.addAttribute("store_uid", store_uid);
		model.addAttribute("review_content", review_content);
		model.addAttribute("review_rate", review_rate);
		new CommunityWriteOkCommand().execute(model);
		return "community/writeReviewOk";
	}
	
	@PostMapping(value = "/writeReviewOk2.nmj")
	public String insertReviewOk2(int mb_uid, String review_content, Model model) {
		model.addAttribute("mb_uid", mb_uid);
		model.addAttribute("review_content", review_content);
		new CommunityWriteOkCommand2().execute(model);
		return "community/writeReviewOk2";
	}
	
	@RequestMapping("/communityList.nmj")
	public String selectAllReview(Model model) {
		model.addAttribute("nav", 5);
		new CommunityListCommand().execute(model);
		return "community/communityList";
	}
	
	@RequestMapping("/communityList2.nmj")
	public String selectAllReview2(Model model) {
		model.addAttribute("nav", 5);
		new CommunityListCommand2().execute(model);
		return "community/communityList2";
	}
	
	@RequestMapping(value = "/communityView.nmj")
	public String communityView(int review_uid, Model model) {
		model.addAttribute("nav", 5);
		model.addAttribute("review_uid", review_uid);
		new CommunityViewCommand().execute(model);
		return "community/communityView";
	}
	
	@RequestMapping(value = "/communityView2.nmj")
	public String communityView2(int review_uid, Model model) {
		model.addAttribute("nav", 5);
		model.addAttribute("review_uid", review_uid);
		new CommunityViewCommand2().execute(model);
		return "community/communityView2";
	}
	
	@RequestMapping(value = "/noticeView.nmj")
	public String noticeView(int notice_uid, Model model) {
		model.addAttribute("nav", 5);
		model.addAttribute("notice_uid", notice_uid);
		new CommunityNoticeViewCommand().execute(model);
		return "community/noticeView";
	}
	
	// 리뷰 수정 불러오기
	@RequestMapping("/updateReview.nmj")
	public String updateReview(int mb_uid, int review_uid, Model model) {
		model.addAttribute("nav", 5);
		model.addAttribute("mb_uid", mb_uid);
		model.addAttribute("review_uid", review_uid);
		new CommunitySelectViewCommand().execute(model);
		return "community/updateReview";
	}
	
	// 일반글 수정 불러오기
	@RequestMapping("/updateReview2.nmj")
	public String updateReview2(int mb_uid, int review_uid, Model model) {
		model.addAttribute("mb_uid", mb_uid);
		model.addAttribute("review_uid", review_uid);
		new CommunitySelectViewCommand2().execute(model);
		return "community/updateReview2";
	}
	
	// 리뷰 수정
	@RequestMapping("/updateReviewOk.nmj")
	public String updateReviewOk(int mb_uid, @Param("review_uid") int review_uid, @Param("review_content") String review_content, @Param("store_uid") int store_uid, @Param("review_rate") int review_rate, Model model) {
		model.addAttribute("review_uid", review_uid);
		model.addAttribute("mb_uid", mb_uid);
		model.addAttribute("store_uid", store_uid);
		model.addAttribute("review_content", review_content);
		model.addAttribute("review_rate", review_rate);
		command = new CommunityUpdateReviewOkCommand();
		command.execute(model);
		return "community/updateReviewOk";
	}
	
	// 리뷰 수정
	@RequestMapping("/updateReviewOk2.nmj")
	public String updateReviewOk2(int mb_uid, @Param("review_uid") int review_uid, @Param("review_content") String review_content, Model model) {
		model.addAttribute("review_uid", review_uid);
		model.addAttribute("mb_uid", mb_uid);
		model.addAttribute("review_content", review_content);
		command = new CommunityUpdateReviewOkCommand2();
		command.execute(model);
		return "community/updateReviewOk2";
	}
	
	@RequestMapping("/reportReview.nmj")
	public String reportReview(int review_uid, Model model) {
		model.addAttribute("nav", 5);
		model.addAttribute("review_uid", review_uid);
		new CommunityReportReviewCommand().execute(model);
		return "community/reportReview";
	}
	
	@RequestMapping("/reportReply.nmj")
	public String reportReply(int reply_uid, int review_uid, Model model) {
		model.addAttribute("nav", 5);
		model.addAttribute("reply_uid", reply_uid);
		model.addAttribute("review_uid", review_uid);
		new CommunityReportReplyCommand().execute(model);
		return "community/reportReview";
	}
	
	@RequestMapping("/reportReview2.nmj")
	public String reportReview2(int review_uid, Model model) {
		model.addAttribute("nav", 5);
		model.addAttribute("review_uid", review_uid);
		new CommunityReportReviewCommand().execute(model);
		return "community/reportReview2";
	}
	
	@RequestMapping("/reportReply2.nmj")
	public String reportReply2(int reply_uid, int review_uid, Model model) {
		model.addAttribute("nav", 5);
		model.addAttribute("reply_uid", reply_uid);
		model.addAttribute("review_uid", review_uid);
		new CommunityReportReplyCommand().execute(model);
		return "community/reportReview2";
	}
	
	@RequestMapping("/deleteReview.nmj")
	public String deleteReview(int review_uid, Model model) {
		model.addAttribute("nav", 5);
		model.addAttribute("review_uid", review_uid);
		new CommunityDeleteReviewCommand().execute(model);
		return "community/deleteReview";
	}
	
	@RequestMapping("/deleteReview2.nmj")
	public String deleteReview2(int review_uid, Model model) {
		model.addAttribute("nav", 5);
		model.addAttribute("review_uid", review_uid);
		new CommunityDeleteReviewCommand().execute(model);
		return "community/deleteReview2";
	}
	
	@PostMapping(value = "/writeReply.nmj")
	public String insertReply(int mb_uid, int review_uid, String reply_content, Model model) {
		model.addAttribute("nav", 5);
		model.addAttribute("mb_uid", mb_uid);
		model.addAttribute("review_uid", review_uid);
		model.addAttribute("reply_content", reply_content);
		new CommunityWriteReplyCommand().execute(model);
		return "community/writeReply";
	}
	
	@PostMapping(value = "/writeReply2.nmj")
	public String insertReply2(int mb_uid, int review_uid, String reply_content, Model model) {
		model.addAttribute("nav", 5);
		model.addAttribute("mb_uid", mb_uid);
		model.addAttribute("review_uid", review_uid);
		model.addAttribute("reply_content", reply_content);
		new CommunityWriteReplyCommand().execute(model);
		return "community/writeReply2";
	}
	
	@RequestMapping("/deleteReply.nmj")
	public String deleteReply(int reply_uid, int review_uid, Model model) {
		model.addAttribute("nav", 5);
		model.addAttribute("reply_uid", reply_uid);
		model.addAttribute("review_uid", review_uid);
		new CommunityDeleteReplyCommand().execute(model);
		return "community/deleteReply";
	}
	
	@RequestMapping("/deleteReply2.nmj")
	public String deleteReply2(int reply_uid, int review_uid, Model model) {
		model.addAttribute("nav", 5);
		model.addAttribute("reply_uid", reply_uid);
		model.addAttribute("review_uid", review_uid);
		new CommunityDeleteReplyCommand().execute(model);
		return "community/deleteReply2";
	}
	
}
