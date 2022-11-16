package qna.project.nmj.command;

import java.util.Map;

import org.springframework.ui.Model;

import qna.project.nmj.beans.*;
import qna.project.nmj.beans.dao.AdminDAO;

public class AdminStoreAcceptUpdateCommand implements Command {

	@Override
	public void execute(Model model) {
		AdminDAO dao = C.sqlSession.getMapper(AdminDAO.class);
		
		Map<String, Object> map = model.asMap();
		int request_uid = (Integer)map.get("request_uid");
		
		RequestDTO request = dao.selectRequestByUid(request_uid);
		
		String request_content = request.getRequest_content();
		
		String[] nameValues = request_content.split("NMJnmj");

		StoreDTO sdto = new StoreDTO();
		for(int i = 0; i < nameValues.length; i++) {
			String[] nameValue = nameValues[i].split(":");

			String name = nameValue[0];
			String value = nameValue[1];
			System.out.println(name + " :" + value);
			switch (name) {
			case "store_uid":
				sdto.setStore_uid(Integer.parseInt(value));
				break;
			case "store_name":
				sdto.setStore_name(value);
				break;
			case "store_address":
				sdto.setStore_address(value);
				break;
			case "store_regNum":
				sdto.setStore_regNum(value);
				break;
			case "store_regImg_org":
				sdto.setStore_regImg_org(value);
				break;
			case "store_regImg_sav":
				sdto.setStore_regImg_sav(value);
				break;
			case "store_type":
				sdto.setStore_type(Integer.parseInt(value));
				break;
			case "store_dtype":
				sdto.setStore_dtype(Integer.parseInt(value));
				break;
			case "store_lat":
				sdto.setStore_lat(Double.parseDouble(value));
				break;
			case "store_long":
				sdto.setStore_long(Double.parseDouble(value));
				break;
			default:
				break;
			}
		}

		model.addAttribute("dto", sdto);
		model.addAttribute("request_uid", request_uid);
	}

}
