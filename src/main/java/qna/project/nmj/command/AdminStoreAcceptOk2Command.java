package qna.project.nmj.command;

import java.util.Map;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.MemberDTO;
import qna.project.nmj.beans.dao.AdminDAO;

public class AdminStoreAcceptOk2Command implements Command {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		int store_uid = (Integer)map.get("store_uid");
		int request_uid = (Integer)map.get("request_uid");
		String store_name = (String)map.get("store_name");
		String store_address = (String)map.get("store_address");
		String store_regNum = (String)map.get("store_regNum");
		String store_regImg_org = (String)map.get("store_regImg_org");
		String store_regImg_sav = (String)map.get("store_regImg_sav");
		int store_type = (Integer)map.get("store_type");
		int store_dtype = (Integer)map.get("store_dtype");
		double store_lat = (Double)map.get("store_lat");
		double store_long = (Double)map.get("store_long");

		System.out.println("1234TEst" + store_regImg_org);
		AdminDAO dao = C.sqlSession.getMapper(AdminDAO.class);
		
		int cnt = 0;
		
		if(store_regImg_org.trim().equals("noImage") || store_regImg_org.trim() == "noImage") {
			System.out.println("이미지 없음 TEST");
			cnt = dao.updateStore2(store_uid, store_name, store_address, store_regNum, store_type, store_dtype, store_lat, store_long);
		} else {
			System.out.println("이미지 있음 TEST");
			cnt = dao.updateStore(store_uid, store_name, store_address, store_regNum, store_regImg_org, store_regImg_sav, store_type, store_dtype, store_lat, store_long);
		}
		
		dao.solveRequest(request_uid);
		
		model.addAttribute("result", cnt);
	}

}













