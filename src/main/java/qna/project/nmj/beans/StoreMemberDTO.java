package qna.project.nmj.beans;

public class StoreMemberDTO {
	private int mb_uid;
	private String mb_id;
	private String mb_pw;
	private String mb_name;
	private String store_name;
	private String mb_img_org;
	private String mb_img_sav;
	private String mb_tel;
	private String mb_email;
	private String mb_regDate;
	private int mb_type;
	private int store_uid;
	private String store_address;
	private String store_tel;
	private String store_hours;
	private String store_content;
	private String store_img_org;
	private String store_img_sav;
	private String store_regNum;
	private String store_regImg_org;
	private String store_regImg_sav;
	private double store_lat;
	private double store_long;
	private int store_type;
	private int store_dtype;
	private String store_regDate;
	private int store_ratings;
	private int store_rateCount;
	
	public StoreMemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StoreMemberDTO(int mb_uid, String mb_id, String mb_pw, String mb_name, String store_name, String mb_img_org,
			String mb_img_sav, String mb_tel, String mb_email, String mb_regDate, int mb_type, int store_uid,
			String store_address, String store_tel, String store_hours, String store_content, String store_img_org,
			String store_img_sav, String store_regNum, String store_regImg_org, String store_regImg_sav,
			double store_lat, double store_long, int store_type, int store_dtype, String store_regDate,
			int store_ratings, int store_rateCount) {
		super();
		this.mb_uid = mb_uid;
		this.mb_id = mb_id;
		this.mb_pw = mb_pw;
		this.mb_name = mb_name;
		this.store_name = store_name;
		this.mb_img_org = mb_img_org;
		this.mb_img_sav = mb_img_sav;
		this.mb_tel = mb_tel;
		this.mb_email = mb_email;
		this.mb_regDate = mb_regDate;
		this.mb_type = mb_type;
		this.store_uid = store_uid;
		this.store_address = store_address;
		this.store_tel = store_tel;
		this.store_hours = store_hours;
		this.store_content = store_content;
		this.store_img_org = store_img_org;
		this.store_img_sav = store_img_sav;
		this.store_regNum = store_regNum;
		this.store_regImg_org = store_regImg_org;
		this.store_regImg_sav = store_regImg_sav;
		this.store_lat = store_lat;
		this.store_long = store_long;
		this.store_type = store_type;
		this.store_dtype = store_dtype;
		this.store_regDate = store_regDate;
		this.store_ratings = store_ratings;
		this.store_rateCount = store_rateCount;
	}
	public int getMb_uid() {
		return mb_uid;
	}
	public void setMb_uid(int mb_uid) {
		this.mb_uid = mb_uid;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public String getMb_pw() {
		return mb_pw;
	}
	public void setMb_pw(String mb_pw) {
		this.mb_pw = mb_pw;
	}
	public String getMb_name() {
		return mb_name;
	}
	public void setMb_name(String mb_name) {
		this.mb_name = mb_name;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public String getMb_img_org() {
		return mb_img_org;
	}
	public void setMb_img_org(String mb_img_org) {
		this.mb_img_org = mb_img_org;
	}
	public String getMb_img_sav() {
		return mb_img_sav;
	}
	public void setMb_img_sav(String mb_img_sav) {
		this.mb_img_sav = mb_img_sav;
	}
	public String getMb_tel() {
		return mb_tel;
	}
	public void setMb_tel(String mb_tel) {
		this.mb_tel = mb_tel;
	}
	public String getMb_email() {
		return mb_email;
	}
	public void setMb_email(String mb_email) {
		this.mb_email = mb_email;
	}
	public String getMb_regDate() {
		return mb_regDate;
	}
	public void setMb_regDate(String mb_regDate) {
		this.mb_regDate = mb_regDate;
	}
	public int getMb_type() {
		return mb_type;
	}
	public void setMb_type(int mb_type) {
		this.mb_type = mb_type;
	}
	public int getStore_uid() {
		return store_uid;
	}
	public void setStore_uid(int store_uid) {
		this.store_uid = store_uid;
	}
	public String getStore_address() {
		return store_address;
	}
	public void setStore_address(String store_address) {
		this.store_address = store_address;
	}
	public String getStore_tel() {
		return store_tel;
	}
	public void setStore_tel(String store_tel) {
		this.store_tel = store_tel;
	}
	public String getStore_hours() {
		return store_hours;
	}
	public void setStore_hours(String store_hours) {
		this.store_hours = store_hours;
	}
	public String getStore_content() {
		return store_content;
	}
	public void setStore_content(String store_content) {
		this.store_content = store_content;
	}
	public String getStore_img_org() {
		return store_img_org;
	}
	public void setStore_img_org(String store_img_org) {
		this.store_img_org = store_img_org;
	}
	public String getStore_img_sav() {
		return store_img_sav;
	}
	public void setStore_img_sav(String store_img_sav) {
		this.store_img_sav = store_img_sav;
	}
	public String getStore_regNum() {
		return store_regNum;
	}
	public void setStore_regNum(String store_regNum) {
		this.store_regNum = store_regNum;
	}
	public String getStore_regImg_org() {
		return store_regImg_org;
	}
	public void setStore_regImg_org(String store_regImg_org) {
		this.store_regImg_org = store_regImg_org;
	}
	public String getStore_regImg_sav() {
		return store_regImg_sav;
	}
	public void setStore_regImg_sav(String store_regImg_sav) {
		this.store_regImg_sav = store_regImg_sav;
	}
	public double getStore_lat() {
		return store_lat;
	}
	public void setStore_lat(double store_lat) {
		this.store_lat = store_lat;
	}
	public double getStore_long() {
		return store_long;
	}
	public void setStore_long(double store_long) {
		this.store_long = store_long;
	}
	public int getStore_type() {
		return store_type;
	}
	public void setStore_type(int store_type) {
		this.store_type = store_type;
	}
	public int getStore_dtype() {
		return store_dtype;
	}
	public void setStore_dtype(int store_dtype) {
		this.store_dtype = store_dtype;
	}
	public String getStore_regDate() {
		return store_regDate;
	}
	public void setStore_regDate(String store_regDate) {
		this.store_regDate = store_regDate;
	}
	public int getStore_ratings() {
		return store_ratings;
	}
	public void setStore_ratings(int store_ratings) {
		this.store_ratings = store_ratings;
	}
	public int getStore_rateCount() {
		return store_rateCount;
	}
	public void setStore_rateCount(int store_rateCount) {
		this.store_rateCount = store_rateCount;
	}
	
	
}
