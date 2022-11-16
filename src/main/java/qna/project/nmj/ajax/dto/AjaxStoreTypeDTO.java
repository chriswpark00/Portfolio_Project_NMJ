package qna.project.nmj.ajax.dto;

import java.util.ArrayList;

public class AjaxStoreTypeDTO {
	int store_type;
	ArrayList<AjaxStoreDTypeDTO> store_dtypes;
	public AjaxStoreTypeDTO(int store_type, ArrayList<AjaxStoreDTypeDTO> store_dtypes) {
		super();
		this.store_type = store_type;
		this.store_dtypes = store_dtypes;
	}
	public AjaxStoreTypeDTO(){
		
	}
	public int getStore_type() {
		return store_type;
	}
	public void setStore_type(int store_type) {
		this.store_type = store_type;
	}
	public ArrayList<AjaxStoreDTypeDTO> getStore_dtypes() {
		return store_dtypes;
	}
	public void setStore_dtypes(ArrayList<AjaxStoreDTypeDTO> store_dtypes) {
		this.store_dtypes = store_dtypes;
	}
	
	
	
}
