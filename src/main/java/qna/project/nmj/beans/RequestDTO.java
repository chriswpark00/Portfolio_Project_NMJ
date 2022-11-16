package qna.project.nmj.beans;

public class RequestDTO {
	private int request_uid;
	private int request_type;
	private String request_content;
	private int request_check;
	public RequestDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RequestDTO(int request_uid, int request_type, String request_content, int request_check) {
		super();
		this.request_uid = request_uid;
		this.request_type = request_type;
		this.request_content = request_content;
		this.request_check = request_check;
	}
	public int getRequest_uid() {
		return request_uid;
	}
	public void setRequest_uid(int request_uid) {
		this.request_uid = request_uid;
	}
	public int getRequest_type() {
		return request_type;
	}
	public void setRequest_type(int request_type) {
		this.request_type = request_type;
	}
	public String getRequest_content() {
		return request_content;
	}
	public void setRequest_content(String request_content) {
		this.request_content = request_content;
	}
	public int getRequest_check() {
		return request_check;
	}
	public void setRequest_check(int request_check) {
		this.request_check = request_check;
	}
	
	
}
