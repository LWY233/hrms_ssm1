package com.sram.dao;

import com.sram.entity.Menu;

import java.util.List;

public interface MenuDao {
	public List<Menu> getAll(int type);
	
	public List<Menu> getChilds(int id, int type);
}
