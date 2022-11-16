package qna.project.nmj.command;

import java.util.Map;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.dao.*;

public class AdminReviewSearchListCommand implements Command {

	@Override
	public void execute(Model model) {
	
		AdminDAO dao = C.sqlSession.getMapper(AdminDAO.class);
		Map<String, Object> map = model.asMap();

		int searchOption = (Integer)map.get("searchOption");
		String search = (String) map.get("search");
		
		if(searchOption == 1) {
			model.addAttribute("list", dao.searchReviewByContent(search));
		} else if(searchOption == 2) {
			model.addAttribute("list", dao.searchReviewById(search));
		} else if(searchOption == 3) {
			model.addAttribute("list", dao.searchReplyByContent(search));
		} else if(searchOption == 4) {
			model.addAttribute("list", dao.searchReplyById(search));
		}
		
	}

}










