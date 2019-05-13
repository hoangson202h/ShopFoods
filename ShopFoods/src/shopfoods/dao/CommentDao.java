package shopfoods.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import shopfoods.model.Comment;
import shopfoods.model.Contact;

@Repository
public class CommentDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<Comment> getListCM() {
		String sql = "SELECT * FROM comment";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Comment>(Comment.class));
	}

	public int delComment(int id_comment) {
		String sql = "DELETE FROM comment WHERE id_comment = ?";
		return jdbcTemplate.update(sql, new Object[] { id_comment });
	}

	public int addCommentLG(Comment comment) {
		String sql = "INSERT INTO comment(name,message,date_comment,avatar) VALUES (?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[] { comment.getName(), comment.getMessage(),
				comment.getDate_comment(), comment.getAvatar() });
	}

	public int addComment(Comment comment) {
		String sql = "INSERT INTO comment(name,message,date_comment,avatar) VALUES (?,?,?,'')";
		return jdbcTemplate.update(sql, new Object[] { comment.getName(), comment.getMessage(),
				comment.getDate_comment()});
	}

	public int addContact(Contact contact) {
		String sql = "INSERT INTO contact(name,message,address,phone,email) VALUES (?,?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[] {contact.getName(),contact.getMessage(),contact.getAddress(),contact.getPhone(),contact.getEmail()});
	}
}
