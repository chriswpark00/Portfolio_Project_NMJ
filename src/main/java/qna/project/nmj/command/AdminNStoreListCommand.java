package qna.project.nmj.command;

import java.util.Map;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.dao.*;

public class AdminNStoreListCommand implements Command {

	@Override
	public void execute(Model model) {
		
		AdminDAO dao = C.sqlSession.getMapper(AdminDAO.class);
		Map<String, Object> map = model.asMap();

		int store_type = (Integer)map.get("store_type");
		
		if(store_type == 1) {
			model.addAttribute("list", dao.selectNStore());
		} else if(store_type == 2) {
			model.addAttribute("list", dao.selectMStore());
		} else {
			model.addAttribute("list", dao.selectJStore());
		}
	}

}










