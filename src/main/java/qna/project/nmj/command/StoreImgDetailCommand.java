package qna.project.nmj.command;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.dao.StoreMyPageDAO;

public class StoreImgDetailCommand implements Command {

	@Override
	public void execute(Model model) {
		int space_uid = (Integer)model.getAttribute("space_uid");
		StoreMyPageDAO dao = C.sqlSession.getMapper(StoreMyPageDAO.class);
		model.addAttribute("spaceImg", dao.spaceSelectByUid(space_uid));
	}

}
