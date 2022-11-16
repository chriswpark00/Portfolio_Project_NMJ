package qna.project.nmj.ajax.dto;

import java.util.ArrayList;


public class AjaxStoreTypesDTO {
	int count;
	String status;
	ArrayList<AjaxStoreTypeDTO> store_types;
	
	public AjaxStoreTypesDTO() {
	}

	public AjaxStoreTypesDTO(ArrayList<AjaxStoreTypeDTO> store_types, int count, String status) {
		super();
		this.store_types = store_types;
		this.count = count;
		this.status = status;
	}

	public ArrayList<AjaxStoreTypeDTO> getStore_types() {
		return store_types;
	}

	public void setStore_types(ArrayList<AjaxStoreTypeDTO> store_types) {
		this.store_types = store_types;
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
	
	
}
