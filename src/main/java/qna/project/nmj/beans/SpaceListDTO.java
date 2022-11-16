package qna.project.nmj.beans;

public class SpaceListDTO {
	private int spaceList_uid;
	private String space_type;
	public SpaceListDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SpaceListDTO(int spaceList_uid, String space_type) {
		super();
		this.spaceList_uid = spaceList_uid;
		this.space_type = space_type;
	}
	public int getSpaceList_uid() {
		return spaceList_uid;
	}
	public void setSpaceList_uid(int spaceList_uid) {
		this.spaceList_uid = spaceList_uid;
	}
	public String getSpace_type() {
		return space_type;
	}
	public void setSpace_type(String space_type) {
		this.space_type = space_type;
	}
	
	
}
