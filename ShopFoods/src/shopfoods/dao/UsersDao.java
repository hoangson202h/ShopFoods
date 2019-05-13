package shopfoods.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import shopfoods.constant.Defines;
import shopfoods.model.Customer;
import shopfoods.model.User;

@Repository
public class UsersDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<User> getListUser() {
		String sql = "SELECT * FROM users";
		return jdbcTemplate.query(sql,new BeanPropertyRowMapper<User>(User.class));
	}
	public List<User> getListUser(int offset) {
		String sql = "SELECT * FROM users LIMIT ?,?";
		return jdbcTemplate.query(sql,new Object[] {offset,Defines.ROW_COUNT_ADMIN},new BeanPropertyRowMapper<User>(User.class));
	}
	public int addUser(User user) {
		String sql = "INSERT INTO users(username,password,fullname,avatar,enable,role_id) VALUES (?,?,?,'',1,3)";
		return jdbcTemplate.update(sql, new Object[] {user.getUsername(),user.getPassword(),user.getFullname()});
	}

	public User getUser(int id_user) {
		String sql = "SELECt * FROM users WHERE id_user = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] {id_user},new BeanPropertyRowMapper<User>(User.class));
	}

	public int editUser(User user) {
		String sql = "UPDATE users SET username = ?,password = ?,fullname = ? ,avatar = ? WHERE id_user = ?";
		return jdbcTemplate.update(sql, new Object[] {user.getUsername(),user.getPassword(),user.getFullname(),user.getAvatar(),user.getId_user()});
	}

	public int delUser(int id_user) {
		String sql = "DELETE FROM users WHERE id_user = ?";
		return jdbcTemplate.update(sql, new Object[] {id_user});
	}

	public List<User> getListUser(String fullname) {
		String reFullname = "%" + fullname + "%";
		String sql = "SELECT * FROM users WHERE fullname LIKE ?";
		return jdbcTemplate.query(sql, new Object[] {reFullname},new BeanPropertyRowMapper<User>(User.class));
	}

	public int getCount() {
		String sql = "SELECT COUNT(*) FROM users";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	public User getUser(String name) {
		String sql = "SELECT * FROM users WHERE username = ? ORDER BY id_user DESC LIMIT 1";
		return jdbcTemplate.queryForObject(sql, new Object[] {name},new BeanPropertyRowMapper<User>(User.class));
	}
	public User getItem(int id_user) {
		String sql = "SELECT * FROM users WHERE id_user = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] {id_user},new BeanPropertyRowMapper<User>(User.class));
	}
	public User getUser(User userLG) {
		String sql = "SELECT * FROM users WHERE username = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] {userLG.getUsername()},new BeanPropertyRowMapper<User>(User.class));
	}
	public int getUserCk(User userLG) {
		String sql = "SELECT COUNT(*) FROM users WHERE username = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] {userLG.getUsername()}, Integer.class);
	}
	public int addUserPL(User user) {
		String sql = "INSERT INTO users(username,password,fullname,enable,role_id,avatar) VALUES (?,?,?,1,3,'')";
		return jdbcTemplate.update(sql, new Object[] {user.getUsername(),user.getPassword(),user.getFullname()});
	}
	public int addInfure(int id_user) {
		String sql = "INSERT INTO customer(id_user,name,email,county,address,phone,message,status,check_st) VALUES (?,'','',1,'','','',1,0)";
		return jdbcTemplate.update(sql, new Object[] {id_user});
	}
	public int update(Customer customer) {
		String sql = "UPDATE customer SET name = ?,email = ?,county = 1,address=?,phone=?,message=?,status = 0,check_st=0 WHERE id_user = ?";
		return jdbcTemplate.update(sql, new Object[] {customer.getName(),customer.getEmail(),customer.getAddress(),customer.getPhone(),customer.getMessage(),customer.getId_user()});
	}
	public int addCustomer(Customer customer,int id_user) {
		String sql = "INSERT INTO customer(id_user,name,email,address,phone,massage) VALUES (?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[] {customer.getName(),customer.getEmail(),customer.getAddress(),customer.getPhone(),customer.getMessage(),id_user});
	}
	public Customer getcus(int id_user) {
		String sql = "SELECT * FROM customer WHERE id_user = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] {id_user},new BeanPropertyRowMapper<Customer>(Customer.class));
	}
	public int addCus(Customer customer) {
		String sql = "INSERT INTO customer(id_user,name,email,county,address,phone,message,status,check_st) VALUES (0,?,?,?,?,?,?,0,0)";
		return jdbcTemplate.update(sql, new Object[] {customer.getName(),customer.getEmail(),customer.getCounty(),customer.getAddress(),customer.getPhone(),customer.getMessage()});
	}
	public int update1(Customer customer) {
		String sql = "UPDATE customer SET name = ?,email = ?,address=?,phone=?,message=?,status = 1,check_st=0 WHERE id_user = ?";
		return jdbcTemplate.update(sql, new Object[] {customer.getName(),customer.getEmail(),customer.getAddress(),customer.getPhone(),customer.getMessage(),customer.getId_user()});
	}
	public int addCus1(Customer customer) {
		String sql = "INSERT INTO customer(id_user,name,email,address,phone,message,status,check_st) VALUES (0,?,?,?,?,?,1,0)";
		return jdbcTemplate.update(sql, new Object[] {customer.getName(),customer.getEmail(),customer.getAddress(),customer.getPhone(),customer.getMessage()});
	}
	public Customer getcus() {
		String sql = "SELECT * FROM customer ORDER BY id_cus DESC LIMIT 1";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<Customer>(Customer.class));
	}
	
}
