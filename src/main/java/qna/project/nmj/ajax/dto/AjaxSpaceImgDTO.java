package qna.project.nmj.ajax.dto;

import java.util.ArrayList;

import qna.project.nmj.beans.SpaceImgDTO;

public class AjaxSpaceImgDTO {
	int count;
	String status;
	ArrayList<SpaceImgDTO> list;
	public AjaxSpaceImgDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AjaxSpaceImgDTO(int count, String status, ArrayList<SpaceImgDTO> list) {
		super();
		this.count = count;
		this.status = status;
		this.list = list;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public ArrayList<SpaceImgDTO> getList() {
		return list;
	}
	public void setList(ArrayList<SpaceImgDTO> list) {
		this.list = list;
	}
	

}
