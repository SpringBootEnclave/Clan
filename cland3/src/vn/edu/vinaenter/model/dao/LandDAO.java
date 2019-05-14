package vn.edu.vinaenter.model.dao;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import vn.edu.vinaenter.model.bean.Land;

@Repository
public class LandDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private static final String FIND_ALL = "SELECT l.lid, l.lname, l.description, l.detail, l.date_create, l.cid, c.cname, l.picture, l.area, l.address, l.count_views"
											+ " FROM lands as l INNER JOIN categories as c ON l.cid = c.cid ORDER BY l.lid DESC";
	private static final String INSERT_SQL = "INSERT INTO lands(lname, description, detail, cid, picture, area, address)"
											+ " VALUES(?,?,?,?,?,?,?)";
	private static final String TOTAL_LAND = "SELECT COUNT(*) as totalLand FROM lands as l INNER JOIN categories as c ON l.cid = c.cid";
	private static final String FIND_ALL_BY_PAGINATION = "SELECT l.lid, l.lname, l.description, l.detail, l.date_create, l.cid, c.cname, l.picture, l.area, l.address, l.count_views"
			+ " FROM lands as l INNER JOIN categories as c ON l.cid = c.cid ORDER BY l.lid DESC LIMIT ?,?";
	private static final String FIND_LAND_BY_CAT = "SELECT l.lid, l.lname, l.description, l.detail, l.date_create, l.cid, c.cname, l.picture, l.area, l.address, l.count_views"
			+ " FROM lands as l INNER JOIN categories as c ON l.cid = c.cid WHERE c.cid = ? ORDER BY l.lid DESC";
	private static final String FIND_LAND_BY_ID = "SELECT l.lid, l.lname, l.description, l.detail, l.date_create, l.cid, c.cname, l.picture, l.area, l.address, l.count_views"
			+ " FROM lands as l INNER JOIN categories as c ON l.cid = c.cid WHERE l.lid = ?";
	private static final String FIND_LAND_OTHER_CAT = "SELECT l.lid, l.lname, l.description, l.detail, l.date_create, l.cid, c.cname, l.picture, l.area, l.address, l.count_views"
			+ " FROM lands as l INNER JOIN categories as c ON l.cid = c.cid WHERE c.cid = ? AND NOT l.lid = ? ORDER BY l.lid DESC LIMIT 3";
	private static final String FIND_MOST_VIEW = "SELECT l.lid, l.lname, l.description, l.detail, l.date_create, l.cid, c.cname, l.picture, l.area, l.address, l.count_views"
			+ " FROM lands as l INNER JOIN categories as c ON l.cid = c.cid ORDER BY l.count_views DESC LIMIT 5";
	private static final String COUNT_ITEM_CAT = "SELECT COUNT(*) FROM lands WHERE cid = ?";
	private static final String DELETE_SQL = "DELETE FROM lands WHERE lid = ?";
	
	private static final String FIND_ONE_BY_LID = "SELECT lid, lname, description, detail, date_create, lands.cid, picture, area, address, count_views, cname FROM lands INNER JOIN categories ON categories.cid = lands.cid WHERE lid = ?";
	private static final String UPDATE_ONE = "UPDATE lands SET lname = ?, description = ?, detail = ?, cid = ?, picture = ?, area = ?, address = ? WHERE lid = ?";
	private static final String FIND_ONE_BY_LID_PRE = "SELECT lid FROM lands WHERE lid < ? ORDER BY lid DESC LIMIT 1";
	private static final String FIND_ONE_BY_LID_NEXT = "SELECT lid FROM lands WHERE lid > ? LIMIT 1";
	private static final String FIND_LAND_BY_SEARCH = "SELECT lid, lname, description, detail, date_create, lands.cid, picture, area, address, count_views, cname FROM lands INNER JOIN categories ON categories.cid = lands.cid WHERE lname LIKE ? ORDER BY lid DESC";
	
	
	public List<Land> getItems(){
		return jdbcTemplate.query(FIND_ALL, new BeanPropertyRowMapper<Land>(Land.class));
	}
	
	public int addItem(Land objLand) {
		return jdbcTemplate.update(INSERT_SQL, new Object[] {objLand.getLname(), objLand.getDescription(), objLand.getDetail(), objLand.getCid(), objLand.getPicture(), objLand.getArea(), objLand.getAddress()});
	}
	
	public int countItems() {
		return jdbcTemplate.queryForObject(TOTAL_LAND, Integer.class);
	}
	public List<Land> getItemsByPagination(int offset, int row_count){
		return jdbcTemplate.query(FIND_ALL_BY_PAGINATION,new Object[] {offset, row_count} , new BeanPropertyRowMapper<Land>(Land.class));
	}

	public List<Land> getItemByIdCat(int idCat) {
		return jdbcTemplate.query(FIND_LAND_BY_CAT, new Object[] {idCat}, new BeanPropertyRowMapper<Land>(Land.class));
	}

	public Land getItemById(int idLand) {
		return jdbcTemplate.queryForObject(FIND_LAND_BY_ID, new Object[] {idLand}, new BeanPropertyRowMapper<Land>(Land.class));
	}
	
	public List<Land> getItemOther(int idLand, int idCat){
		return jdbcTemplate.query(FIND_LAND_OTHER_CAT, new Object[] {idCat, idLand}, new BeanPropertyRowMapper<Land>(Land.class));
	}
	
	public List<Land> getMostView(){
		return jdbcTemplate.query(FIND_MOST_VIEW, new BeanPropertyRowMapper<>(Land.class));
	}
	
	public int getCountItemCat(int cid) {
		return jdbcTemplate.queryForObject(COUNT_ITEM_CAT, new Object[] {cid}, Integer.class);
	}

	public int delItem(int idLand) {
		return jdbcTemplate.update(DELETE_SQL, new Object[] {idLand});
	}

	public Land getItemByLid(int lid) {
		return jdbcTemplate.queryForObject(FIND_ONE_BY_LID, new Object[] { lid },
				new BeanPropertyRowMapper<Land>(Land.class));
	}

	public int editItem(Land objLand) {
		return jdbcTemplate.update(UPDATE_ONE,
				new Object[] { objLand.getLname(), objLand.getDescription(), objLand.getDetail(), objLand.getCid(),
						objLand.getPicture(), objLand.getArea(), objLand.getAddress(), objLand.getLid() });
	} 
	
	public Land getItemPre(int lid) {
		return jdbcTemplate.queryForObject(FIND_ONE_BY_LID_PRE, new Object[] { lid },
				new BeanPropertyRowMapper<Land>(Land.class));
	}
	
	public Land getItemNext(int lid) {
		return jdbcTemplate.queryForObject(FIND_ONE_BY_LID_NEXT, new Object[] { lid },
				new BeanPropertyRowMapper<Land>(Land.class));
	}

	public List<Land> getItemsBySearch(String search) {
		return jdbcTemplate.query(FIND_LAND_BY_SEARCH, new Object[] { "%" + search + "%" },
				new BeanPropertyRowMapper<Land>(Land.class));
	}
}
