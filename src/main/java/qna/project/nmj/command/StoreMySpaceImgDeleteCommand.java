package qna.project.nmj.command;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.dao.StoreMyPageDAO;

public class StoreMySpaceImgDeleteCommand implements Command {

	@Override
	public void execute(Model model) {
		int space_img_uid = (int)model.getAttribute("space_img_uid");
		StoreMyPageDAO dao = C.sqlSession.getMapper(StoreMyPageDAO.class);
		int cnt = dao.spaceImageDelete(space_img_uid);
		model.addAttribute("cnt", cnt);
	}

}
