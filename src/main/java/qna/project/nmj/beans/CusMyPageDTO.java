package qna.project.nmj.beans;

import java.sql.Timestamp;

// 마이페이지 - 예약/찜 목록 보기, 내 리뷰 보기 페이지에 대한 DTO
public class CusMyPageDTO {
	private int store_uid;
	private int store_type;
	private String store_name;
	private Timestamp reservation_start;
	private Timestamp reservation_end;
	private int reservation_count;
	private int reservation_price;
	private int reservation_check;
	private String reservation_seat;
	private String review_content;
	private int review_rate;
	private int review_viewCount;
	private Timestamp review_date;
	private int review_uid;
	private String reply_content;
	private Timestamp reply_date;
	private int reply_uid;
	
	public CusMyPageDTO() {
		super();
	}

	public CusMyPageDTO(int store_uid, int store_type, String store_name, Timestamp reservation_start,
			Timestamp reservation_end, int reservation_count, int reservation_price, int reservation_check,
			String reservation_seat, String review_content, int review_rate, int review_viewCount,
			Timestamp review_date, int review_uid, String reply_content, Timestamp reply_date, int reply_uid) {
		super();
		this.store_uid = store_uid;
		this.store_type = store_type;
		this.store_name = store_name;
		this.reservation_start = reservation_start;
		this.reservation_end = reservation_end;
		this.reservation_count = reservation_count;
		this.reservation_price = reservation_price;
		this.reservation_check = reservation_check;
		this.reservation_seat = reservation_seat;
		this.review_content = review_content;
		this.review_rate = review_rate;
		this.review_viewCount = review_viewCount;
		this.review_date = review_date;
		this.review_uid = review_uid;
		this.reply_content = reply_content;
		this.reply_date = reply_date;
		this.reply_uid = reply_uid;
	}

	public int getStore_uid() {
		return store_uid;
	}

	public void setStore_uid(int store_uid) {
		this.store_uid = store_uid;
	}

	public int getStore_type() {
		return store_type;
	}

	public void setStore_type(int store_type) {
		this.store_type = store_type;
	}

	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}

	public Timestamp getReservation_start() {
		return reservation_start;
	}

	public void setReservation_start(Timestamp reservation_start) {
		this.reservation_start = reservation_start;
	}

	public Timestamp getReservation_end() {
		return reservation_end;
	}

	public void setReservation_end(Timestamp reservation_end) {
		this.reservation_end = reservation_end;
	}

	public int getReservation_count() {
		return reservation_count;
	}

	public void setReservation_count(int reservation_count) {
		this.reservation_count = reservation_count;
	}

	public int getReservation_price() {
		return reservation_price;
	}

	public void setReservation_price(int reservation_price) {
		this.reservation_price = reservation_price;
	}

	public int getReservation_check() {
		return reservation_check;
	}

	public void setReservation_check(int reservation_check) {
		this.reservation_check = reservation_check;
	}

	public String getReservation_seat() {
		return reservation_seat;
	}

	public void setReservation_seat(String reservation_seat) {
		this.reservation_seat = reservation_seat;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public int getReview_rate() {
		return review_rate;
	}

	public void setReview_rate(int review_rate) {
		this.review_rate = review_rate;
	}

	public int getReview_viewCount() {
		return review_viewCount;
	}

	public void setReview_viewCount(int review_viewCount) {
		this.review_viewCount = review_viewCount;
	}

	public Timestamp getReview_date() {
		return review_date;
	}

	public void setReview_date(Timestamp review_date) {
		this.review_date = review_date;
	}

	public int getReview_uid() {
		return review_uid;
	}

	public void setReview_uid(int review_uid) {
		this.review_uid = review_uid;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public Timestamp getReply_date() {
		return reply_date;
	}

	public void setReply_date(Timestamp reply_date) {
		this.reply_date = reply_date;
	}

	public int getReply_uid() {
		return reply_uid;
	}

	public void setReply_uid(int reply_uid) {
		this.reply_uid = reply_uid;
	}

}
