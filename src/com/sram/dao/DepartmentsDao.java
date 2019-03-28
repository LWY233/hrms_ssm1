package com.sram.dao;

import com.sram.entity.Departments;

import java.util.List;

public interface DepartmentsDao {
	public List<Departments> selectAll();
	
	public Departments selectOne(int did);
	
	public Departments selectdepart(Departments departments);
	
	public int insert(Departments departments);
	
	public int update(Departments departments);
	
	public int delete(int did);
}
