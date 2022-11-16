package qna.project.nmj.command;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.dao.StoreMyPageDAO;

public class StoreMySpaceCommand implements Command{

	@Override
	public void execute(Model model) {
		int store_uid = (Integer)model.getAttribute("store_uid");
		StoreMyPageDAO dao = C.sqlSession.getMapper(StoreMyPageDAO.class);
		model.addAttribute("space_type",dao.spaceListSelect());
		model.addAttribute("space", dao.spaceSelect(store_uid));
		model.addAttribute("reservation", dao.reservSelect(store_uid));
		model.addAttribute("spaceImg", dao.spaceImgSelect(store_uid));
		model.addAttribute("space2", dao.spaceSelect(store_uid));
	}

}
