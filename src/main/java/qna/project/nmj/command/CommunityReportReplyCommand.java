package qna.project.nmj.command;

import java.util.Map;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.ReviewDTO;
import qna.project.nmj.beans.dao.ReviewDAO;

public class CommunityReportReplyCommand implements Command {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		int reply_uid = (Integer)map.get("reply_uid");
		int review_uid = (Integer)map.get("review_uid");

		ReviewDAO dao = C.sqlSession.getMapper(ReviewDAO.class);
		
		int cnt = dao.reportReply(reply_uid);
		model.addAttribute("result", cnt);
		model.addAttribute("review_uid", review_uid);
	}

}
