package qna.project.nmj.beans;

public class LikeDTO {

	private int like_uid;
	private int mb_uid;
	private int store_uid;
	public LikeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LikeDTO(int like_uid, int mb_uid, int store_uid) {
		super();
		this.like_uid = like_uid;
		this.mb_uid = mb_uid;
		this.store_uid = store_uid;
	}
	public int getLike_uid() {
		return like_uid;
	}
	public void setLike_uid(int like_uid) {
		this.like_uid = like_uid;
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
	
	
}
