package qna.project.nmj.command;

import java.io.File;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.RequestDTO;
import qna.project.nmj.beans.StoreDTO;
import qna.project.nmj.beans.dao.StoreMyPageDAO;

public class StoreSettingsRequestOkCommand implements Command {

	@Override
	public void execute(Model model) {
		int cnt = 0;
		boolean existFile = false;
		
		Map<String, Object> map = model.asMap();
		StoreDTO dto = (StoreDTO)map.get("dto");
		MultipartFile upload = (MultipartFile) map.get("upload");
		
		// 2. 이미지 파일 저장할 경로 만들기
		ServletContext context = C.context;
		String saveDirectory = context.getRealPath("img/store");
		
		// 3. 파일 있을 때와 없을 때 처리
		if(upload.getOriginalFilename() == "" || upload.getOriginalFilename() == null) {
			System.out.println("no file");
			dto.setStore_regImg_org("noImage"); //파일 원본명
			dto.setStore_regImg_sav("noImage"); //파일 저장명
			
		} else {
			// 4. 확장자 체크 image/jpg, image/jpeg, image/png, image/gif
			String contentType = upload.getContentType();
			if(contentType.equals("image/jpg") || contentType.equals("image/jpeg") || contentType.equals("image/png") || contentType.equals("image/gif")) {
				// 5. 파일 경로 지정
				File saveFile = new File(saveDirectory, upload.getOriginalFilename());
				try {
					// 6. 지정된 경로에 파일 저장
					upload.transferTo(saveFile);
					existFile = true; //파일 저장 후 파일 첨부 여부 true로 바꿈
					dto.setStore_regImg_org(upload.getOriginalFilename()); //파일 원본명
					dto.setStore_regImg_sav(upload.getOriginalFilename()); //파일 저장명
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
		
		
		
		///////////////////////////////////////////////
		// nmj_request 테이블에 저장할 작업
		/*
		 * store_uid:
		 * store_name:
		 * store_address:
		 * store_regNum:
		 * store_regImg_org:
		 * store_regImg_sav:
		 * store_type:
		 * store_dtype:
		 * store_lat:
		 * store_long:
		 */
		RequestDTO rdto = new RequestDTO();
		rdto.setRequest_type(2); // 수정 요청
		String request_content = "";
		System.out.println(dto.getStore_regImg_org());
		request_content += makePattern("store_uid", "" + dto.getStore_uid());
		request_content += makePattern("store_name", "" + dto.getStore_name());
		request_content += makePattern("store_address", "" + dto.getStore_address());
		request_content += makePattern("store_regNum", "" + dto.getStore_regNum());
		request_content += makePattern("store_regImg_org", "" + dto.getStore_regImg_org());
		request_content += makePattern("store_regImg_sav", "" + dto.getStore_regImg_sav());
		request_content += makePattern("store_type", "" + dto.getStore_type());
		request_content += makePattern("store_dtype", "" + dto.getStore_dtype());
		request_content += makePattern("store_lat", "" + dto.getStore_lat());
		request_content += makePattern("store_long", "" + dto.getStore_long());
		rdto.setRequest_content(request_content);
		System.out.println(rdto.getRequest_content());
		StoreMyPageDAO dao = C.sqlSession.getMapper(StoreMyPageDAO.class);
		cnt = dao.insertRequest(rdto);
		
		model.addAttribute("cnt", cnt);
		///////////////////////////////////////////////////////////////////////////////////////////
		String[] nameValues = request_content.split("NMJnmj");
		System.out.println(nameValues.length);
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
		/*
		 * store_uid:
		 * store_name:
		 * store_address:
		 * store_regNum:
		 * store_regImg_org:
		 * store_regImg_sav:
		 * store_type:
		 * store_dtype:
		 * store_lat:
		 * store_long:
		 */
		
	} // end execute();
	
	private String makePattern(String name, String value) {
		return name.concat(":" + value + "NMJnmj");
	}
	

}
