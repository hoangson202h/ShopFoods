package shopfoods.model;

public class Customer {
	private int id_cus,id_user,check_st,county;
	private String name,email,address,phone,message,status;
	public Customer(int id_cus, int id_user, int check_st, int county, String name, String email, String address,
			String phone, String message, String status) {
		super();
		this.id_cus = id_cus;
		this.id_user = id_user;
		this.check_st = check_st;
		this.county = county;
		this.name = name;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.message = message;
		this.status = status;
	}
	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId_cus() {
		return id_cus;
	}
	public void setId_cus(int id_cus) {
		this.id_cus = id_cus;
	}
	public int getId_user() {
		return id_user;
	}
	public void setId_user(int id_user) {
		this.id_user = id_user;
	}
	public int getCheck_st() {
		return check_st;
	}
	public void setCheck_st(int check_st) {
		this.check_st = check_st;
	}
	public int getCounty() {
		return county;
	}
	public void setCounty(int county) {
		this.county = county;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
