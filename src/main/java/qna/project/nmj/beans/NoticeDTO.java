package qna.project.nmj.beans;

public class NoticeDTO {
	private int notice_uid;
    private String notice_subject;
    private String notice_content;
    private String notice_regDate;
    private String notice_endDate;
    private String notice_startDate;
    private int notice_type;
    private int notice_viewCount;
    
	public NoticeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NoticeDTO(int notice_uid, String notice_subject, String notice_content, String notice_regDate,
			String notice_endDate, String notice_startDate, int notice_type, int notice_viewCount) {
		super();
		this.notice_uid = notice_uid;
		this.notice_subject = notice_subject;
		this.notice_content = notice_content;
		this.notice_regDate = notice_regDate;
		this.notice_endDate = notice_endDate;
		this.notice_startDate = notice_startDate;
		this.notice_type = notice_type;
		this.notice_viewCount = notice_viewCount;
	}
	public int getNotice_uid() {
		return notice_uid;
	}
	public void setNotice_uid(int notice_uid) {
		this.notice_uid = notice_uid;
	}
	public String getNotice_subject() {
		return notice_subject;
	}
	public void setNotice_subject(String notice_subject) {
		this.notice_subject = notice_subject;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_regDate() {
		return notice_regDate;
	}
	public void setNotice_regDate(String notice_regDate) {
		this.notice_regDate = notice_regDate;
	}
	public String getNotice_endDate() {
		return notice_endDate;
	}
	public void setNotice_endDate(String notice_endDate) {
		this.notice_endDate = notice_endDate;
	}
	public String getNotice_startDate() {
		return notice_startDate;
	}
	public void setNotice_startDate(String notice_startDate) {
		this.notice_startDate = notice_startDate;
	}
	public int getNotice_type() {
		return notice_type;
	}
	public void setNotice_type(int notice_type) {
		this.notice_type = notice_type;
	}
	public int getNotice_viewCount() {
		return notice_viewCount;
	}
	public void setNotice_viewCount(int notice_viewCount) {
		this.notice_viewCount = notice_viewCount;
	}
    
}
