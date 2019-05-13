package shopfoods.model;

public class Food {
	private int stt,id_category,status,check_food,count,check,id_cat,quantity,size,price;
	private String product_code,name,previews,detail,image,category_name;
	public Food(int stt, int id_category, int status, int check_food, int count, int check, int id_cat, int quantity,
			int size, int price, String product_code, String name, String previews, String detail, String image,
			String category_name) {
		super();
		this.stt = stt;
		this.id_category = id_category;
		this.status = status;
		this.check_food = check_food;
		this.count = count;
		this.check = check;
		this.id_cat = id_cat;
		this.quantity = quantity;
		this.size = size;
		this.price = price;
		this.product_code = product_code;
		this.name = name;
		this.previews = previews;
		this.detail = detail;
		this.image = image;
		this.category_name = category_name;
	}
	public Food() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getStt() {
		return stt;
	}
	public void setStt(int stt) {
		this.stt = stt;
	}
	public int getId_category() {
		return id_category;
	}
	public void setId_category(int id_category) {
		this.id_category = id_category;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getCheck_food() {
		return check_food;
	}
	public void setCheck_food(int check_food) {
		this.check_food = check_food;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getCheck() {
		return check;
	}
	public void setCheck(int check) {
		this.check = check;
	}
	public int getId_cat() {
		return id_cat;
	}
	public void setId_cat(int id_cat) {
		this.id_cat = id_cat;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getProduct_code() {
		return product_code;
	}
	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPreviews() {
		return previews;
	}
	public void setPreviews(String previews) {
		this.previews = previews;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	
}