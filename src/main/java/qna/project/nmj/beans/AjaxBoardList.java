package qna.project.nmj.beans;

import java.util.ArrayList;

public class AjaxBoardList {
	int count;   // 데이터 개수
	String status;   // 처리 결과
	ArrayList<ReviewJoinDTO> list; // 데이터
	ArrayList<NoticeDTO> noticeList; // 데이터
	
	// 기본생성자, 매개변수 생성자, getter,setter 만들기
	
	public AjaxBoardList() {}
	
	public AjaxBoardList(int count, String status, ArrayList<ReviewJoinDTO> list, ArrayList<NoticeDTO> noticeList) {
		super();
		this.count = count;
		this.status = status;
		this.list = list;
		this.noticeList = noticeList;
	}

	public int getCount() {
		return count;
	}
	public void setCount(int num) {
		this.count = num;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public ArrayList<ReviewJoinDTO> getList() {
		return list;
	}
	public void setList(ArrayList<ReviewJoinDTO> list) {
		this.list = list;
	}

	public ArrayList<NoticeDTO> getNoticeList() {
		return noticeList;
	}

	public void setNoticeList(ArrayList<NoticeDTO> noticeList) {
		this.noticeList = noticeList;
	}
}
