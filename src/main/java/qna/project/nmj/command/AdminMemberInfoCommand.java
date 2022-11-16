package qna.project.nmj.command;

import java.util.Map;

import org.springframework.ui.Model;

import qna.project.nmj.beans.*;
import qna.project.nmj.beans.dao.AdminDAO;

public class AdminMemberInfoCommand implements Command {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		int mb_uid = (Integer)map.get("mb_uid");

		AdminDAO dao = C.sqlSession.getMapper(AdminDAO.class);
		
		MemberDTO dto = dao.selectMemberByUid(mb_uid);
		model.addAttribute("dto", dto);
	}

}
