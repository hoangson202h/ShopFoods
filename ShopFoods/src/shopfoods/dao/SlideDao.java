package shopfoods.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import shopfoods.model.Slide;

@Repository
public class SlideDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<Slide> getSlide() {
		String sql = "SELECT * FROM slide";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Slide>(Slide.class));
	}

	public int addItem(Slide slide) {
		String sql = "INSERT INTO slide(s_picture) VALUES (?)";
		return jdbcTemplate.update(sql, new Object[] {slide.getS_picture()});
	}

	public Slide getItem(int s_id) {
		String sql = "SELECT * FROM slide WHERE s_id = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] {s_id},new BeanPropertyRowMapper<Slide>(Slide.class));
	}

	public int editItem(Slide slide) {
		String sql = "UPDATE slide SET s_picture = ? WHERE s_id = ?";
		return jdbcTemplate.update(sql, new Object[] {slide.getS_picture(),slide.getS_id()});
	}

	public int delItem(int s_id) {
		String sql = "DELETE FROM slide WHERE s_id = ?";
		return jdbcTemplate.update(sql, new Object[] {s_id});
	}

	public List<Slide> getListSlide() {
		String sql = "SELECT * FROM slide ORDER BY RAND() LIMIT 4";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Slide>(Slide.class));
	}

	public Slide getPicture() {
		String sql = "SELECT * FROM slide ORDER BY RAND() LIMIT 1";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<Slide>(Slide.class));
	}

}
