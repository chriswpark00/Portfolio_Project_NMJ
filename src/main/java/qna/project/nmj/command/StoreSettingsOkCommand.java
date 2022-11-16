package qna.project.nmj.command;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.taglibs.standard.extra.spath.Path;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.StoreDTO;
import qna.project.nmj.beans.dao.StoreMyPageDAO;

public class StoreSettingsOkCommand implements Command {

	@Override
	public void execute(Model model) {
		// 수정 성공/실패를 위한 변수
		int cnt = 0;
		boolean existFile = false; //파일 첨부 여부
		
		// 1. parameter 받아오기
		Map<String, Object> map = model.asMap();
		StoreDTO dto = (StoreDTO)map.get("dto");
		MultipartFile upload = (MultipartFile) map.get("upload");
		
		// 2. 이미지 파일 저장할 경로 만들기
		ServletContext context = C.context;
		String saveDirectory = context.getRealPath("img/store/");
		
		// 3. 파일 있을 때와 없을 때 처리
		if(upload.getOriginalFilename() == "" || upload.getOriginalFilename() == null) {
			System.out.println("no file");
		} else {
			// 4. 확장자 체크 image/jpg, image/jpeg, image/png, image/gif
			String contentType = upload.getContentType();
			if(contentType.equals("image/jpg") || contentType.equals("image/jpeg") || contentType.equals("image/png") || contentType.equals("image/gif")) {
				// 5. 파일 경로 지정
				File saveFile = new File(saveDirectory, upload.getOriginalFilename());
				try {
					// 6. 지정된 경로에 파일 저장
					upload.transferTo(saveFile); // 동일안 이름.확장자 덮어씌움
					existFile = true; //파일 저장 후 파일 첨부 여부 true로 바꿈
					dto.setStore_img_org(upload.getOriginalFilename()); //파일 원본명
					dto.setStore_img_sav(upload.getOriginalFilename()); //파일 저장명
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
		
		/////////////////////////////////////////////////
		// 파일 명 및 매장 정보 DB 수정 작업
		String start = dto.getStore_start();
		String end = dto.getStore_end();
		dto.setStore_hours(start + "~" + end); //영업시간 추가
		
		StoreMyPageDAO dao = C.sqlSession.getMapper(StoreMyPageDAO.class);
		if(existFile) {
			cnt = dao.updateStoreWImageByUid(dto);
		} else {
			cnt = dao.updateStoreWOImageByUid(dto);
		}
		
		model.addAttribute("cnt", cnt);
		
	}

}
