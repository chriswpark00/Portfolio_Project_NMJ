package qna.project.nmj.command;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.dao.MemberDAO;

@Service
public class UserRegServiceCommand{

	@Autowired
	private SqlSessionTemplate userSqlSessin;
	private MemberDAO dao;

	// 중복 아이디 체크
	public int userIdCheck(String mb_id) {

		dao = userSqlSessin.getMapper(MemberDAO.class);

		return dao.checkOverId(mb_id);
	}
	
	// 중복 이메일 체크
	public int userEmailCheck(String mb_email) {
		
		dao = userSqlSessin.getMapper(MemberDAO.class);
		
		return dao.checkOverEmail(mb_email);
	}
	
	// 중복 사업자등록번호 체크
	public int userRegNumCheck(String store_regNum) {
		
		dao = userSqlSessin.getMapper(MemberDAO.class);
		
		return dao.checkOverRegNum(store_regNum);
	}
	
	// 중복 매장전화번호 체크
	public int userTelCheck(String store_tel) {
		
		dao = userSqlSessin.getMapper(MemberDAO.class);
		
		return dao.checkOverTel(store_tel);
	}
	
}
