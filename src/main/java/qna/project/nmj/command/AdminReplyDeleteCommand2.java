package qna.project.nmj.command;

import java.util.Map;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.MemberDTO;
import qna.project.nmj.beans.dao.AdminDAO;

public class AdminReplyDeleteCommand2 implements Command {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		int reply_uid = (Integer)map.get("reply_uid");
		int request_uid = (Integer)map.get("request_uid");
		
		AdminDAO dao = C.sqlSession.getMapper(AdminDAO.class);
		
		int cnt = dao.deleteReply(reply_uid);
		dao.solveRequest(request_uid);
		
		model.addAttribute("result", cnt);
	}

}













