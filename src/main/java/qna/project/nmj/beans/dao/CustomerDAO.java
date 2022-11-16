package qna.project.nmj.beans.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import qna.project.nmj.beans.CusMyPageDTO;
import qna.project.nmj.beans.MemberDTO;
import qna.project.nmj.beans.ReservationDTO;

public interface CustomerDAO {
	public MemberDTO selectMemberByUid(int mb_uid);
	public int updateMemberByUid(@Param("dto") MemberDTO dto);
	public int updateMemberByUid2(@Param("dto") MemberDTO dto);
	public ArrayList<CusMyPageDTO> selectReservationByUid(int mb_uid);
	public ArrayList<CusMyPageDTO> selectLikeByUid(int mb_uid);
	public ArrayList<CusMyPageDTO> selectMyReviewByUid(int mb_uid);
	public ArrayList<CusMyPageDTO> selectMyReplyByUid(int mb_uid);
	
	// 예약페이지
	public int insertReservation(@Param("dto") ReservationDTO dto);
	
	// 회원가입
	public int insertSignUpCustomer(@Param("dto") MemberDTO dto);
}
