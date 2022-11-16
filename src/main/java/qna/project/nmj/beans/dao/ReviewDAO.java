package qna.project.nmj.beans.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import qna.project.nmj.beans.*;

public interface ReviewDAO {
	
	public int selectAllReviewCount();
	public int selectAllReviewCount2();
	
	// 리뷰 삽입
	public int insertReview(int mb_uid, int store_uid, String review_content, int review_rate);
	
	// 일반글 삽입
	public int insertReview2(int mb_uid, String review_content);
	
	// 리뷰에서 평점 매김과 동시에 매장 평점 업데이트
	public int increaseReviewRate(int review_rate, int store_uid);
	
	// 리뷰 목록
	public ArrayList<ReviewJoinDTO> selectAllReview();
	public ArrayList<ReviewJoinDTO> selectAllReview2();
	public ArrayList<ReviewJoinDTO> selectByRow(@Param("fromRow") int fromRow, @Param("writePages") int writePages);
	public ArrayList<ReviewJoinDTO> selectByRow2(@Param("fromRow") int fromRow, @Param("writePages") int writePages);
	
	// 댓글 목록
	public ArrayList<ReplyJoinDTO> selectAllReply(int review_uid);
	
	// 리뷰 1개 불러오기
	public ReviewJoinDTO selectReviewByUid(int review_uid);
	
	// 일반글 1개 불러오기
	public ReviewJoinDTO selectReviewByUid2(int review_uid);
	
	// 리뷰 조회수 증가
	public int increaseViewCount(int review_uid);
	
	// 리뷰 신고
	public int reportReview(int review_uid);
	
	// 댓글 신고
	public int reportReply(int reply_uid);
	
	// 리뷰 수정
	public int updateReview(@Param("review_uid") int review_uid, @Param("review_content") String review_content, @Param("store_uid") int store_uid, @Param("review_rate") int review_rate);
	
	// 일반글 수정
	public int updateReview2(@Param("review_uid") int review_uid, @Param("review_content") String review_content);
	
	// 리뷰 삭제
	public int deleteReview(int review_uid);
	public int deleteRequest(int review_uid);
	
	// 댓글 삭제
	public int deleteReply(int reply_uid);

	// 댓글 삽입
	public int insertReply(int mb_uid, int review_uid, String reply_content);
}
