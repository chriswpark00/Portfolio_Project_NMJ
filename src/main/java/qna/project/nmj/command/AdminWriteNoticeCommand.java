package qna.project.nmj.command;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.dao.AdminDAO;

public class AdminWriteNoticeCommand implements Command {

	@Override
	public void execute(Model model) {
		
		String notice_subject = (String)model.getAttribute("notice_subject");
		String notice_content = (String)model.getAttribute("notice_content");
		notice_content = notice_content.replace("<p>", "").replace("</p>", "");		

		AdminDAO dao = C.sqlSession.getMapper(AdminDAO.class);
		
		int cnt = dao.insertNotice(notice_subject, notice_content);
		
		model.addAttribute("result", cnt);

	}

}
