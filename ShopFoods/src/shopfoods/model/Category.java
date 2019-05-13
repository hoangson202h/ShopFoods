package shopfoods.model;

public class Category {
	private int id_cat;
	private String category_name;
	public Category(int id_cat, String category_name) {
		super();
		this.id_cat = id_cat;
		this.category_name = category_name;
	}
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId_cat() {
		return id_cat;
	}
	public void setId_cat(int id_cat) {
		this.id_cat = id_cat;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	
}
