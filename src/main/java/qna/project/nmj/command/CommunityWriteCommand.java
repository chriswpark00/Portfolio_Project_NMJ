package qna.project.nmj.command;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.MemberDTO;
import qna.project.nmj.beans.StoreDTO;
import qna.project.nmj.beans.dao.*;

public class CommunityWriteCommand implements Command {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		int mb_uid = (Integer)map.get("mb_uid");

		AdminDAO dao = C.sqlSession.getMapper(AdminDAO.class);
		
		MemberDTO member = dao.selectMemberByUid(mb_uid);
		ArrayList<StoreDTO> stores = dao.selectAllStore();
		
		model.addAttribute("member", member);
		model.addAttribute("stores", stores);
	}

}
