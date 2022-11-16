package qna.project.nmj.controller;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import qna.project.nmj.ajax.dto.AjaxBoardQueryResult;
import qna.project.nmj.ajax.dto.AjaxSpaceImgDTO;
import qna.project.nmj.ajax.dto.AjaxStoreDTypeDTO;
import qna.project.nmj.ajax.dto.AjaxStoreTypeDTO;
import qna.project.nmj.ajax.dto.AjaxStoreTypesDTO;
import qna.project.nmj.beans.C;
import qna.project.nmj.beans.FoodDTO;
import qna.project.nmj.beans.SpaceDTO;
import qna.project.nmj.beans.StoreDTO;
import qna.project.nmj.beans.StoreTypeDTO;
import qna.project.nmj.beans.dao.MemberDAO;
import qna.project.nmj.beans.dao.StoreMyPageDAO;

@RestController
@RequestMapping("/ajax/store")
public class AjaxStoreMyPageController {
	
	// 매장 회원 정보 수정 요청 페이지 (storeSettingsRequest)
	// 매장 상세 종류 불러오기
	
	@RequestMapping("/dtypeList.ajax")
	public AjaxStoreTypesDTO dtypeList() {
		AjaxStoreTypesDTO ajaxDTO = new AjaxStoreTypesDTO();
		ArrayList<StoreTypeDTO> storeDTO = new ArrayList<>();
		ArrayList<AjaxStoreTypeDTO> store_types = new ArrayList<>();
		ArrayList<AjaxStoreDTypeDTO> store_dtypes = null;
		
		StoreMyPageDAO dao = C.sqlSession.getMapper(StoreMyPageDAO.class);
		storeDTO = dao.selectAllStoreDType();
		
		int count = storeDTO.size();
		ajaxDTO.setCount(count);
		
		if(count > 0) {
			ajaxDTO.setStatus("OK");
		} else {
			ajaxDTO.setStatus("FAIL");
		}
		
		
		for (int i = 1; i <= 3; i++) {
			AjaxStoreTypeDTO type = new AjaxStoreTypeDTO();
			type.setStore_type(i);
			
			store_dtypes = new ArrayList<>();
			for (int j = 0; j < storeDTO.size(); j++) {
				if(storeDTO.get(j).getStore_type() == i) {
					AjaxStoreDTypeDTO dtype = new AjaxStoreDTypeDTO(storeDTO.get(j).getStore_dtype(), storeDTO.get(j).getStore_dname());
					store_dtypes.add(dtype);
				}
			}
			type.setStore_dtypes(store_dtypes);
			store_types.add(type);
		}
		
		ajaxDTO.setStore_types(store_types);
		
		
		return ajaxDTO;
	}
	@RequestMapping(value = "/foodList.ajax/{store_uid}")
	public ArrayList<FoodDTO> foodList(@PathVariable("store_uid") int store_uid) {
		ArrayList<FoodDTO> dto = new ArrayList<FoodDTO>();
		StoreMyPageDAO dao = C.sqlSession.getMapper(StoreMyPageDAO.class);
		dto = dao.selectFoodByStoreUid(store_uid);
		for(int i = 0; i < dto.size(); i++) {
			String img = dto.get(i).getFood_img_sav();
			if(img == null || img.equals("")) {
				dto.get(i).setFood_img_org("foodDefault.png");
				dto.get(i).setFood_img_sav("foodDefault.png");
			}
		}
		return dto;
	}
	
	@PostMapping(value="/space.ajax")
	public void space(SpaceDTO dto) {
		System.out.println("들어옴");
		StoreMyPageDAO dao  = C.sqlSession.getMapper(StoreMyPageDAO.class);
		dao.spaceInsert(dto);
	}
	
	@PostMapping(value="/spaceempty.ajax")
	public AjaxBoardQueryResult spaceEmpty(SpaceDTO dto) {
		StoreMyPageDAO dao = C.sqlSession.getMapper(StoreMyPageDAO.class);
		AjaxBoardQueryResult qr = new AjaxBoardQueryResult();
		int cnt = dao.spaceEmpty(dto.getSpace_uid(), dto.getSpace_empty());
		if(cnt != 0) {
			qr.setCount(cnt);
			qr.setStatus("OK");
		}else {
			qr.setCount(cnt);
			qr.setStatus("FAIL");
		}
		return qr;
	}
	
	@PostMapping(value="/reservationOk.ajax")
	public void reservationOk(int reservation_uid) {
		StoreMyPageDAO dao = C.sqlSession.getMapper(StoreMyPageDAO.class);
		dao.reservationOk(reservation_uid);
	}
	
	@PostMapping(value="/reservationNo.ajax")
	public void reservationNo(int reservation_uid) {
		StoreMyPageDAO dao = C.sqlSession.getMapper(StoreMyPageDAO.class);
		dao.reservationNo(reservation_uid);
	}
	
	@PostMapping(value="/spaceDelete.ajax")
	public void spaceDelete(int space_uid) {
		StoreMyPageDAO dao = C.sqlSession.getMapper(StoreMyPageDAO.class);
		dao.spaceDelete(space_uid);
	}
	
	@PostMapping(value="/getSpaceImg.ajax")
	public AjaxSpaceImgDTO getSpaceImg(int space_uid) {
		AjaxSpaceImgDTO qr = new AjaxSpaceImgDTO();
		StoreMyPageDAO dao = C.sqlSession.getMapper(StoreMyPageDAO.class);
		qr.setList(dao.spaceSelectByUid(space_uid));
		if(qr.getList().size() > 0) {
			qr.setCount(qr.getList().size());
			qr.setStatus("OK");
		}else {
			qr.setCount(0);
			qr.setStatus("FAIL");
		}
		return qr;
	}
}
