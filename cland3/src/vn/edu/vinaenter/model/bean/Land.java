package vn.edu.vinaenter.model.bean;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;

public class Land {
	private int lid;
	private int count_views;
	private int cid;
	private double area;
	private Timestamp date_create;
	private String picture;
	@NotEmpty(message = "Vui lòng nhập vào tên tin")
	private String lname;
	@NotEmpty(message = "Vui lòng nhập vào mô tả")
	private String description;
	@NotEmpty(message = "Vui lòng nhập vào địa chỉ")
	private String address;
	private String cname;
	@NotEmpty(message = "Vui lòng nhập vào chi tiết")
	private String detail;

	public Land() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Land(int lid, int count_views, int cid, double area, Timestamp date_create, String picture,
			@NotEmpty(message = "Vui lòng nhập vào tên tin") String lname,
			@NotEmpty(message = "Vui lòng nhập vào mô tả") String description,
			@NotEmpty(message = "Vui lòng nhập vào địa chỉ") String address, String cname,
			@NotEmpty(message = "Vui lòng nhập vào chi tiết") String detail) {
		super();
		this.lid = lid;
		this.count_views = count_views;
		this.cid = cid;
		this.area = area;
		this.date_create = date_create;
		this.picture = picture;
		this.lname = lname;
		this.description = description;
		this.address = address;
		this.cname = cname;
		this.detail = detail;
	}

	public int getLid() {
		return lid;
	}

	public void setLid(int lid) {
		this.lid = lid;
	}

	public int getCount_views() {
		return count_views;
	}

	public void setCount_views(int count_views) {
		this.count_views = count_views;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public double getArea() {
		return area;
	}

	public void setArea(double area) {
		this.area = area;
	}

	public Timestamp getDate_create() {
		return date_create;
	}

	public void setDate_create(Timestamp date_create) {
		this.date_create = date_create;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

}
