package vn.edu.vinaenter.model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import vn.edu.vinaenter.model.bean.Role;
import vn.edu.vinaenter.model.bean.User;

@Repository
public class UserDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private static final String LIST_USER = "SELECT * FROM users ORDER BY id DESC";
	private static final String DELETE_SQL = "DELETE FROM users WHERE id = ?";
	private static final String INSERT_SQL = "INSERT INTO users(fullname, role_id, password, username) VALUES(?,?,?,?)";
	private static final String ROLE_USER = "SELECT u.id, u.username, u.fullname, u.password,r.name , u.role_id AS u_role, r.role_id AS r_role FROM users AS u INNER JOIN roles AS r WHERE u.role_id= r.role_id AND u.id = ?";
	private static final String A_USER = "SELECT * FROM users WHERE id = ?";
	private static final String ROLE = "SELECT r.role_id, r.name, u.role_id, u.id FROM roles AS r INNER JOIN users AS u WHERE u.id = ? AND u.role_id = r.role_id";
	private static final String ALL_ROLE = "SELECT * FROM roles";
	private static final String ONE_USER = "SELECT id FROM users WHERE username = ?";
	private static final String UPDATE_SQL_NOT_PASS = "UPDATE users SET fullname = ?, role_id = ? WHERE id = ?";
	private static final String UPDATE_SQL_PASS = "UPDATE users SET fullname = ?, role_id = ?, password = ? WHERE id = ?";
	

	public List<User> getItems() {
		return jdbcTemplate.query(LIST_USER, new BeanPropertyRowMapper<User>(User.class));
	}

	public int delItem(int idUser) {
		return jdbcTemplate.update(DELETE_SQL, new Object[] {idUser});
	}

	public int addItem(User objUser) {
		return jdbcTemplate.update(INSERT_SQL, new Object[] {objUser.getFullname(), objUser.getRole_id(), objUser.getPassword(), objUser.getUsername()});
	}

	public User getItemById(int id) {
		return jdbcTemplate.queryForObject(A_USER, new Object[] { id },
				new BeanPropertyRowMapper<User>(User.class));
	}

	public Role getRole(int id) {
		return jdbcTemplate.queryForObject(ROLE, new Object[] { id },
				new BeanPropertyRowMapper<Role>(Role.class));
	}

	public List<Role> getRole() {
		return jdbcTemplate.query(ALL_ROLE, new BeanPropertyRowMapper<Role>(Role.class));
	}

	public User getIdByName(String currentName) {
		return jdbcTemplate.queryForObject(ONE_USER, new Object[] { currentName },
				new BeanPropertyRowMapper<User>(User.class));
	}
	
	public int updateById(User objUser) {
		return jdbcTemplate.update(UPDATE_SQL_NOT_PASS, new Object[] {objUser.getFullname(), objUser.getRole_id(), 
				objUser.getId()});
	}

	public int updateByIdPass(User objUser) {
		return jdbcTemplate.update(UPDATE_SQL_PASS, new Object[] {objUser.getFullname(), objUser.getRole_id(), objUser.getPassword(),
				objUser.getId()});
	}
	
}
