package qna.project.nmj.beans;

public class ReplyDTO {
	private int reply_uid;
	private int review_uid;
	private int reply_level;
	private int reply_parent_uid;
	private String reply_content;
	private int reply_ban;
	private int mb_uid;
	public ReplyDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReplyDTO(int reply_uid, int review_uid, int reply_level, int reply_parent_uid, String reply_content,
			int reply_ban, int mb_uid) {
		super();
		this.reply_uid = reply_uid;
		this.review_uid = review_uid;
		this.reply_level = reply_level;
		this.reply_parent_uid = reply_parent_uid;
		this.reply_content = reply_content;
		this.reply_ban = reply_ban;
		this.mb_uid = mb_uid;
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
	
	
}
