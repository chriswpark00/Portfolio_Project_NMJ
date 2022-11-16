package qna.project.nmj.command;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.ui.Model;

import qna.project.nmj.beans.*;
import qna.project.nmj.beans.dao.AdminDAO;
import qna.project.nmj.beans.dao.ReviewDAO;

public class CommunityNoticeViewCommand implements Command {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		int notice_uid = (Integer)map.get("notice_uid");

		AdminDAO dao = C.sqlSession.getMapper(AdminDAO.class);
		dao.increaseNoticeViewCount(notice_uid); 

		model.addAttribute("dto", dao.selectNoticeByUid(notice_uid));
	}

}
