package qna.project.nmj.ajax.dto;

import java.util.ArrayList;

import qna.project.nmj.beans.FindStoreDTO;

public class AjaxStoreFindDTO {
	int count;
	String status;
	ArrayList<FindStoreDTO> list;
	
	public AjaxStoreFindDTO() {
		super();
	}

	public AjaxStoreFindDTO(int count, String status, ArrayList<FindStoreDTO> list) {
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

	public ArrayList<FindStoreDTO> getList() {
		return list;
	}

	public void setList(ArrayList<FindStoreDTO> list) {
		this.list = list;
	}
	

	
	
}
