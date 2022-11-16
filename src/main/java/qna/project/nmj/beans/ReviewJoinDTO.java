package qna.project.nmj.beans;

public class ReviewJoinDTO {
	private int review_uid;
	private int mb_uid;
	private int store_uid;
	private int review_rate;
	private String review_content;
	private int review_ban;
	private int review_viewCount;
	private String review_date;
	private int store_type;
	private String store_name;
	private String mb_id;
	
	public ReviewJoinDTO(int review_uid, int mb_uid, int store_uid, int review_rate, String review_content,
			int review_ban, int review_viewCount, String review_date, int store_type, String store_name, String mb_id) {
		super();
		this.review_uid = review_uid;
		this.mb_uid = mb_uid;
		this.store_uid = store_uid;
		this.review_rate = review_rate;
		this.review_content = review_content;
		this.review_ban = review_ban;
		this.review_viewCount = review_viewCount;
		this.review_date = review_date;
		this.store_type = store_type;
		this.store_name = store_name;
		this.mb_id = mb_id;
	}
	public int getReview_viewCount() {
		return review_viewCount;
	}
	public void setReview_viewCount(int review_viewCount) {
		this.review_viewCount = review_viewCount;
	}
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
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
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public ReviewJoinDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getReview_uid() {
		return review_uid;
	}
	public void setReview_uid(int review_uid) {
		this.review_uid = review_uid;
	}
	public int getMb_uid() {
		return mb_uid;
	}
	public void setMb_uid(int mb_uid) {
		this.mb_uid = mb_uid;
	}
	public int getStore_uid() {
		return store_uid;
	}
	public void setStore_uid(int store_uid) {
		this.store_uid = store_uid;
	}
	public int getReview_rate() {
		return review_rate;
	}
	public void setReview_rate(int review_rate) {
		this.review_rate = review_rate;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public int getReview_ban() {
		return review_ban;
	}
	public void setReview_ban(int review_ban) {
		this.review_ban = review_ban;
	}
	
	
}
