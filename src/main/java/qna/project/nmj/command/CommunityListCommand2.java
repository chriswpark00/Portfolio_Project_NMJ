package qna.project.nmj.command;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.dao.*;

public class CommunityListCommand2 implements Command {

	@Override
	public void execute(Model model) {
		
		ReviewDAO dao = C.sqlSession.getMapper(ReviewDAO.class);
		model.addAttribute("totalPage", dao.selectAllReviewCount2());
		
		AdminDAO dao1 = C.sqlSession.getMapper(AdminDAO.class);
		// model.addAttribute("list", dao1.selectAllNotice());
		model.addAttribute("list", dao1.selectAllOngoingEvent());
	}

}










