package qna.project.nmj.command;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.dao.MemberDAO;
import qna.project.nmj.security.PasswordEncoding;

public class LoginCommand implements Command {

	@Override
	public void execute(Model model) {
		PasswordEncoding pe = new PasswordEncoding();
		String mb_id = (String)model.getAttribute("mb_id");
		String mb_pw = (String)model.getAttribute("mb_pw");
		MemberDAO dao = C.sqlSession.getMapper(MemberDAO.class);
		if(pe.matches(mb_pw, dao.login(mb_id))) {
			int mb_uid = dao.getMbUid(mb_id);
			model.addAttribute("mb_uid", mb_uid);
			int type =  dao.getMbType(mb_id);
			model.addAttribute("type", type);
			if(type== 2) {
				int store_uid = dao.getStoreUid(mb_uid);
				model.addAttribute("store_uid", store_uid);
				
			}
		}else {
			model.addAttribute("mb_uid", 0);
			model.addAttribute("type", -1);
		}
	}

}
