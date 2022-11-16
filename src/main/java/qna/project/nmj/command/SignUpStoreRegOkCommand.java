package qna.project.nmj.command;

import java.io.File;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.RequestDTO;
import qna.project.nmj.beans.StoreDTO;
import qna.project.nmj.beans.dao.MemberDAO;

public class SignUpStoreRegOkCommand implements Command {

	@Override
	public void execute(Model model) {
		int cnt = 0;
		
		boolean existFile = false;
		
		Map<String, Object> map = model.asMap();
		StoreDTO dto = (StoreDTO)map.get("dto");
		MultipartFile storeImg = (MultipartFile) map.get("storeImg");
		MultipartFile storeRegImg = (MultipartFile) map.get("storeRegImg");
		
		// 2. 이미지 파일 저장할 경로 만들기
		ServletContext context = C.context;
		String saveDirectory = context.getRealPath("img/store");
		
		// 3. 파일 있을 때와 없을 때 처리
		if(storeImg.getOriginalFilename() == "" || storeImg.getOriginalFilename() == null) {
			System.out.println("no file");
		} else {
			// 4. 확장자 체크 image/jpg, image/jpeg, image/png, image/gif
			String contentType = storeImg.getContentType();
			if(contentType.equals("image/jpg") || contentType.equals("image/jpeg") || contentType.equals("image/png") || contentType.equals("image/gif")) {
				// 5. 파일 경로 지정
				File saveFile = new File(saveDirectory, storeImg.getOriginalFilename());
				try {
					// 6. 지정된 경로에 파일 저장
					storeImg.transferTo(saveFile);
					existFile = true; //파일 저장 후 파일 첨부 여부 true로 바꿈
					dto.setStore_img_org(storeImg.getOriginalFilename()); //파일 원본명
					dto.setStore_img_sav(storeImg.getOriginalFilename()); //파일 저장명
				} catch (Exception e) {
					e.printStackTrace();
					cnt = 500; // 500 : 파일 저장 실패
					model.addAttribute("cnt", cnt);
					return;
				}
			} else {
				System.out.println("not an image file");
				cnt = 101; // 101 : 이미지가 아닌 다른 파일을 업로드 할 경우
				model.addAttribute("cnt", cnt);
				return;
			}
		}
		
		saveDirectory = context.getRealPath("img/store_regNum");
		
		// 3. 파일 있을 때와 없을 때 처리
		if(storeRegImg.getOriginalFilename() == "" || storeRegImg.getOriginalFilename() == null) {
			System.out.println("no file");
		} else {
			// 4. 확장자 체크 image/jpg, image/jpeg, image/png, image/gif
			String contentType = storeRegImg.getContentType();
			if(contentType.equals("image/jpg") || contentType.equals("image/jpeg") || contentType.equals("image/png") || contentType.equals("image/gif")) {
				// 5. 파일 경로 지정
				File saveFile = new File(saveDirectory, storeRegImg.getOriginalFilename());
				try {
					// 6. 지정된 경로에 파일 저장
					storeRegImg.transferTo(saveFile);
					existFile = true; //파일 저장 후 파일 첨부 여부 true로 바꿈
					dto.setStore_regImg_org(storeRegImg.getOriginalFilename()); //파일 원본명
					dto.setStore_regImg_sav(storeRegImg.getOriginalFilename()); //파일 저장명
				} catch (Exception e) {
					e.printStackTrace();
					cnt = 500; // 500 : 파일 저장 실패
					model.addAttribute("cnt", cnt);
					return;
				}
			} else {
				System.out.println("not an image file");
				cnt = 101; // 101 : 이미지가 아닌 다른 파일을 업로드 할 경우
				model.addAttribute("cnt", cnt);
				return;
			}
		}
		
		System.out.println("Command store_name : " + dto.getStore_name());
		System.out.println("Command mb_uid : " + dto.getMb_uid());
		System.out.println("Command store_address : " + dto.getStore_address());
		System.out.println("Command store_regNum : " + dto.getStore_regNum());
		System.out.println("Command store_tel : " + dto.getStore_tel());
		System.out.println("Command store_start : " + dto.getStore_start());
		System.out.println("Command store_end : " + dto.getStore_end());
		System.out.println("Command store_content : " + dto.getStore_content());
		System.out.println("Command store_type : " + dto.getStore_type());
		System.out.println("Command store_dtype : " + dto.getStore_dtype());
		System.out.println("Command store_lat : " + dto.getStore_lat());
		System.out.println("Command store_long : " + dto.getStore_long());
		System.out.println("Command img : " + dto.getStore_img_sav());
		System.out.println("Command regimg : " + dto.getStore_regImg_sav());
		
		String store_hours = dto.getStore_start() + "~" + dto.getStore_end();
		dto.setStore_hours(store_hours);
		System.out.println("Command store_hours : " + dto.getStore_hours());
		
		
		MemberDAO dao = C.sqlSession.getMapper(MemberDAO.class);
		
		// 매장정보등록
		cnt = dao.insertStore(dto);

		// store_uid 불러오기
		int store_uid = dao.selectStore_Uid(dto.getMb_uid());
		System.out.println("Command store_uid : " + store_uid);
		
		// 매장등록 요청
		RequestDTO rdto = new RequestDTO();
		String request_content = "";
		request_content = "store_uid:" + store_uid;
		rdto.setRequest_content(request_content);
		System.out.println("Command request_content : " + request_content);
		rdto.setRequest_type(1); // 'request_type = 1'은 가입 요청
		int rcnt = dao.insertRequest(rdto);
		System.out.println("Command rcnt : " + rcnt);
		
		model.addAttribute("result", cnt);
	}

}
