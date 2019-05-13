package shopfoods.model;

public class Order {
	private int id,id_cus,quantity,check_dh;
	private String product_name,product_price,picture,time_order;
	public Order(int id, int id_cus, int quantity, int check_dh, String product_name, String product_price,
			String picture, String time_order) {
		super();
		this.id = id;
		this.id_cus = id_cus;
		this.quantity = quantity;
		this.check_dh = check_dh;
		this.product_name = product_name;
		this.product_price = product_price;
		this.picture = picture;
		this.time_order = time_order;
	}
	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getId_cus() {
		return id_cus;
	}
	public void setId_cus(int id_cus) {
		this.id_cus = id_cus;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getCheck_dh() {
		return check_dh;
	}
	public void setCheck_dh(int check_dh) {
		this.check_dh = check_dh;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_price() {
		return product_price;
	}
	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getTime_order() {
		return time_order;
	}
	public void setTime_order(String time_order) {
		this.time_order = time_order;
	}
	
}
