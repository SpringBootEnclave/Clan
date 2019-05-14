package vn.edu.vinaenter.model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import vn.edu.vinaenter.model.bean.Category;

@Repository
public class CategoryDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private static final String FIND_ALL = "SELECT * FROM categories ORDER BY cid DESC";
	private static final String INSERT_SQL = "INSERT INTO categories(cname) VALUES(?)";
	private static final String FIND_ONE_BY_ID = "SELECT cid, cname FROM categories WHERE cid = ?";
	private static final String UPDATE_SQL = "UPDATE categories SET cname = ? WHERE cid = ?";
	private static final String DELETE_SQL = "DELETE FROM categories WHERE cid = ?";
	private static final String FIND_HOT = "SELECT * FROM categories ORDER BY cid DESC";
	
	
	public List<Category> getItems(){
		return jdbcTemplate.query(FIND_ALL, new BeanPropertyRowMapper<Category>(Category.class));
	}

	public int addItem(Category objCat) {
		return jdbcTemplate.update(INSERT_SQL, new Object[] {objCat.getCname()});
	}
	
	public Category getItemById(int cid) {
		return jdbcTemplate.queryForObject(FIND_ONE_BY_ID, new Object[] {cid}, new BeanPropertyRowMapper<>(Category.class));
	}
	
	public int updateItem(String nameCat, int idCat) {
		return jdbcTemplate.update(UPDATE_SQL, new Object[] {nameCat, idCat});
	}

	public int delItem(int idCat) {
		return jdbcTemplate.update(DELETE_SQL, new Object[] {idCat});
	}

	public List<Category> getHotItems() {
		return jdbcTemplate.query(FIND_HOT, new BeanPropertyRowMapper<>(Category.class));
	}

	public Category getItemByCid(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}
}
