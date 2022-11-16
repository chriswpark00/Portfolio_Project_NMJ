package qna.project.nmj.command;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.dao.AdminDAO;

public class AdminUpdateNoticeCommand implements Command {

	@Override
	public void execute(Model model) {
		
		int notice_uid = (Integer)model.getAttribute("notice_uid");
		String notice_subject = (String)model.getAttribute("notice_subject");
		String notice_content = (String)model.getAttribute("notice_content");
		notice_content = notice_content.replace("<p>", "").replace("</p>", "");		

		AdminDAO dao = C.sqlSession.getMapper(AdminDAO.class);
		
		int cnt = dao.updateNotice(notice_uid, notice_subject, notice_content);
		
		model.addAttribute("result", cnt);
		model.addAttribute("notice_uid", notice_uid);

	}

}
