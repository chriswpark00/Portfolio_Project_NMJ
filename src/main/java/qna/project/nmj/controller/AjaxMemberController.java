package qna.project.nmj.controller;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import qna.project.nmj.ajax.dto.AjaxBoardQueryResult;
import qna.project.nmj.ajax.dto.AjaxSpaceDTO;
import qna.project.nmj.ajax.dto.AjaxStoreDTypeDTO;
import qna.project.nmj.ajax.dto.AjaxStoreFindDTO;
import qna.project.nmj.ajax.dto.AjaxStoreTypeDTO;
import qna.project.nmj.ajax.dto.AjaxStoreTypesDTO;
import qna.project.nmj.beans.AjaxBoardList;
import qna.project.nmj.beans.C;
import qna.project.nmj.beans.FindStoreDTO;
import qna.project.nmj.beans.NoticeDTO;
import qna.project.nmj.beans.ReviewJoinDTO;
import qna.project.nmj.beans.StoreDTO;
import qna.project.nmj.beans.StoreDetailDTO;
import qna.project.nmj.beans.StoreTypeDTO;
import qna.project.nmj.beans.dao.AdminDAO;
import qna.project.nmj.beans.dao.MemberDAO;
import qna.project.nmj.beans.dao.ReviewDAO;
import qna.project.nmj.beans.dao.StoreMyPageDAO;

@RestController
@RequestMapping("/memberAjax")
public class AjaxMemberController {

	@RequestMapping("/findStore.nmj/{writePages}/{page}")
	public AjaxStoreFindDTO findStore(int store_type, 
			@PathVariable("writePages") int writePages,
			@PathVariable("page") int page) {
		AjaxStoreFindDTO ajax = new AjaxStoreFindDTO();
		ArrayList<FindStoreDTO> list = null;
		MemberDAO dao = C.sqlSession.getMapper(MemberDAO.class);
		//list = dao.page(store_type, writePages*(page-1), writePages);
		//ajax.setList(list);
		
		if(list.size() > 0 && list != null) {
			ajax.setStatus("OK");
			ajax.setCount(list.size());
		}else {
			ajax.setStatus("FAIL");
			ajax.setCount(0);
		}
				
		return ajax;
	}
	
	@RequestMapping("/findStoreBtn.nmj/{store_dtype}")
	public AjaxStoreFindDTO findStoreBtn(int store_dtype, 
			@PathVariable("writePages") int writePages,
			@PathVariable("page") int page) {
		AjaxStoreFindDTO ajax = new AjaxStoreFindDTO();
		ArrayList<FindStoreDTO> list = null;
		MemberDAO dao = C.sqlSession.getMapper(MemberDAO.class);
		//list = dao.page(store_dtype, writePages*(page-1), writePages);
		ajax.setList(list);
		
		if(list.size() > 0 && list != null) {
			ajax.setStatus("OK");
			ajax.setCount(list.size());
		}else {
			ajax.setStatus("FAIL");
			ajax.setCount(0);
		}

		return ajax;
	}
	
	@RequestMapping("/dtypeList.ajax")
	public AjaxStoreTypesDTO dtypeList() {
		AjaxStoreTypesDTO ajaxDTO = new AjaxStoreTypesDTO();
		ArrayList<StoreTypeDTO> storeDTO = new ArrayList<>();
		ArrayList<AjaxStoreTypeDTO> store_types = new ArrayList<>();
		ArrayList<AjaxStoreDTypeDTO> store_dtypes = null;
		ArrayList<StoreDTO> stores = null;
		ArrayList<StoreDTO> storesPointer = null;
		
		StoreMyPageDAO dao = C.sqlSession.getMapper(StoreMyPageDAO.class);
		storeDTO = dao.selectAllStoreDType();
		stores = dao.selectAllStores();
		int count = storeDTO.size();
		ajaxDTO.setCount(count);
		
		if(count > 0) {
			ajaxDTO.setStatus("OK");
		} else {
			ajaxDTO.setStatus("FAIL");
		}
		
		// store_type 별
		for (int i = 1; i <= 3; i++) {
			AjaxStoreTypeDTO type = new AjaxStoreTypeDTO();
			type.setStore_type(i);
			
			// store_type 별 store_dtype담기
			store_dtypes = new ArrayList<>();
			for (int j = 0; j < storeDTO.size(); j++) {
				if(storeDTO.get(j).getStore_type() == i) {
					AjaxStoreDTypeDTO dtype = new AjaxStoreDTypeDTO(storeDTO.get(j).getStore_dtype(), storeDTO.get(j).getStore_dname());
					storesPointer = new ArrayList<StoreDTO>();
					for(int k = 0; k < stores.size(); k++) {
						if(stores.get(k).getStore_dtype() == dtype.getStore_dtype()) {
							storesPointer.add(stores.get(k));
						}
					}
					dtype.setStores(storesPointer);
					store_dtypes.add(dtype);
				}
			}
			type.setStore_dtypes(store_dtypes);
			store_types.add(type);
		}
		
		ajaxDTO.setStore_types(store_types);
		
		
		return ajaxDTO;
	}
	
