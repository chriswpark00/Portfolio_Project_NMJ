package qna.project.nmj.controller;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import qna.project.nmj.ajax.dto.AjaxStoreDTO;
import qna.project.nmj.beans.C;
import qna.project.nmj.beans.dao.MapDAO;

@RestController
@RequestMapping("/ajax/map")
public class AjaxMapController {

	@RequestMapping(value = "/stores.ajax/{lat}/{lon}")
	public ArrayList<AjaxStoreDTO> storesWithDistance(@PathVariable("lat") double lat, @PathVariable("lon") double lon) {
		MapDAO dao = C.sqlSession.getMapper(MapDAO.class);
		ArrayList<AjaxStoreDTO> dto = dao.selectStoresWithDistance(lat, lon);
		for(int i = 0; i < dto.size(); i++) {
			int dtype = dto.get(i).getStore_dtype();
			String icon = "";
			switch (dtype) {
			case 1:
				icon = "pc.png";
				break;
			case 2:
				icon = "karaoke.png";
				break;
			case 3:
				icon = "pool.png";
				break;
			case 4:
				icon = "bowling.png";
				break;
			case 5:
				icon = "cinema.png";
				break;
			case 6: case 7: case 8: case 9:
				icon = "restaurant.png";
				break;
			case 10:
				icon = "fastfood.png";
				break;
			case 11: case 12: case 13: case 14: case 15:
				icon = "hotel.png";
				break;
			case 16:
				icon = "bar.png";
				break;
			default:
				icon = "default.png";
				break;
			}
			dto.get(i).setIcon(icon);
		}
		return dto;
	}
}
