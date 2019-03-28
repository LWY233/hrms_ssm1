package com.sram.dao;

import com.sram.entity.RewardAndPunish;
import com.sram.web.common.PageParam;

import java.util.List;

public interface RapDao {
	public List<RewardAndPunish> page(PageParam p);
	public int insertrap(RewardAndPunish rap);
	public List<RewardAndPunish> selectByRap(RewardAndPunish rap);
	public RewardAndPunish getrapByid(int id);
	public int updaterap(RewardAndPunish rap);
}
