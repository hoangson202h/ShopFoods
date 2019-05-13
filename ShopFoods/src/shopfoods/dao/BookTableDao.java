package shopfoods.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import shopfoods.model.BookTable;

@Repository
public class BookTableDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public int addTable(BookTable bookTbale) {
		String sql = "INSERT INTO booktable(fname,lname,date,time,number,phone,message,check_tb) VALUES (?,?,?,?,?,?,?,0)";
		return jdbcTemplate.update(sql,new Object[] {bookTbale.getFname(),bookTbale.getLname(),bookTbale.getDate(),bookTbale.getTime(),bookTbale.getNumber(),bookTbale.getPhone(),bookTbale.getMessage()});
	}

	public int checkBook(BookTable bookTable) {
		String sql = "SELECT COUNT(*) FROM booktable WHERE date=? AND number=? AND time =?";
		return jdbcTemplate.queryForObject(sql, new Object[] {bookTable.getDate(),bookTable.getNumber(),bookTable.getTime()},Integer.class);
	}

	public List<BookTable> getList(String date) {
		String sql= "SELECT * FROM booktable WHERE check_tb=0 AND date=? ORDER BY id DESC";
		return jdbcTemplate.query(sql,new Object[] {date},new BeanPropertyRowMapper<BookTable>(BookTable.class));
	}
	public List<BookTable> getList( ) {
		String sql= "SELECT * FROM booktable WHERE check_tb=0 ORDER BY id DESC";
		return jdbcTemplate.query(sql,new BeanPropertyRowMapper<BookTable>(BookTable.class));
	}

	public int del(int id) {
		String sql = "DELETE FROM booktable WHERE id=?";
		return jdbcTemplate.update(sql, new Object[] {id});
	}

	public int update(int id, int check_tb) {
		String sql = "UPDATE booktable SET check_tb =? WHERE id=?";
		return jdbcTemplate.update(sql, new Object[] {check_tb,id});
	}

	public List<BookTable> getListHistory() {
		String sql= "SELECT * FROM booktable WHERE check_tb=1 ORDER BY id DESC";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<BookTable>(BookTable.class));
	}
	public List<BookTable> getListHistory(String date) {
		String sql= "SELECT * FROM booktable WHERE check_tb=1 AND date=? ORDER BY id DESC";
		return jdbcTemplate.query(sql,new Object[] {date},new BeanPropertyRowMapper<BookTable>(BookTable.class));
	}

}
