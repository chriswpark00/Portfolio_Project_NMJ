package qna.project.nmj.command;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.dao.AdminDAO;

public class AdminWriteEventCommand implements Command {

	@Override
	public void execute(Model model) {
		
		String notice_subject = (String)model.getAttribute("notice_subject");
		String notice_content = (String)model.getAttribute("notice_content");
		notice_content = notice_content.replace("<p>", "").replace("</p>", "");		
		String notice_startDate = (String)model.getAttribute("notice_startDate");
		String notice_endDate = (String)model.getAttribute("notice_endDate");

		AdminDAO dao = C.sqlSession.getMapper(AdminDAO.class);
		
		int cnt = dao.insertEvent(notice_subject, notice_content, notice_startDate, notice_endDate);
		
		model.addAttribute("result", cnt);

	}

}
