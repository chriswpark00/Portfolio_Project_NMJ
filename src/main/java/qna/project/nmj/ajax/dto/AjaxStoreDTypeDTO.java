package qna.project.nmj.ajax.dto;

import java.util.ArrayList;

import qna.project.nmj.beans.StoreDTO;

public class AjaxStoreDTypeDTO {
	int store_dtype;
	String store_dname;
	ArrayList<StoreDTO> stores;
	public AjaxStoreDTypeDTO() {
		// TODO Auto-generated constructor stub
	}
	public AjaxStoreDTypeDTO(int store_dtype, String store_dname) {
		super();
		this.store_dtype = store_dtype;
		this.store_dname = store_dname;
	}
	public int getStore_dtype() {
		return store_dtype;
	}
	public void setStore_dtype(int store_dtype) {
		this.store_dtype = store_dtype;
	}
	public String getStore_dname() {
		return store_dname;
	}
	public void setStore_dname(String store_dname) {
		this.store_dname = store_dname;
	}
	public ArrayList<StoreDTO> getStores() {
		return stores;
	}
	public void setStores(ArrayList<StoreDTO> stores) {
		this.stores = stores;
	}
	
}
