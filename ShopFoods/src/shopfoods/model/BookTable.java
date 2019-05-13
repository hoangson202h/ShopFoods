package shopfoods.model;

public class BookTable {
	private int id,number,check_tb;
	private String fname,lname,date,time,phone,message;
	public BookTable(int id, int number, int check_tb, String fname, String lname, String date, String time,
			String phone, String message) {
		super();
		this.id = id;
		this.number = number;
		this.check_tb = check_tb;
		this.fname = fname;
		this.lname = lname;
		this.date = date;
		this.time = time;
		this.phone = phone;
		this.message = message;
	}
	public BookTable() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public int getCheck_tb() {
		return check_tb;
	}
	public void setCheck_tb(int check_tb) {
		this.check_tb = check_tb;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
}
