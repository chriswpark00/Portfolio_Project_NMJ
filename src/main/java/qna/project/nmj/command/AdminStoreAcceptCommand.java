package qna.project.nmj.command;

import java.util.Map;

import org.springframework.ui.Model;

import qna.project.nmj.beans.*;
import qna.project.nmj.beans.dao.AdminDAO;

public class AdminStoreAcceptCommand implements Command {

	@Override
	public void execute(Model model) {
		AdminDAO dao = C.sqlSession.getMapper(AdminDAO.class);
		
		Map<String, Object> map = model.asMap();
		int request_uid = (Integer)map.get("request_uid");
		
		RequestDTO request = dao.selectRequestByUid(request_uid);
		
		String request_content = request.getRequest_content();
		int store_uid = 0;

		String[] nameValue = request_content.split(":");

		store_uid = Integer.parseInt(nameValue[1]);	

		StoreMemberDTO store = dao.selectStoreBySUid(store_uid);
		model.addAttribute("dto", store);
		model.addAttribute("request_uid", request_uid);
	}

}
