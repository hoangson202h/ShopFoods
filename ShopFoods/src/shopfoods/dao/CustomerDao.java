package shopfoods.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import shopfoods.constant.Defines;
import shopfoods.model.Customer;

@Repository
public class CustomerDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<Customer> getListCus(int offset) {
		String sql = "SELECT * FROM customer WHERE check_st != 2 AND name != '' LIMIT ?,?";
		return jdbcTemplate.query(sql,new Object[] {offset,Defines.ROW_COUNT_ADMIN}, new BeanPropertyRowMapper<Customer>(Customer.class));
	}

	public int delCus(int id_cus) {
		String sql = "DELETE FROM customer WHERE id_cus = ?";
		return jdbcTemplate.update(sql,new Object[] {id_cus});
	}

	public Customer getCustomer(int id_cus) {
		String sql = "SELECT * FROM customer WHERE id_cus = ?";
		return jdbcTemplate.queryForObject(sql,new Object[] {id_cus},new BeanPropertyRowMapper<Customer>(Customer.class));
	}
	public Customer getCustomerID(int id_user) {
		String sql = "SELECT * FROM customer WHERE id_user = ?";
		return jdbcTemplate.queryForObject(sql,new Object[] {id_user},new BeanPropertyRowMapper<Customer>(Customer.class));
	}
	public int update(int check_st, int id_cus) {
		String sql = "UPDATE customer SET check_st = ? WHERE id_cus = ?";
		return jdbcTemplate.update(sql, new Object[] {check_st,id_cus});
	}

	public int getCount() {
		String sql = "SELECT COUNT(*) FROM customer WHERE check_st !=2";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

	public int updateDH(int id_cus) {
		String sql = "UPDATE donhang SET check_dh = 1 WHERE id_cus = ?";
		return jdbcTemplate.update(sql, new Object[] {id_cus});
	}

	public int getCustomercheck(int id_user) {
		String sql = "SELECT COUNT(*) FROM customer WHERE id_user = ?";
		return jdbcTemplate.queryForObject(sql,new Object[] {id_user},Integer.class);
	}

}