	@RequestMapping("/communityList.nmj/{writePages}/{page}")
	public AjaxBoardList list(@PathVariable("writePages") int writePages,
			@PathVariable("page") int page ) {
		AjaxBoardList result = new AjaxBoardList();
		ArrayList<ReviewJoinDTO> list = null;
		
		// 페이징 처리 결과 --> list
		ReviewDAO dao = C.sqlSession.getMapper(ReviewDAO.class);
		list = dao.selectByRow((page - 1) * writePages, writePages);
		result.setList(list);
		
		AdminDAO dao1 = C.sqlSession.getMapper(AdminDAO.class);
		ArrayList<NoticeDTO> noticeList = dao1.selectAllNotice();
		result.setNoticeList(noticeList);
		
		// 읽어들인 글 내용이 있는 경우와 없는 경우 나누어 처리
		if(list != null && list.size() > 0) {
			result.setStatus("OK");
			result.setCount(list.size());
		} else {
			result.setStatus("FAIL");
		}
		
		return result;
	}
	
	@RequestMapping("/communityList2.nmj/{writePages}/{page}")
	public AjaxBoardList list2(@PathVariable("writePages") int writePages,
			@PathVariable("page") int page ) {
		AjaxBoardList result = new AjaxBoardList();
		ArrayList<ReviewJoinDTO> list = null;
		
		// 페이징 처리 결과 --> list
		ReviewDAO dao = C.sqlSession.getMapper(ReviewDAO.class);
		list = dao.selectByRow2((page - 1) * writePages, writePages);
		result.setList(list);
		
		AdminDAO dao1 = C.sqlSession.getMapper(AdminDAO.class);
		ArrayList<NoticeDTO> noticeList = dao1.selectAllNotice();
		result.setNoticeList(noticeList);
		
		// 읽어들인 글 내용이 있는 경우와 없는 경우 나누어 처리
		if(list != null && list.size() > 0) {
			result.setStatus("OK");
			result.setCount(list.size());
		} else {
			result.setStatus("FAIL");
		}
		
		return result;
	}
	
	@PostMapping(value="/insertLike")
	public AjaxBoardQueryResult insertLike(int mb_uid, int store_uid) {
		AjaxBoardQueryResult qr = new AjaxBoardQueryResult();
		MemberDAO dao = C.sqlSession.getMapper(MemberDAO.class);
		int cnt = 0; 
		cnt = dao.likeInsert(mb_uid, store_uid);
		if(cnt != 0) {
			qr.setStatus("OK");
			qr.setCount(cnt);
		}else {
			qr.setStatus("FAIL");
			qr.setCount(cnt);
		}
		return qr;
	}
	
	@PostMapping(value="/deleteLike")
	public AjaxBoardQueryResult deleteLike(int mb_uid, int store_uid) {
		AjaxBoardQueryResult qr = new AjaxBoardQueryResult();
		MemberDAO dao = C.sqlSession.getMapper(MemberDAO.class);
		int cnt = 0; 
		cnt = dao.likeCancel(mb_uid, store_uid);
		if(cnt != 0) {
			qr.setStatus("OK");
			qr.setCount(cnt);
		}else {
			qr.setStatus("FAIL");
			qr.setCount(cnt);
		}
		return qr;
	}
	
	
	@RequestMapping(value = "/roomList/{store_uid}")
	public ArrayList<AjaxSpaceDTO> AjaxRoomList(@PathVariable("store_uid") int store_uid) {
		MemberDAO dao = C.sqlSession.getMapper(MemberDAO.class);
		ArrayList<StoreDetailDTO> dto = dao.selectRoom(store_uid);
		ArrayList<AjaxSpaceDTO> sdto = new ArrayList<AjaxSpaceDTO>();
		
		int space_uid = 0;
		int index = 0;
		for(int i = 0; i < dto.size(); i = index) {
			int uid = dto.get(i).getSpace_uid();
			String name = dto.get(i).getSpace_name();
			int price = dto.get(i).getSpace_price();
			
			AjaxSpaceDTO spacedto = new AjaxSpaceDTO();
			spacedto.setSpace_uid(uid);
			spacedto.setSpace_name(name);
			spacedto.setSpace_price(price);
			ArrayList<String> images = new ArrayList<String>();
			
			for(int j = index; j < dto.size(); j++) {
				if(dto.get(i).getSpace_uid() == dto.get(j).getSpace_uid()) {
					images.add(dto.get(j).getSpace_img_sav());
					index = j + 1;
				}
			}
			
			spacedto.setSpace_images(images);
			sdto.add(spacedto);
		}
		
		return sdto;
	}
	
	
	
	
}







