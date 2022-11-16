package qna.project.nmj.command;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.ui.Model;

import qna.project.nmj.beans.*;
import qna.project.nmj.beans.dao.AdminDAO;
import qna.project.nmj.beans.dao.ReviewDAO;

public class CommunityViewCommand implements Command {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		int review_uid = (Integer)map.get("review_uid");

		ReviewDAO dao = C.sqlSession.getMapper(ReviewDAO.class);
		dao.increaseViewCount(review_uid); 

		ReviewJoinDTO dto = dao.selectReviewByUid(review_uid);
		model.addAttribute("dto", dto);
		model.addAttribute("list", dao.selectAllReply(review_uid));
	}

}
