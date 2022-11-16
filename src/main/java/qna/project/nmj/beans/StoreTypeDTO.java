package qna.project.nmj.beans;

public class StoreTypeDTO {
	private int store_dtype;
	private int store_type;
	private String store_dname;
	public StoreTypeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StoreTypeDTO(int store_dtype, int store_type, String store_dname) {
		super();
		this.store_dtype = store_dtype;
		this.store_type = store_type;
		this.store_dname = store_dname;
	}
	public int getStore_dtype() {
		return store_dtype;
	}
	public void setStore_dtype(int store_dtype) {
		this.store_dtype = store_dtype;
	}
	public int getStore_type() {
		return store_type;
	}
	public void setStore_type(int store_type) {
		this.store_type = store_type;
	}
	public String getStore_dname() {
		return store_dname;
	}
	public void setStore_dname(String store_dname) {
		this.store_dname = store_dname;
	}
	
	
}
