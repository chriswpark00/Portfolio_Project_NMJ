package qna.project.nmj.command;

import java.io.File;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.MemberDTO;
import qna.project.nmj.beans.dao.CustomerDAO;
import qna.project.nmj.security.PasswordEncoding;

public class CusUpdateInfoOkCommand implements Command {

	@Override
	public void execute(Model model) {
		// 수정 성공/실패를 위한 변수
		int cnt = 0;
		boolean existFile = false; //파일 첨부 여부
		
		PasswordEncoding pe = new PasswordEncoding();
		
		Map<String, Object> map = model.asMap();
		MemberDTO dto = (MemberDTO)map.get("dto");
//		String mb_name = (String)model.getAttribute("mb_name");
//		System.out.println("Command mb_name : " + mb_name);
//		String mb_tel = (String)model.getAttribute("mb_tel");
//		System.out.println("Command mb_tel : " + mb_tel);
//		String mb_pw = (String)model.getAttribute("mb_pw");
//		System.out.println("Command mb_pw : " + mb_pw);
//		String mb_email = (String)model.getAttribute("mb_email");
//		System.out.println("Command mb_email : " + mb_email);
//		String mb_img_sav = (String)model.getAttribute("mb_img_sav");
//		System.out.println("Command mb_img_sav : " + mb_img_sav);
//		int mb_uid = (Integer)model.getAttribute("mb_uid");
//		System.out.println("Command mb_uid : " + mb_uid);
		
		MultipartFile upload = (MultipartFile)model.getAttribute("upload");
		
		// 2. 이미지 파일 저장할 경로 만들기
		ServletContext context = C.context;
		String saveDirectory = context.getRealPath("img/member");
		
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
					dto.setMb_img_org(upload.getOriginalFilename()); //파일 원본명
					dto.setMb_img_sav(upload.getOriginalFilename()); //파일 저장명
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
		
		CustomerDAO dao = C.sqlSession.getMapper(CustomerDAO.class);
	
		if(existFile) {
			if(dto.getMb_pw() == null || dto.getMb_pw().equals("")) {
				cnt = dao.updateMemberByUid2(dto);
			} else if(dto.getMb_pw() != null || !dto.getMb_pw().equals("")) {
				dto.setMb_pw(pe.encode(dto.getMb_pw()));
				cnt = dao.updateMemberByUid(dto);
			}
		} else {
			if(dto.getMb_pw() == null || dto.getMb_pw().equals("")) {
				cnt = dao.updateMemberByUid2(dto);
			} else if(dto.getMb_pw() != null || !dto.getMb_pw().equals("")) {
				dto.setMb_pw(pe.encode(dto.getMb_pw()));
				cnt = dao.updateMemberByUid(dto);
			}
		}
		
		model.addAttribute("result", cnt);
	}

}
