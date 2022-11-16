package qna.project.nmj.command;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.ReviewJoinDTO;
import qna.project.nmj.beans.dao.ReviewDAO;

public class CommunityWriteReplyCommand implements Command {

	@Override
	public void execute(Model model) {
		
		int mb_uid = (Integer)model.getAttribute("mb_uid");
		int review_uid = (Integer)model.getAttribute("review_uid");
		String reply_content = (String)model.getAttribute("reply_content");

		ReviewDAO dao = C.sqlSession.getMapper(ReviewDAO.class);
		
		int cnt = dao.insertReply(mb_uid, review_uid, reply_content);
		
		model.addAttribute("result", cnt);
		model.addAttribute("mb_uid", mb_uid);
		model.addAttribute("review_uid", review_uid);
	}

}
