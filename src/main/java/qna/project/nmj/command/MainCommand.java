package qna.project.nmj.command;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.dao.MemberDAO;

public class MainCommand implements Command {

	@Override
	public void execute(Model model) {
		MemberDAO dao = C.sqlSession.getMapper(MemberDAO.class);
		
		model.addAttribute("nol", dao.selectHotPlaceNol());
		model.addAttribute("muk", dao.selectHotPlaceMuk());
		model.addAttribute("ja", dao.selectHotPlaceJa());
		model.addAttribute("community", dao.selectCommunity());

	}

}
