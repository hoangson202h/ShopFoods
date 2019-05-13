package shopfoods.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import shopfoods.constant.Defines;
import shopfoods.model.Order;

@Repository
public class OrderDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public int delOrder(int id_cus) {
		String sql ="DELETE FROM donhang WHERE id_cus = ? ";
		return jdbcTemplate.update(sql,new Object[] {id_cus});
	}

	public List<Order> getListOrder(int id_cus) {
		String sql = "SELECT * FROM donhang WHERE id_cus = ? AND check_dh = 0";
		return jdbcTemplate.query(sql, new Object[] {id_cus},new BeanPropertyRowMapper<Order>(Order.class));
	}
	public List<Order> getListOrd(int id_cus,int offset) {
		String sql = "SELECT * FROM donhang WHERE id_cus = ? AND check_dh=0  LIMIT ?,?";
		return jdbcTemplate.query(sql, new Object[] {id_cus,offset,Defines.ROW_COUNT_ADMIN},new BeanPropertyRowMapper<Order>(Order.class));
	}
	public List<Order> getListMyOrder(int id_cus,int offset) {
		String sql = "SELECT * FROM donhang WHERE id_cus = ? AND check_dh=1  LIMIT ?,?";
		return jdbcTemplate.query(sql, new Object[] {id_cus,offset,Defines.ROW_COUNT_ADMIN},new BeanPropertyRowMapper<Order>(Order.class));
	}
	public int getCount(int id_cus) {
		String sql = "SELECT COUNT(*) FROM donhang WHERE check_dh = 0 AND id_cus = ?";
		return jdbcTemplate.queryForObject(sql,new Object[] {id_cus},Integer.class);
	}

	public int getCount() {
		String sql = "SELECT COUNT(*) FROM donhang WHERE check_dh = 1 AND time_order LIKE '%May%'";
		return jdbcTemplate.queryForObject(sql,Integer.class);
	}

	public List<Order> getListOrd() {
		String sql = "SELECT * FROM donhang WHERE check_dh=1 AND time_order LIKE '%May%'";
		return jdbcTemplate.query(sql,new BeanPropertyRowMapper<Order>(Order.class));
	}

	public List<Order> getListOrdMonth(String year1, String month1) {
		String sql = "SELECT * FROM donhang WHERE check_dh=1 AND time_order LIKE ? AND time_order LIKE ?";
		return jdbcTemplate.query(sql,new Object[] {year1,month1},new BeanPropertyRowMapper<Order>(Order.class));
	}
}
