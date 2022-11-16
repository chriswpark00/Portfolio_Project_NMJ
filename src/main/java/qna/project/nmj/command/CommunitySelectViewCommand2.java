package qna.project.nmj.command;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.MemberDTO;
import qna.project.nmj.beans.ReviewDTO;
import qna.project.nmj.beans.ReviewJoinDTO;
import qna.project.nmj.beans.StoreDTO;
import qna.project.nmj.beans.dao.AdminDAO;
import qna.project.nmj.beans.dao.ReviewDAO;

public class CommunitySelectViewCommand2 implements Command {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		int mb_uid = (Integer)map.get("mb_uid");
		int review_uid = (Integer)map.get("review_uid");
		
		ReviewDAO rdao = C.sqlSession.getMapper(ReviewDAO.class);
		model.addAttribute("dto", rdao.selectReviewByUid2(review_uid));
		
		AdminDAO dao = C.sqlSession.getMapper(AdminDAO.class);
		
		MemberDTO member = dao.selectMemberByUid(mb_uid);
		model.addAttribute("member", member);

	}

}
