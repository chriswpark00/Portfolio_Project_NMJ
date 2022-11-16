package qna.project.nmj.command;

import java.util.Map;

import org.springframework.ui.Model;

import qna.project.nmj.beans.*;
import qna.project.nmj.beans.dao.AdminDAO;

public class AdminCommunityInfoCommand implements Command {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		int review_uid = (Integer)map.get("review_uid");

		AdminDAO dao = C.sqlSession.getMapper(AdminDAO.class);
		dao.increaseViewCount(review_uid); 
		
		ReviewJoinDTO dto = dao.selectReviewByUid2(review_uid);
		
		if(dto.getStore_uid() != 0) {
			dto = dao.selectReviewByUid(review_uid);
		}
		model.addAttribute("dto", dto);
	}

}
