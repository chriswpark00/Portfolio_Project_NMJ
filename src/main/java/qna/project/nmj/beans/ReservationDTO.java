package qna.project.nmj.beans;

public class ReservationDTO {
	private int reservation_uid;
	private String reservation_start;
	private String reservation_end;
	private int mb_uid;
	private String space_uid;
	private int reservation_check;
	private String reservation_date;
	private int reservation_count;
	private String reservation_seat;
	private int reservation_price;
	private int store_uid;
	public ReservationDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReservationDTO(int reservation_uid, String reservation_start, String reservation_end, int mb_uid,
			String space_uid, int reservation_check, String reservation_date, int reservation_count,
			String reservation_seat, int reservation_price, int store_uid) {
		super();
		this.reservation_uid = reservation_uid;
		this.reservation_start = reservation_start;
		this.reservation_end = reservation_end;
		this.mb_uid = mb_uid;
		this.space_uid = space_uid;
		this.reservation_check = reservation_check;
		this.reservation_date = reservation_date;
		this.reservation_count = reservation_count;
		this.reservation_seat = reservation_seat;
		this.reservation_price = reservation_price;
		this.store_uid = store_uid;
	}
	public int getReservation_uid() {
		return reservation_uid;
	}
	public void setReservation_uid(int reservation_uid) {
		this.reservation_uid = reservation_uid;
	}
	public String getReservation_start() {
		return reservation_start;
	}
	public void setReservation_start(String reservation_start) {
		this.reservation_start = reservation_start;
	}
	public String getReservation_end() {
		return reservation_end;
	}
	public void setReservation_end(String reservation_end) {
		this.reservation_end = reservation_end;
	}
	public int getMb_uid() {
		return mb_uid;
	}
	public void setMb_uid(int mb_uid) {
		this.mb_uid = mb_uid;
	}
	public String getSpace_uid() {
		return space_uid;
	}
	public void setSpace_uid(String space_uid) {
		this.space_uid = space_uid;
	}
	public int getReservation_check() {
		return reservation_check;
	}
	public void setReservation_check(int reservation_check) {
		this.reservation_check = reservation_check;
	}
	public String getReservation_date() {
		return reservation_date;
	}
	public void setReservation_date(String reservation_date) {
		this.reservation_date = reservation_date;
	}
	public int getReservation_count() {
		return reservation_count;
	}
	public void setReservation_count(int reservation_count) {
		this.reservation_count = reservation_count;
	}
	public String getReservation_seat() {
		return reservation_seat;
	}
	public void setReservation_seat(String reservation_seat) {
		this.reservation_seat = reservation_seat;
	}
	public int getReservation_price() {
		return reservation_price;
	}
	public void setReservation_price(int reservation_price) {
		this.reservation_price = reservation_price;
	}
	public int getStore_uid() {
		return store_uid;
	}
	public void setStore_uid(int store_uid) {
		this.store_uid = store_uid;
	}
	
}	
