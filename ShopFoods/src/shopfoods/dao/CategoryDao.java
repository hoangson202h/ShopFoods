package shopfoods.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import shopfoods.constant.Defines;
import shopfoods.model.Category;
import shopfoods.model.Food;

@Repository
public class CategoryDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	public List<Category> getCats() {
		String sql = "SELECT * FROM categories WHERE check_cat = 1";
		return jdbcTemplate.query(sql,new BeanPropertyRowMapper<Category>(Category.class));
	}
	public List<Category> getCats(int offset) {
		String sql = "SELECT * FROM categories WHERE check_cat = 1 LIMIT ?,?";
		return jdbcTemplate.query(sql,new Object[] {offset,Defines.ROW_COUNT_ADMIN},new BeanPropertyRowMapper<Category>(Category.class));
	}
	public int addCat(Category cat) {
		String sql = "INSERT INTO categories(category_name,check_cat) VALUES (?,1)";
		return jdbcTemplate.update(sql,new Object[] {cat.getCategory_name()});
	}
	public Category getCat(int id_cat) {
		String sql = "SELECT * FROM categories WHERE id_cat = ? ";
		return jdbcTemplate.queryForObject(sql, new Object[] {id_cat},new BeanPropertyRowMapper<Category>(Category.class));
	}
	public int editCat(Category cat) {
		String sql = "UPDATE categories SET category_name = ? WHERE id_cat = ?";
		return jdbcTemplate.update(sql,new Object[] {cat.getCategory_name(),cat.getId_cat()});
	}
	public int updateCat(int id_cat) {
		String sql = "UPDATE categories SET check_cat = 0 WHERE id_cat = ?";
		return jdbcTemplate.update(sql,new Object[] {id_cat});
	}
	public List<Category> getListCats(String name) {
		String reName = "%" + name + "%";
		String sql = "SELECT * FROM categories WHERE category_name LIKE ? AND check_cat = 1 ";
		return jdbcTemplate.query(sql, new Object[] {reName},new BeanPropertyRowMapper<Category>(Category.class));
	}
	public List<Category> getCatsGR() {
		String sql = "SELECT * FROM categories WHERE check_cat = 0";
		return jdbcTemplate.query(sql,new BeanPropertyRowMapper<Category>(Category.class));
	}
	public int restoreCat(int id_cat) {
		String sql = "UPDATE categories SET check_cat = 1 WHERE id_cat = ?";
		return jdbcTemplate.update(sql,new Object[] {id_cat});
	}
	public int deleteCat(int id_cat) {
		String sql = "DELETE FROM categories WHERE id_cat = ?";
		return jdbcTemplate.update(sql, new Object[] {id_cat});
	}
	public List<Category> getListCatsGR(String name) {
		String reName = "%" + name + "%";
		String sql = "SELECT * FROM categories WHERE category_name LIKE ? AND check_cat = 0 ";
		return jdbcTemplate.query(sql, new Object[] {reName},new BeanPropertyRowMapper<Category>(Category.class));
	}
	public int getCount() {
		String sql = "SELECT COUNT(*) FROM categories WHERE check_cat = 1";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
}
