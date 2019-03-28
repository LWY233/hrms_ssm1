package com.sram.dao;

import com.sram.entity.Leave;
import com.sram.web.common.PageParam;

import java.util.List;

public interface LeaveDao {
	
	public int insert(Leave leave);
	
	public int update(Leave leave);
	
	public int delete(int id);
	
	public Leave selectOne(int id);
	
	public List<Leave> selectAll();
	
	public Leave select(Leave leave);
	
	public List<Leave> page(PageParam p);
}
