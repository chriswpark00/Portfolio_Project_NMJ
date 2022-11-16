package qna.project.nmj.command;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.dao.*;

public class AdminCommunityListCommand2 implements Command {

	@Override
	public void execute(Model model) {
		
		AdminDAO dao = C.sqlSession.getMapper(AdminDAO.class);
		model.addAttribute("list", dao.selectAllReview2());
	}

}










