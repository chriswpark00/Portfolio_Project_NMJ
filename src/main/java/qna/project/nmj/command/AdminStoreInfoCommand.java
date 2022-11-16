package qna.project.nmj.command;

import java.util.Map;

import org.springframework.ui.Model;

import qna.project.nmj.beans.*;
import qna.project.nmj.beans.dao.AdminDAO;

public class AdminStoreInfoCommand implements Command {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		int mb_uid = (Integer)map.get("mb_uid");

		AdminDAO dao = C.sqlSession.getMapper(AdminDAO.class);
		
		MemberDTO dto = dao.selectMemberByUid(mb_uid);
		model.addAttribute("dto", dto);
		
		StoreDTO dto2 = dao.selectStoreByUid(mb_uid);
		model.addAttribute("dto2", dto2);
		
		int ratings = dto2.getStore_ratings();
		int rateCount = dto2.getStore_rateCount();
		
		double rate = (double)ratings/rateCount;
		model.addAttribute("rate", rate);
	}

}
