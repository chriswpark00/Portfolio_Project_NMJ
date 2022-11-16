package qna.project.nmj.beans.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import qna.project.nmj.beans.LikeDTO;
import qna.project.nmj.beans.MainDTO;
import qna.project.nmj.beans.MemberDTO;
import qna.project.nmj.beans.RequestDTO;
import qna.project.nmj.beans.StoreDTO;
import qna.project.nmj.beans.StoreDetailDTO;
import qna.project.nmj.beans.StoreTypeDTO;

public interface MemberDAO {
	
	// 회원가입
	// 회원가입 - 아이디 중복체크
	public int checkOverId(String mb_id);
	// 회원가입 - 이메일 중복체크
	public int checkOverEmail(String mb_email);
	// 회원가입 - 사업자등록번호 중복체크
	public int checkOverRegNum(String store_regNum);
	// 회원가입 - 매장전화번호 중복체크
	public int checkOverTel(String store_tel);
	// 회원가입 - 회원정보 입력
	public int insertMember(@Param("dto") MemberDTO dto);
	// 회원가입 - 매장회원 mb_uid 불러오기
	public int selectMb_Uid(String mb_id);
	// 회원가입 - 매장회원 정보등록
	public int insertStore(@Param("dto") StoreDTO dto);
	// 회원가입 - 매장 store_uid 불러오기
	public int selectStore_Uid(int mb_uid);
	// 회원가입 - 매장정보 승인요청
	public int insertRequest(@Param("dto") RequestDTO dto);
	
	
	// 아이디 비밀번호 찾기
	// 아이디 찾기
	public MemberDTO selectId(String mb_name, String mb_email);
	// 비밀번호 불러오기
	public MemberDTO selectPw(String mb_id, String mb_name, String mb_email);
	// 비밀번호 수정
	public int updatePw(String mb_pw, String mb_id);
	
	//아이디로 비밀번호 불러오기
	public String login(String mb_id);
	
	//아이디로 mb_uid불러오기
	public int getMbUid(String mb_id);
	
	//아이디로 mb_type불러오기
	public int getMbType(String mb_id);
	
	public int getStoreUid(int mb_uid);
	
	
	// 찜기능
	public LikeDTO getLike(int mb_uid, int store_uid);
	public int likeCancel(int mb_uid, int store_uid);
	public int likeInsert(int mb_uid, int store_uid);
	
	
	
	
	
	
	
	
	// 매장 찾기 페이지
	// 몇번째 from 부터 몇개 rows 를 SELECT
	public ArrayList<StoreDTO> selectStore(int store_type);
	public ArrayList<StoreTypeDTO> selectStoreType(int store_type);
	// public ArrayList<FindStoreDTO> page(int store_type, @Param("fromRow") int fromRow, @Param("writePages") int writePages);
	public int selectStoreCount(int store_type);
	//	public ArrayList<StoreDTO> selectStore(int store_type, int from, int rows);
	
	// 매장 상세 페이지
	public StoreDetailDTO selectStoreDetail(int store_uid);
	public StoreDetailDTO StoreDetailRestSeat(int store_uid);
	public ArrayList<StoreDetailDTO> selectFood(int store_uid);
	public ArrayList<StoreDetailDTO> selectRoom(int store_uid);
	
	
	
	// 메인페이지
	public ArrayList<MainDTO> selectHotPlaceNol();
	public ArrayList<MainDTO> selectHotPlaceMuk();
	public ArrayList<MainDTO> selectHotPlaceJa();
	
	public ArrayList<MainDTO> selectCommunity();
	
	
}
