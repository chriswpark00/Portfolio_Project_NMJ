package qna.project.nmj.command;

import java.util.Map;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.dao.*;

public class AdminMemberSearchListCommand implements Command {

	@Override
	public void execute(Model model) {
	
		AdminDAO dao = C.sqlSession.getMapper(AdminDAO.class);
		Map<String, Object> map = model.asMap();

		int searchOption = (Integer)map.get("searchOption");
		String search = (String) map.get("search");
		
		if(searchOption == 1) {
			model.addAttribute("list", dao.searchMemberByName(search));
		} else if(searchOption == 2) {
			model.addAttribute("list", dao.searchMemberById(search));
		}
		
	}

}










