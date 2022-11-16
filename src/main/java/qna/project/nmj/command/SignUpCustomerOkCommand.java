package qna.project.nmj.command;

import java.util.Map;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.MemberDTO;
import qna.project.nmj.beans.dao.MemberDAO;
import qna.project.nmj.security.PasswordEncoding;

public class SignUpCustomerOkCommand implements Command {

	@Override
	public void execute(Model model) {
		int cnt = 0;
		PasswordEncoding pe = new PasswordEncoding();
		Map<String, Object> map = model.asMap();
		MemberDTO dto = (MemberDTO)map.get("dto");
		dto.setMb_pw(pe.encode(dto.getMb_pw()));
		//////////////////
		MemberDAO dao = C.sqlSession.getMapper(MemberDAO.class);
		
		cnt = dao.insertMember(dto); // sql 쿼리 실행 문
		int mb_uid = dao.selectMb_Uid(dto.getMb_id());
		
		model.addAttribute("mb_uid", mb_uid);
		model.addAttribute("result", cnt);
	}

}
