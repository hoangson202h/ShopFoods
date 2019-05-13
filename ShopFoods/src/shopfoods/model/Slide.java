package shopfoods.model;

public class Slide {
	private int s_id;
	private String s_picture;
	public Slide(int s_id, String s_picture) {
		super();
		this.s_id = s_id;
		this.s_picture = s_picture;
	}
	public Slide() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	public String getS_picture() {
		return s_picture;
	}
	public void setS_picture(String s_picture) {
		this.s_picture = s_picture;
	}
	
}
