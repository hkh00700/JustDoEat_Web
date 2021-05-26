package admin;

import java.sql.Date;

public class RestrantVO {
	public String restaurant;
	public String r_latitude;
	public String r_hardness;
	public String r_address;
	
	public String r_tel;
	public String r_menu;
	public String r_imgpath;
	public int m_uq;
	public Date hire_data;
		
	public int r_uq;
	
	public String search;
	public String keyword;
	
	
	
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getR_uq() {
		return r_uq;
	}
	public void setR_uq(int r_uq) {
		this.r_uq = r_uq;
	}
	public String getR_latitude() {
		return r_latitude;
	}
	public void setR_latitude(String r_latitude) {
		this.r_latitude = r_latitude;
	}
	public String getR_hardness() {
		return r_hardness;
	}
	public void setR_hardness(String r_hardness) {
		this.r_hardness = r_hardness;
	}

	
	public Date getHire_data() {
		return hire_data;
	}
	public void setHire_data(Date hire_data) {
		this.hire_data = hire_data;
	}
	public String getRestaurant() {
		return restaurant;
	}
	public void setRestaurant(String restaurant) {
		this.restaurant = restaurant;
	}
	
	public String getR_address() {
		return r_address;
	}
	public void setR_address(String r_address) {
		this.r_address = r_address;
	}
	public String getR_tel() {
		return r_tel;
	}
	public void setR_tel(String r_tel) {
		this.r_tel = r_tel;
	}
	public String getR_menu() {
		return r_menu;
	}
	public void setR_menu(String r_menu) {
		this.r_menu = r_menu;
	}
	public String getR_imgpath() {
		return r_imgpath;
	}
	public void setR_imgpath(String r_imgpath) {
		this.r_imgpath = r_imgpath;
	}
	public int getM_uq() {
		return m_uq;
	}
	public void setM_uq(int m_uq) {
		this.m_uq = m_uq;
	}

	
}
