package com.sram.dao;

import com.sram.entity.Tax;

import java.util.List;

public interface TaxDao {
	public List<Tax> selectAll();
}
