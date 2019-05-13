package shopfoods.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import shopfoods.constant.Defines;
import shopfoods.model.Food;
import shopfoods.model.Slide;

@Repository
public class NewsDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<Food> getNews(int offset) {
		String sql = "SELECT f.*,c.* FROM foods AS f INNER JOIN categories AS c ON f.id_category = c.id_cat WHERE check_food = 1 ORDER BY stt DESC LIMIT ?,?";
		return jdbcTemplate.query(sql, new Object[] { offset, Defines.ROW_COUNT_ADMIN },
				new BeanPropertyRowMapper<Food>(Food.class));
	}

	public int addNews(Food food) {
		String sql = "INSERT INTO foods(product_code,name,id_category,price,previews,detail,image,status,check_food) VALUES(?,?,?,?,?,?,?,?,1)";
		return jdbcTemplate.update(sql, new Object[] { food.getProduct_code(), food.getName(), food.getId_cat(),
				food.getPrice(), food.getPreviews(), food.getDetail(), food.getImage(), 1 });
	}

	public List<String> getListProduct_code() {
		String sql = "SELECT foods.product_code FROM foods";
		return jdbcTemplate.queryForList(sql, String.class);
	}

	public Food getFood(String product_code) {
		String sql = "SELECT * FROM foods WHERE product_code LIKE ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { product_code },
				new BeanPropertyRowMapper<Food>(Food.class));
	}

	public int editNews(Food food) {
		String sql = "UPDATE foods SET name = ?,id_category = ?,price = ?,previews = ?,detail = ?,image = ?,status = ? WHERE product_code = ? ";
		return jdbcTemplate.update(sql, new Object[] { food.getName(), food.getId_category(), food.getPrice(),
				food.getPreviews(), food.getDetail(), food.getImage(), food.getStatus(), food.getProduct_code() });
	}

	public int delNews(String product_code) {
		String sql = "DELETE FROM foods WHERE product_code = ?";
		return jdbcTemplate.update(sql, new Object[] { product_code });
	}

	public List<Food> getListNews(int id_cat, String name) {
		String reName = "%" + name + "%";
		String sql = "SELECT f.*,c.* FROM foods AS f INNER JOIN categories AS c ON f.id_category = c.id_cat WHERE name LIKE ? AND id_cat = ? ORDER BY stt DESC";
		return jdbcTemplate.query(sql, new Object[] { reName, id_cat }, new BeanPropertyRowMapper<Food>(Food.class));
	}

	public List<Food> getListNews(String name) {
		String reName = "%" + name + "%";
		String sql = "SELECT f.*,c.* FROM foods AS f INNER JOIN categories AS c ON f.id_category = c.id_cat WHERE name LIKE ? ORDER BY stt DESC";
		return jdbcTemplate.query(sql, new Object[] { reName }, new BeanPropertyRowMapper<Food>(Food.class));
	}

	public List<Food> getListNews(int id_cat, int offset) {
		String sql = "SELECT f.*,c.* FROM foods AS f INNER JOIN categories AS c ON f.id_category = c.id_cat WHERE id_cat = ? ORDER BY stt DESC LIMIT ?,?";
		return jdbcTemplate.query(sql, new Object[] { id_cat, offset, Defines.ROW_COUNT_ADMIN },
				new BeanPropertyRowMapper<Food>(Food.class));
	}

	public int getCount() {
		String sql = "SELECT COUNT(*) FROM foods WHERE check_food = 1";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

	public List<Food> getNewsGR(int offset) {
		String sql = "SELECT f.*,c.* FROM foods AS f INNER JOIN categories AS c ON f.id_category = c.id_cat WHERE check_food = 0 ORDER BY stt DESC LIMIT ?,?";
		return jdbcTemplate.query(sql, new Object[] { offset, Defines.ROW_COUNT_ADMIN },
				new BeanPropertyRowMapper<Food>(Food.class));
	}

	public int getCountGR() {
		String sql = "SELECT COUNT(*) FROM foods WHERE check_food = 0";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

	public int DelTam(String product_code) {
		String sql = "UPDATE foods SET check_food = 0 WHERE product_code LIKE ?";
		return jdbcTemplate.update(sql, new Object[] { product_code });
	}

	public int delAllTamNews(String product_code) {
		String sql = "UPDATE foods SET check_food = 0 WHERE product_code LIKE ?";
		return jdbcTemplate.update(sql, new Object[] { product_code });
	}

	public int restoreNews(String product_code) {
		String sql = "UPDATE foods SET check_food = 1 WHERE product_code LIKE ?";
		return jdbcTemplate.update(sql, new Object[] { product_code });
	}

	public List<Food> getListNewsGR(String name) {
		String reName = "%" + name + "%";
		String sql = "SELECT f.*,c.* FROM foods AS f INNER JOIN categories AS c ON f.id_category = c.id_cat WHERE name LIKE ? ORDER BY stt DESC";
		return jdbcTemplate.query(sql, new Object[] { reName }, new BeanPropertyRowMapper<Food>(Food.class));
	}

	public int getCount(int id_cat) {
		String sql = "SELECT COUNT(*) FROM foods WHERE check_food = 1 AND id_category = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { id_cat }, Integer.class);
	}

	public List<Food> getListPicture() {
		String sql = "SELECT f.*,c.* FROM foods AS f INNER JOIN categories AS c ON f.id_category = c.id_cat WHERE check_food = 1 ORDER BY RAND() LIMIT 4";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Food>(Food.class));
	}

	public List<Food> getListNews() {
		String sql = "SELECT f.*,c.* FROM foods AS f INNER JOIN categories AS c ON f.id_category = c.id_cat WHERE check_food = 1 ORDER BY RAND() LIMIT 8";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Food>(Food.class));
	}

	public List<Food> ogetListNewsID(int id_cat) {
		String sql = "SELECT f.*,c.* FROM foods AS f INNER JOIN categories AS c ON f.id_category = c.id_cat WHERE check_food = 1 AND id_category = ? ";
		return jdbcTemplate.query(sql, new Object[] { id_cat }, new BeanPropertyRowMapper<Food>(Food.class));
	}

	public List<Food> getListNewsNews() {
		String sql = "SELECT f.*,c.* FROM foods AS f INNER JOIN categories AS c ON f.id_category = c.id_cat WHERE check_food = 1 ORDER BY stt DESC LIMIT 3";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Food>(Food.class));
	}

	public List<Food> getListCats(Food food) {
		String sql = "SELECT f.*,c.* FROM foods AS f INNER JOIN categories AS c ON f.id_category = c.id_cat WHERE check_food = 1 AND id_category = ? ORDER BY stt DESC LIMIT 4";
		return jdbcTemplate.query(sql,new Object[] {food.getId_category()},new BeanPropertyRowMapper<Food>(Food.class));
	}

	public List<Food> getListNewsMN() {
		String sql = "SELECT f.*,c.* FROM foods AS f INNER JOIN categories AS c ON f.id_category = c.id_cat WHERE check_food = 1";
		return jdbcTemplate.query(sql,new BeanPropertyRowMapper<Food>(Food.class));
	}

	public List<Food> getListFood() {
		String sql = "SELECT COUNT(*) AS count,category_name FROM foods inner join categories on categories.id_cat = foods.id_category WHERE check_food = 1 GROUP BY foods.id_category";
		return jdbcTemplate.query(sql,new BeanPropertyRowMapper<Food>(Food.class));
	}

	public Food getFood(int stt) {
		String sql = "SELECT * FROM foods WHERE stt = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] {stt},new BeanPropertyRowMapper<Food>(Food.class));
	}

	public List<Food> getListFoodRand() {
		String sql = "SELECT f.*,c.* FROM foods AS f INNER JOIN categories AS c ON f.id_category = c.id_cat WHERE check_food = 1 ORDER BY RAND() LIMIT 4";
		return jdbcTemplate.query(sql,new BeanPropertyRowMapper<Food>(Food.class));
	}

	public int addDH(Food food, int id_cus,String date) {
		String sql = "INSERT INTO donhang(id_cus,product_name,product_price,quantity,picture,time_order,check_dh) VALUES (?,?,?,?,?,?,0)";
		return jdbcTemplate.update(sql, new Object[] {id_cus,food.getName(),food.getPrice(),food.getQuantity(),food.getImage(),date});
	}
}
