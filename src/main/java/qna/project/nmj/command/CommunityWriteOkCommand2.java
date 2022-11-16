package qna.project.nmj.command;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.ReviewJoinDTO;
import qna.project.nmj.beans.dao.ReviewDAO;

public class CommunityWriteOkCommand2 implements Command {

	@Override
	public void execute(Model model) {
		
		int mb_uid = (Integer)model.getAttribute("mb_uid");	
		String review_content = (String)model.getAttribute("review_content");
		review_content = review_content.replace("<p>", "").replace("</p>", "");		

		ReviewDAO dao = C.sqlSession.getMapper(ReviewDAO.class);
		
		int cnt = dao.insertReview2(mb_uid, review_content);
		
		model.addAttribute("result", cnt);
		model.addAttribute("mb_uid", mb_uid);

	}

}
