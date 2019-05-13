package shopfoods.model;

public class Comment {
	private int id_comment;
	private String name,message,date_comment,avatar;
	public Comment(int id_comment, String name, String message, String date_comment, String avatar) {
		super();
		this.id_comment = id_comment;
		this.name = name;
		this.message = message;
		this.date_comment = date_comment;
		this.avatar = avatar;
	}
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId_comment() {
		return id_comment;
	}
	public void setId_comment(int id_comment) {
		this.id_comment = id_comment;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getDate_comment() {
		return date_comment;
	}
	public void setDate_comment(String date_comment) {
		this.date_comment = date_comment;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	
}
