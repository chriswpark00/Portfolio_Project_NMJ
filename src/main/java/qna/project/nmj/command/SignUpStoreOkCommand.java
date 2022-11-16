package qna.project.nmj.command;

import java.util.Map;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.MemberDTO;
import qna.project.nmj.beans.dao.MemberDAO;
import qna.project.nmj.security.PasswordEncoding;

public class SignUpStoreOkCommand implements Command {

	@Override
	public void execute(Model model) {
		int cnt = 0;
		PasswordEncoding pe = new PasswordEncoding();
		Map<String, Object> map = model.asMap();
		MemberDTO dto = (MemberDTO)map.get("dto");
		dto.setMb_pw(pe.encode(dto.getMb_pw()));
		// 매장회원일 때 mb_type 대기상태로
		dto.setMb_type(0);
		MemberDAO dao = C.sqlSession.getMapper(MemberDAO.class);
		
		cnt = dao.insertMember(dto);
		int mb_uid = dao.selectMb_Uid(dto.getMb_id());
		
		model.addAttribute("mb_uid", mb_uid);
		model.addAttribute("result", cnt);
	}

}
