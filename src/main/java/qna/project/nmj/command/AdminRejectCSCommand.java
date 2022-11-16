package qna.project.nmj.command;

import java.util.Map;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.MemberDTO;
import qna.project.nmj.beans.dao.AdminDAO;

public class AdminRejectCSCommand implements Command {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		int request_uid = (Integer)map.get("request_uid");
		int mb_uid = (Integer)map.get("mb_uid");
		
		AdminDAO dao = C.sqlSession.getMapper(AdminDAO.class);
		
		int cnt = dao.rejectRequest(request_uid);
		dao.deleteMember(mb_uid);
		
		model.addAttribute("result", cnt);
	}

}













