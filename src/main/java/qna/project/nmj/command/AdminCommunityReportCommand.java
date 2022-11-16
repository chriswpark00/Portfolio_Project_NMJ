package qna.project.nmj.command;

import java.util.Map;

import org.springframework.ui.Model;

import qna.project.nmj.beans.*;
import qna.project.nmj.beans.dao.AdminDAO;

public class AdminCommunityReportCommand implements Command {

	@Override
	public void execute(Model model) {
		AdminDAO dao = C.sqlSession.getMapper(AdminDAO.class);
		
		Map<String, Object> map = model.asMap();
		int request_uid = (Integer)map.get("request_uid");
		
		RequestDTO request = dao.selectRequestByUid(request_uid);
		
		String request_content = request.getRequest_content();
		int review_uid = Integer.parseInt(request_content);
		
		

		ReviewJoinDTO review = dao.selectReviewByUid2(review_uid);

		if(review.getStore_uid() != 0) {
			review = dao.selectReviewByUid(review_uid);
		}
		model.addAttribute("dto", review);
		model.addAttribute("request_uid", request_uid);
	}

}
