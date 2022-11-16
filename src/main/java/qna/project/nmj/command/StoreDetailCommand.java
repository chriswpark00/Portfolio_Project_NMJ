package qna.project.nmj.command;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.dao.MemberDAO;

public class StoreDetailCommand implements Command{

	@Override
	public void execute(Model model) {
		int store_uid = (Integer)model.getAttribute("store_uid");
		int mb_uid = (Integer)model.getAttribute("mb_uid");
		MemberDAO dao = C.sqlSession.getMapper(MemberDAO.class);
		model.addAttribute("list", dao.selectStoreDetail(store_uid));
		model.addAttribute("restSeat", dao.StoreDetailRestSeat(store_uid));
		
		model.addAttribute("foodMenu", dao.selectFood(store_uid));
		model.addAttribute("roomMenu", dao.selectRoom(store_uid));

		model.addAttribute("like", dao.getLike(mb_uid, store_uid));
		
	}
	
}
