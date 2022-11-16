package qna.project.nmj.command;

import java.io.File;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.multipart.MultipartFile;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.FoodDTO;
import qna.project.nmj.beans.dao.StoreMyPageDAO;

public class storeMySpaceImgInsertCommand implements Command {

	@Override
	public void execute(Model model) {
		boolean existFile = false;
		int cnt = 0;
		MultipartFile upload = (MultipartFile) model.getAttribute("upload");
		String saveDirectory = C.context.getRealPath("img/space");
		System.out.println(saveDirectory);
		int[] space_uid = (int[])model.getAttribute("space_uid");
		
		String space_img_org = "";
		String space_img_sav = "";
		
		
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
					upload.transferTo(saveFile);
					existFile = true; //파일 저장 후 파일 첨부 여부 true로 바꿈
					space_img_org = upload.getOriginalFilename(); //파일 원본명
					space_img_sav = upload.getOriginalFilename(); //파일 저장명
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
		
			StoreMyPageDAO dao = C.sqlSession.getMapper(StoreMyPageDAO.class);
			for(int i = 0; i < space_uid.length; i++) {
				cnt = dao.spaceImageInsert(space_uid[i], space_img_org, space_img_sav);
			}
		
		model.addAttribute("cnt", cnt);
	}

	}	
}
