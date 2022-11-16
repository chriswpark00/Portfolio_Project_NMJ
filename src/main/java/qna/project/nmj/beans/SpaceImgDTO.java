package qna.project.nmj.beans;

public class SpaceImgDTO {
	private int space_img_uid;
	private int space_uid;
	private String space_img_org;
	private String space_img_sav;
	public SpaceImgDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SpaceImgDTO(int space_img_uid, int space_uid, String space_img_org, String space_img_sav) {
		super();
		this.space_img_uid = space_img_uid;
		this.space_uid = space_uid;
		this.space_img_org = space_img_org;
		this.space_img_sav = space_img_sav;
	}
	public int getSpace_img_uid() {
		return space_img_uid;
	}
	public void setSpace_img_uid(int space_img_uid) {
		this.space_img_uid = space_img_uid;
	}
	public int getSpace_uid() {
		return space_uid;
	}
	public void setSpace_uid(int space_uid) {
		this.space_uid = space_uid;
	}
	public String getSpace_img_org() {
		return space_img_org;
	}
	public void setSpace_img_org(String space_img_org) {
		this.space_img_org = space_img_org;
	}
	public String getSpace_img_sav() {
		return space_img_sav;
	}
	public void setSpace_img_sav(String space_img_sav) {
		this.space_img_sav = space_img_sav;
	}
	
	
}
