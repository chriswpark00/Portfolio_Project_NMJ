package qna.project.nmj.beans;

public class ReplyJoinDTO {
	private int reply_uid;
	private int review_uid;
	private int reply_level;
	private int reply_parent_uid;
	private String reply_content;
	private String review_content;
	private int reply_ban;
	private int mb_uid;
	private String mb_id;
	private String reply_date;
	
	public ReplyJoinDTO(int reply_uid, int review_uid, int reply_level, int reply_parent_uid, String reply_content,
			String review_content, int reply_ban, int mb_uid, String mb_id, String reply_date) {
		super();
		this.reply_uid = reply_uid;
		this.review_uid = review_uid;
		this.reply_level = reply_level;
		this.reply_parent_uid = reply_parent_uid;
		this.reply_content = reply_content;
		this.review_content = review_content;
		this.reply_ban = reply_ban;
		this.mb_uid = mb_uid;
		this.mb_id = mb_id;
		this.reply_date = reply_date;
	}
	public String getReply_date() {
		return reply_date;
	}
	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}
	public ReplyJoinDTO(int reply_uid, int review_uid, int reply_level, int reply_parent_uid, String reply_content,
			String review_content, int reply_ban, int mb_uid, String mb_id) {
		super();
		this.reply_uid = reply_uid;
		this.review_uid = review_uid;
		this.reply_level = reply_level;
		this.reply_parent_uid = reply_parent_uid;
		this.reply_content = reply_content;
		this.review_content = review_content;
		this.reply_ban = reply_ban;
		this.mb_uid = mb_uid;
		this.mb_id = mb_id;
	}
	public ReplyJoinDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getReply_uid() {
		return reply_uid;
	}
	public void setReply_uid(int reply_uid) {
		this.reply_uid = reply_uid;
	}
	public int getReview_uid() {
		return review_uid;
	}
	public void setReview_uid(int review_uid) {
		this.review_uid = review_uid;
	}
	public int getReply_level() {
		return reply_level;
	}
	public void setReply_level(int reply_level) {
		this.reply_level = reply_level;
	}
	public int getReply_parent_uid() {
		return reply_parent_uid;
	}
	public void setReply_parent_uid(int reply_parent_uid) {
		this.reply_parent_uid = reply_parent_uid;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public int getReply_ban() {
		return reply_ban;
	}
	public void setReply_ban(int reply_ban) {
		this.reply_ban = reply_ban;
	}
	public int getMb_uid() {
		return mb_uid;
	}
	public void setMb_uid(int mb_uid) {
		this.mb_uid = mb_uid;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	
	
}
