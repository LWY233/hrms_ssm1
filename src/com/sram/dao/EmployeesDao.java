package com.sram.dao;

import com.sram.entity.Employees;
import com.sram.web.common.PageParam;

import java.util.List;

public interface EmployeesDao {
	public Employees selectOne(String eno);
	
	public List<Employees> selectAll();
	
	public List<Employees> selectDepart(int did);
	
	public int update(Employees employees);
	
	public int insert(Employees employees);
	
	public int delete(String eno);
	
	public List<Employees> page(PageParam p);
	
	public Employees selectemploy(Employees employees);
	
	public Employees getEmployees(int eid);
	
	public Employees getEmployeesByEno(String eno);
	
	public List<Employees> getEmployeesByEmployees(Employees e);
}
