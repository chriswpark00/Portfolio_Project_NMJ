package qna.project.nmj.command;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.StoreDTO;
import qna.project.nmj.beans.StoreTypeDTO;
import qna.project.nmj.beans.dao.StoreMyPageDAO;

public class StoreSettingsCommand implements Command {

	@Override
	public void execute(Model model) {
		// 1. parameter 불어오기
		int store_uid = (Integer)model.getAttribute("store_uid");
		
		// 2. dao 생성
		StoreMyPageDAO dao = C.sqlSession.getMapper(StoreMyPageDAO.class);
		
		// 3. dao의  쿼리문 실행
		// mapper xml 적용
		StoreDTO result = dao.selectStoreByUid(store_uid);
		String hours = result.getStore_hours();
		String[] start_end = hours.split("~");
		System.out.println(start_end.length);
		System.out.println(start_end[0]);
		System.out.println(start_end[1]);
		result.setStore_start(start_end[0]);
		result.setStore_end(start_end[1]);
		String storeType = "";
		switch (result.getStore_type()) {
		case 1://놀자
			storeType = "놀자";
			break;
		case 2://먹자
			storeType = "먹자";
			break;
		case 3://자자
			storeType = "자자";
			break;
		default:
			storeType = "해당없음";
			break;
		}
		model.addAttribute("storeType", storeType);
		model.addAttribute("result", result);
	}
	
}
