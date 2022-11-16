package qna.project.nmj.ajax.dto;

import java.util.ArrayList;

public class AjaxSpaceDTO {
	int space_uid;
	String space_name;
	int space_price;
	
	ArrayList<String> space_images;

	
	public AjaxSpaceDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AjaxSpaceDTO(int space_uid, String space_name, int space_price, ArrayList<String> space_images) {
		super();
		this.space_uid = space_uid;
		this.space_name = space_name;
		this.space_price = space_price;
		this.space_images = space_images;
	}

	public int getSpace_uid() {
		return space_uid;
	}

	public void setSpace_uid(int space_uid) {
		this.space_uid = space_uid;
	}

	public String getSpace_name() {
		return space_name;
	}

	public void setSpace_name(String space_name) {
		this.space_name = space_name;
	}

	public int getSpace_price() {
		return space_price;
	}

	public void setSpace_price(int space_price) {
		this.space_price = space_price;
	}

	public ArrayList<String> getSpace_images() {
		return space_images;
	}

	public void setSpace_images(ArrayList<String> space_images) {
		this.space_images = space_images;
	}
	
	
}
