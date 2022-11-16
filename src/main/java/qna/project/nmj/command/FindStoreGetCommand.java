package qna.project.nmj.command;

import java.sql.SQLException;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.dao.MemberDAO;

public class FindStoreGetCommand implements Command {

	@Override
	public void execute(Model model) {
		int store_type = (Integer)model.getAttribute("store_type");
		MemberDAO dao = C.sqlSession.getMapper(MemberDAO.class);
		model.addAttribute("storeType", dao.selectStoreType(store_type));
		// 페이징 관련 세팅 값들
//		int page = 1; // 현재 페이지 (디폴트 1 page)
//		int writePages = 10; // 한 [페이징] 에 몇개의 '페이지' 를 표현할 것인가?
//		int pageRows = 9; // 한 '페이지' 에 몇개의 글을 리스트업 할 것인가?
//		int totalPage = 0; // 총 몇 '페이지' 분량인가?
//		int cnt = 0; // 글은 총 몇개인가?
//		
//		// 현재 몇 페이지?
//		page = (Integer)model.getAttribute("page");
//		
//		
//		// 글 전체 개수 구하기
//		cnt = dao.selectStoreCount(store_type);
//		
//		// 총 몇페이지 분량인가?
//		totalPage = (int)Math.ceil(cnt / (double)pageRows);
//		
//		// 몇번재 row 부터?
//		int fromRow = (page - 1) * pageRows;  // MySQL 은 0 부터 시작 !
//		
//		model.addAttribute("writePages", writePages);
//		model.addAttribute("pageRows", pageRows);
//		model.addAttribute("page", page);
//		model.addAttribute("totalPage", totalPage);
//		model.addAttribute("list", dao.page(store_type, fromRow, pageRows));
//		model.addAttribute("list", dao.page(store_type));
		
	}

}
