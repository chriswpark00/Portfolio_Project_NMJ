package qna.project.nmj.command;


import java.util.Map;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.MemberDTO;
import qna.project.nmj.beans.dao.MemberDAO;

public class MbFindIdOkCommand implements Command {

	@Override
	public void execute(Model model) {
		MemberDTO dto = null;
		MemberDAO dao = C.sqlSession.getMapper(MemberDAO.class);
		
		Map<String, Object> map = model.asMap();
		
		String mb_name = (String)map.get("mb_name");
		System.out.println("Command mb_name : " + mb_name);
		String mb_email = (String)map.get("mb_email");
		System.out.println("Command mb_email : " + mb_email);
		
//		String mb_name = (String)model.getAttribute("mb_name");
//		System.out.println("Command " + mb_name);
//		String mb_email = (String)model.getAttribute("mb_email");
//		System.out.println("Command " + mb_email);
		
		dto = dao.selectId(mb_name, mb_email);
//		System.out.println("Command dto " + dto.getMb_name()); 
//		System.out.println("Command dto " + dto.getMb_email());
		String result = "";
		if(dto != null) {
			if (mb_name.equals(dto.getMb_name())) {	// null 값이 담길 경우 null 값으로 메소드 사용 및 비교를 해야하기 때문에 에러
				System.out.println("Command result : " + result);
				result = dto.getMb_id().substring(0, 5) + dto.getMb_id().substring(5).replace(dto.getMb_id().substring(5), "*****");
			} 			
		}
		model.addAttribute("findIdOk", result);
	}

}
