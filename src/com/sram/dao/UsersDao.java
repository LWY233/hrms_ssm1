package com.sram.dao;

import com.sram.entity.Users;

import java.util.List;

public interface UsersDao {
	public Users selectone(String uno, String password);
	
	public List<Users> selectALL();
	
	public int insert(Users user);
	
	public int delete(Integer uid);
	
	public int update(Users user);
}
